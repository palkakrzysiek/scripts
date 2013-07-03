#! /usr/bin/python3

import sys, os
import xml.etree.ElementTree as ET
import re

try:
    if sys.argv[1] == '.':
        path = os.getcwd()
    else:
        path = sys.argv[1]
    startFile = int(sys.argv[2])
    endFile = int(sys.argv[3])
    fileStep = int(sys.argv[4])
except:
    print("Usage:", sys.argv[0], "path, startFile, endFile, fileStep")
    exit(1)

const='{http://www.supermemo.net/2006/smux}'
for n in range(startFile, endFile, fileStep):
    filename = ''.join(('item', '{:05d}'.format(n), '.xml'))
    try:
        tree = ET.parse(filename)
        root = tree.getroot()
    except:
        print('cannot open file:', filename)
        continue

    str_group = root.find(''.join((const, 'lesson-title'))).text
    question = root.find(''.join((const, 'question')))
    if question.find(''.join((const, 'gfx'))) is not None:
        isImage = True
    else:
        isImage = False
    str_wordType = question.find(''.join((const, 'em'))).text
    str_wordType = str_wordType[1:-1] # delete brackets
    try:
        str_question = question.find(''.join((const, 'strong'))).text
    except:
        str_question = question.find(''.join((const,
            'text'))).find(''.join((const,
            'sentence'))).find(''.join((const, 'strong'))).text

    try:
        str_translation = question.find(''.join((const,
            'text'))).find(''.join((const,
            'translation'))).find(''.join((const, 'big'))).text
    except:
        str_translation = question.find(''.join((const,
            'text'))).find(''.join((const,
            'translation'))).text


    try:
        str_cloze = question.find(''.join((const,
            'p'))).find(''.join((const,
            'text'))).find(''.join((const, 'sentence'))).text
    except:
        str_cloze = re.sub(r'.*(\(z\. B\..*\)).*', r'\1',
            str(ET.tostring(question)))

    answer = root.find(''.join((const, 'answer')))

    print(str(ET.tostring(answer)))
    
    str_collocations = re.sub(r'.*Kollokation:</ns0:small>\\n<ns0:p class="ex">(.*?)</ns0:p>.*', r'\1',
            ET.tostring(answer).decode())




    print(n, str_group, isImage, str_wordType, str_question,
            str_translation, str_cloze)
    #for child in root:
       #print(child, child.tag, child.attrib, child.text)


