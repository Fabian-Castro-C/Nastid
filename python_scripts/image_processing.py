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
from image_file import ImageFile

def process_image(name: str, file_path: str) -> ImageFile:
    """Process an AFM image in .ibw format.

    Args:
        name (str): Name of the image.
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
    imageFile = ImageFile(name, file_path, HeightRetrace, AmplitudeRetrace, 
                           xres, yres, stepsize)
    imageFile.calculateDistributionFunction(bins = 128)
    return imageFile