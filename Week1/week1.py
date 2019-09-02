#all imports 
import io
from unidecode import unidecode
import unicodedata
import re
import string
import argparse
import codecs
from nltk import FreqDist

#constants
arabic_punctuations = '''`÷×؛<>_۔()*&^%][ـ،/:"؟‘’.,'{}~¦+|!”…“–ـ'''
english_punctuations = string.punctuation
punctuations_list = arabic_punctuations + english_punctuations
arabic_diacritics = re.compile("""
							 ّ    | # Tashdid
							 َ    | # Fatha
							 ً    | # Tanwin Fath
							 ُ    | # Damma
							 ٌ    | # Tanwin Damm
							 ِ    | # Kasra
							 ٍ    | # Tanwin Kasr
							 ْ    | # Sukun
							 ـ     # Tatwil/Kashida
							’	 | # ulta comma
							‘	 | # ulta comma 2
						 """, re.VERBOSE)

#Open file function it return all the contents of 
def openfile():
	f = io.open("corpus.txt", mode="r", encoding="utf-8")
	if f.mode == 'r':
		contents = f.read()
		return contents

#normalizing
def normalize_arabic(text):
	text = re.sub("[إأآا]", "ا", text)
	text = re.sub("ى", "ي", text)
	text = re.sub("ؤ", "ء", text)
	text = re.sub("ئ", "ء", text)
	text = re.sub("ة", "ه", text)
	text = re.sub("گ", "ك", text)
	return text


#remove diacritics
def remove_diacritics(text):
	text = re.sub(arabic_diacritics, '', text)
	return text

#remove punctuations 
def remove_punctuations(text):
	translator = str.maketrans('', '', punctuations_list)
	return text.translate(translator)

#remove repeating chars
def remove_repeating_char(text):
	return re.sub(r'(.)\1+', r'\1', text)

#couting unique words return list 
def counter(text):	
	freqDist = FreqDist(text)
	uniqueWords = freqDist.most_common()
	for i in range(len(uniqueWords)):
		print(uniqueWords[i])
	return uniqueWords

#writing a list
def writeInFile(list):
	file = codecs.open("commonWords.txt", "w", "utf-8")
	for i in range(len(list)):
		print(list[i])
		values = ",".join(map(str, list[i]))
		print(values)
		file.write(values + "\r\n")
	file.close()

#main functions
def main(): 
	#manipulating text
	text = openfile()
	text = remove_punctuations(text)
	text = remove_diacritics(text)
	text = remove_repeating_char(text)

	#writing text
	file = codecs.open("normalizedText.txt", "w", "utf-8")
	file.write(text)
	file.close()


	#spliting text
	splitted_data = text.split(" ")

	#getting couting unique words
	common_words = counter(splitted_data)

	writeInFile(common_words)

#calling main	
main()
