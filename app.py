from flask import Flask

app = Flask(__name__)

@route('/')
def hello_world():
    return "Hello world!"
