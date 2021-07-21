import os
from os import listdir
#from dotenv import load_dotenv
import json
import requests
import time
import glob
from flask import Flask, render_template, request, redirect, url_for
from flask_bootstrap import Bootstrap
import random
import time
import fnmatch

#load_dotenv()

app = Flask(__name__)
bootstrap = Bootstrap(app)

def getImgs():
	img_list=[]
	for file in listdir('/images/'):
		    if fnmatch.fnmatch(file, '*.jpg'):
			img_list.append(file)
	return random.choice(img_list)

@app.route('/')
def sendImgs():
	return render_template('index.html', imgs=getImgs())
