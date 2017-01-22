import java.io.{File, PrintWriter}

import scala.io.Source
import scala.util.Try
import scala.util.matching.Regex
import scala.xml.{Node, XML}


/**
  * Script converting the data from unpacked English Grammar Test apk to
  * a tab-separated format, which can be imported by Anki SRS.
  */
object TestDataParser extends App {
  val wwwDirectory = args(0)
  val outputCsv = args(1)

  case class LevelDef(levelName: String, themes: Seq[String], filesSuffix: String)

  case class Question(question: String, possibleAnswers: Seq[String], answer: String, explanation: String, levelName: String, theme: String)

  def parseLevelCase: String => LevelDef = in => {
    val levelName = "pageTitle=\"(.*)\"".r.findFirstMatchIn(in).get.group(1)
    val themes: Array[String] = for {
      theme <- "themes= \\[\"(.*)\"\\]".r.findFirstMatchIn(in).get.group(1).split("\",")
    } yield theme.replace("\"", "").replace("[", "").replace("]", "")
    val filesSuffix = "testRes(\\d*.json)".r.findFirstMatchIn(in).get.group(1)
    val filesSuffixWithoutExtension = filesSuffix.substring(0, filesSuffix.indexOf(".json"))

    LevelDef(levelName, themes, filesSuffixWithoutExtension)
  }

  def getQuestions(dataPath: String, levelDef: LevelDef): Seq[Question] = {
    val questionsXml = XML.loadFile(dataPath + "\\tests" + levelDef.filesSuffix + ".xml")
    val correctAnswersFile = Source.fromFile(dataPath + "\\corrAns" + levelDef.filesSuffix + ".json").getLines().mkString
    val correctAnswersIdxs = correctAnswersFile.replace("[", "").replace("]", "").replace("\uFEFF", "").split(",") map (_.toInt - 1)
    val questionsWithTopics = (for {
      tests <- questionsXml \\ "tests" \\ "test"
      question <- (tests \\ "question").zip(levelDef.themes)
    } yield question).zip(correctAnswersIdxs)
    val listOfQuestions: Seq[Question] = questionsWithTopics
      .map {
        case (((node: Node, topic: String), idx: Int)) => {
          val currentQuestion = (node \\ "task").text.replace("\t", "").replace("\n", "<br />")
          val currentPossibleAnswers = (node \\ "var").map(_.text.replace("\t", "").replace("\n", "<br />"))
          val currentAnswer = currentPossibleAnswers(idx).replace("\t", "").replace("\n", "<br />")
          val explanation = (node \\ "exp").text.replace("\t", "").replace("\n", "<br />")
          Question(question = currentQuestion, possibleAnswers = currentPossibleAnswers, answer = currentAnswer, explanation, levelName = levelDef.levelName, theme = topic)
        }
      }

    listOfQuestions
  }

  val levelJsPath = wwwDirectory + "/js/level.js"
  val levelJsSource = Source.fromFile(levelJsPath)
  val levelsCode = Try(levelJsSource.getLines().mkString("\n")).get
  levelJsSource.close()
  val levelsDefinitionsStart = levelsCode.indexOf("switch (localTemp.currentLevel)")
  val levelsDefinitionsEnd = levelsCode.indexOf("tabSelect();", levelsDefinitionsStart)
  val levelsDefinitions = levelsCode.substring(levelsDefinitionsStart, levelsDefinitionsEnd)
  val levelsCasesRegexp: Regex = """case "\d+":((?s).*?)break;""".r
  val levelsCases = for {
    matched <- levelsCasesRegexp.findAllIn(levelsDefinitions)
  } yield parseLevelCase(matched)

  val resultSeq: Iterator[Question] = levelsCases.flatMap((levelDef: LevelDef) => {
    getQuestions(wwwDirectory + "/data", levelDef)
  })

  var counter = 1
  val csv = resultSeq.foldLeft(new StringBuilder(""))((prev: StringBuilder, current: Question) => {
    counter += 1
    prev append counter append "\t" append current.question append  "\t" append "<ul>" append
      current.possibleAnswers.map("<li>" + _ + "</li>").mkString append "</ul>\t" append
      current.answer append "\t" append current.explanation append "\t" append
      current.theme.replace(" ", "") append " " append current.levelName.replace(" ", "") append "\n"
  })
  val pw = new PrintWriter(new File(outputCsv))
  pw.write(csv.mkString)
  pw.close()
}
