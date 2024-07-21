import sys
import os

sys.path.append(os.path.dirname(__file__))


from fastapi import FastAPI
import matrix as mx


app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/matrix")
def random_matrix():
    matrix = mx.random_matrix(512)
    return {"matrix": matrix.tolist()}