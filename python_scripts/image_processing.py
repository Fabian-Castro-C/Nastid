import matrix as mx
from utils.extractors import ibw2dict
import spiepy
from scipy.ndimage import label
from skimage.morphology import remove_small_objects
from skimage.morphology import binary_opening
from skimage.measure import regionprops
from skimage.registration import phase_cross_correlation
import numpy as np
import matplotlib.pyplot as plt

def image_data_to_dict(HeightRetrace: np.ndarray, AmplitudeRetrace: np.ndarray, 
                       xres: int, yres: int, stepsize: float) -> dict:
    """Converts image data to a dictionary.

    Args:
        HeightRetrace (np.ndarray): The height retrace data of the image.
        AmplitudeRetrace (np.ndarray): The amplitude retrace data of the image.
        xres (int): The resolution of the image in the x-axis.
        yres (int): The resolution of the image in the y-axis.
        stepsize (float): The step size of the image.

    Returns:
        dict: A dictionary containing the processed image data.
    """
    image_data = {
        "HeightRetrace": HeightRetrace,
        "AmplitudeRetrace": AmplitudeRetrace,
        "xres": xres,
        "yres": yres,
        "stepsize": stepsize
    }

    return image_data

def process_image(file_path: str) -> dict:
    """Process an AFM image in .ibw format.

    Args:
        file_path (str): Path to the .ibw file.

    Returns:
        dict: Dictionary containing the processed image data.
    """
    # Extract the image data from the .ibw file
    file = ibw2dict(file_path)

    # Extract the image data from the .ibw file
    data = np.array(file['data'])
    labels = file['labels']
    notes = file['notes']

    # Extract HeightRetrace data from the image
    HeightRetrace = data[:,:,0].transpose()
    AmplitudeRetrace = data[:,:,1].transpose()

    # Extract step size from the image
    yres, xres = np.shape(HeightRetrace)
    stepsize = float(notes['ScanSize'])/max(xres,yres)

    HeightRetrace = spiepy.flatten_by_iterate_mask(HeightRetrace)[0]
    AmplitudeRetrace = spiepy.flatten_by_iterate_mask(AmplitudeRetrace)[0]

    # Convert the image data to a dictionary
    image_data = image_data_to_dict(HeightRetrace, AmplitudeRetrace, xres, yres, stepsize)
    return image_data
