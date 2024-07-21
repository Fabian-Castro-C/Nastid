import sys
import os

sys.path.append(os.path.dirname(__file__))


import numpy as np
import matplotlib.pyplot as plt
from fastapi import FastAPI
from fastapi.responses import StreamingResponse
from io import BytesIO
import matrix as mx


app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/matrix")
def random_matrix() -> dict:
    
    matrix = mx.random_matrix(512)

    # Convertir matriz a imagen
    fig, ax = plt.subplots(figsize=(5, 5), dpi=80)
    ax.imshow(matrix, cmap='gray')
    ax.axis('off')  # Ocultar los ejes

    # Guardar la imagen en un buffer de bytes
    buf = BytesIO()
    plt.savefig(buf, format='png', bbox_inches='tight', pad_inches=0)
    buf.seek(0)

    return StreamingResponse(buf, media_type="image/png")