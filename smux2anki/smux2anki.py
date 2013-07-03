#! /usr/bin/python3
"""
* Unpack course and path (the second one by changing extinction)
* Move folder with path to course
* Check the firs xml file that contains first type of exercise (usually
  00101)
* Check the numer of types of exercises and step with which firs type
  repeats
* check if file and folder names are correct (itemxxxxx.xml,
  media/.....q.mp3 and so on. For example 35235b.pn 37679q.mp can be changed
  with rename -n 's/mp/mp3/' *
"""
import sys, os
import re
import shutil

try:
    if sys.argv[1] == '.':
        path = os.getcwd()
    else:
        path = os.path.join(os.getcwd(), sys.argv[1])
    startFile = int(sys.argv[2])
    endFile = int(sys.argv[3])
    fileStep = int(sys.argv[4])
    files_prefix = sys.argv[5]
except:
    print("Usage:", sys.argv[0], "path, startFile, endFile, fileStep, files_prefix")
    exit(1)

fo = open(''.join((files_prefix, '.tab')), 'w')
for n in range(startFile, endFile, fileStep):
    filename = ''.join(('item', '{:05d}'.format(n), '.xml'))
    image = ''.join(('<img src="', files_prefix, '_', '{:05d}'.format(n), 'b.png" />'))
    question_audio = ''.join(('[sound:', files_prefix, '_', '{:05d}'.format(n), 'q.mp3]'))
    answer_audio = ''.join(('[sound:', files_prefix, '_', '{:05d}'.format(n), 'a.mp3]'))
    try:
        file = open(os.path.join(path, filename))
        print(filename)
    except:
        print('cannot open file:', os.path.join(path, filename))
        continue
    content = file.read()
    file.close()

    try:
        os.mkdir(files_prefix)
    except:
        pass
    for suffix in ('q.mp3', 'a.mp3', 'b.png'):
        src=os.path.join(path, 'media', '{:05d}{}'.format(n, suffix))
        dest=os.path.join(os.getcwd(), files_prefix, '{}_{:05d}{}'.format(files_prefix,
            n, suffix))
        try:
            shutil.copy(src, dest)
        except:
            if suffix == 'b.png':
                image = ''
            print('Cannot copy from', src, 'to', dest)


    content = content.replace('<sfx file="c" inline="true"/>', '')
    content = content.replace('<gfx file="b" scale-base="1024" float="right"/>', image)
    content = content.replace('<sentence', '<span class="sentence"')
    content = content.replace('</sentence', '</span')
    content = content.replace('<translation', ' <span class="translation"')
    content = content.replace('</translation', '</span')
    content = content.replace('<text autoshow="true"', '<span class="text autoshow"')
    content = content.replace('<text', '<span class="text"')
    content = content.replace('</text', '</span')
    content = content.replace('\n', '')

    question_title = re.sub(r'.*<question-title>(.*)</question-title>.*', r'\1', content)
    lesson_title = re.sub(r'.*<lesson-title>(.*)</lesson-title>.*', r'\1', content)
    question = re.sub(r'.*<question>(.*)</question>.*', r'\1', content)
    question = ' '.join((question_audio, question))
    answer = re.sub(r'.*<answer>(.*)</answer>.*', r'\1', content)
    answer = ' '.join((answer_audio, answer))

    card= '\t'.join((question, answer, question_title, lesson_title,
        lesson_title.replace(' ','_').replace(',','')))
    fo.write(''.join((card, '\n')))

fo.close()
