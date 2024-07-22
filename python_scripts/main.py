import sys
import os

sys.path.append(os.path.dirname(__file__))


import numpy as np
import matplotlib.pyplot as plt
from fastapi import FastAPI
from fastapi.responses import StreamingResponse
from io import BytesIO
import matrix as mx
import image_processing as ip


app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/matrix")
def random_matrix() -> dict:
    
    processImage = ip.process_image('/home/fabian-castro/AFM (1)/Mcu10009.ibw')
    HeightRetrace = processImage['HeightRetrace']

    stepsize = processImage['stepsize']
    xres = processImage['xres']
    yres = processImage['yres']

    extent = [0, xres*stepsize, 0, yres*stepsize]

    # Convertir matriz a imagen
    fig, ax = plt.subplots(figsize=(5, 5), dpi=80)
    cax = ax.imshow(HeightRetrace, cmap='hot', extent=extent)  # Captura el objeto retornado por imshow
    ax.set_xlabel('X [m]')  # Corrige cómo se establecen las etiquetas de los ejes
    ax.set_ylabel('Y [m]')

    # Añadir la barra de color
    fig.colorbar(cax, ax=ax)  # Añade una etiqueta a la barra de color si es necesario

    # Guardar la imagen en un buffer de bytes
    buf = BytesIO()
    plt.savefig(buf, format='png', bbox_inches='tight', pad_inches=0, transparent=True)
    buf.seek(0)

    return StreamingResponse(buf, media_type="image/png")

@app.get("/entropy/")
def entropy(file_path: str, m: int = 1, HeightRetrace: bool = True) -> StreamingResponse:

    processImage = ip.process_image(name="MCu30004",file_path=file_path)
    matrix = processImage.calculateComulativeEntropyMatrix(m, HeightRetrace)

    stepsize = processImage.stepsize
    xres = processImage.xres
    yres = processImage.yres

    extent = [0, xres*stepsize, 0, yres*stepsize]

    # Convertir matriz a imagen
    fig, ax = plt.subplots(figsize=(20, 20), dpi=80)
    cax = ax.imshow(matrix, cmap='hot', extent=extent)
    ax.set_xlabel('X [m]')
    ax.set_ylabel('Y [m]')

    # Añadir la barra de color
    fig.colorbar(cax, ax=ax)

    # Guardar la imagen en un buffer de bytes
    buf = BytesIO()
    plt.savefig(buf, format='png', bbox_inches='tight', pad_inches=0, transparent=True)
    buf.seek(0)

    return StreamingResponse(buf, media_type="image/png")
