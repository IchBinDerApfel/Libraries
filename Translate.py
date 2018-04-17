
import json
import requests
import sys
import win32api
sourceText = ''
sourceLang = 'auto';
targetLang = 'eng'
word = ""
i = len(sys.argv)
for i in range(len(sys.argv)):
    if i >= 1:
        word = word + " " + sys.argv[i]
var1 = str(word.split("|")[1])
var2 = str(word.split("|")[0])
targetLang = var1.strip()
word = var2.strip()
url = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=" + 'auto' + "&tl=" + targetLang + "&dt=t&q=" + word
response = requests.get(url).json()
words = response[0][0][0]
win32api.MessageBox(0, words, 'Python Action Complete') 
