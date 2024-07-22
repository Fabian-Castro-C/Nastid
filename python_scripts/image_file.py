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

class ImageFile:
    def __init__(self, name: str, file_path: str, HeightRetrace: np.ndarray, 
                 AmplitudeRetrace: np.ndarray, xres: int, yres:int, stepsize: float):
        """Initialize the ImageFileProcessing object.

        Args:
            name (str): The name of the image file.
            file_path (str): The file path of the image file.
            HeightRetrace (np.ndarray): The height retrace matrix.
            AmplitudeRetrace (np.ndarray): The amplitude retrace matrix.
            xres (int): The x resolution of the image.
            yres (int): The y resolution of the image.
            stepsize (float): The step size for processing the image.
            distribution_function_HeightRetrace (vectorize): Probability
            distribution of HeightRetrace.
            distribution_function_AmplitudeRetrace (vectorize)

        """
        self.name = name
        self.file_path = file_path
        self.HeightRetrace = HeightRetrace
        self.AmplitudeRetrace = AmplitudeRetrace
        self.xres = xres
        self.yres = yres
        self.stepsize = stepsize
        self.distribution_function_HeightRetrace = None
        self.distribution_function_AmplitudeRetrace = None

    def classToDict(self) -> dict:
        """Converts the class object to a dictionary representation.

        Returns:
            dict: A dictionary representation of the class object.
        """

        image_data = {
            "name": self.name,
            "file_path": self.file_path,
            "HeightRetrace": self.HeightRetrace,
            "AmplitudeRetrace": self.AmplitudeRetrace,
            "xres": self.xres,
            "yres": self.yres,
            "stepsize": self.stepsize,
        }
        return image_data

    def calculateDistributionFunction(self, bins: int = 256) -> None:
        """Calculates the distribution function for the HeightRetrace and 
        AmplitudeRetrace arrays.

        This method calculates the distribution function for the HeightRetrace 
        and AmplitudeRetrace arrays using the mx.probability_matrix function. 
        The resulting distribution functions are stored in the
        distribution_function_HeightRetrace and 
        distribution_function_AmplitudeRetrace attributes.

        Parameters:
            None

        Returns:
            None
        """

        # HeightRetrace
        normalized_matrix = (
            np.copy((self.HeightRetrace - np.min(self.HeightRetrace))
                / (np.max(self.HeightRetrace) - np.min(self.HeightRetrace)))
        )
        self.distribution_function_HeightRetrace = (
            mx.probability_matrix(normalized_matrix, bins)
        )

        # AmplitudeRetrace
        normalized_matrix = (
            np.copy((self.AmplitudeRetrace - np.min(self.AmplitudeRetrace))
                / (np.max(self.AmplitudeRetrace) - np.min(self.AmplitudeRetrace)))
        )
        self.distribution_function_AmplitudeRetrace = (
            mx.probability_matrix(self.AmplitudeRetrace)
        )

        del normalized_matrix

    def calculateComulativeEntropyMatrix(self, m: int, HeightRetrace: bool = True) -> np.ndarray:
        """
        Calculate the cumulative entropy matrix.

        Args:
            m (int): Radius of the cumulative matrix.
            HeightRetrace (bool, optional): Whether to perform height retrace. Defaults to True.

        Returns:
            np.ndarray: The cumulative entropy matrix.
        """

        if HeightRetrace:
            norm_HeightRetrace = mx.normalize_matrix(self.HeightRetrace)
            comulative_entropy = mx.recursive_entropy_matrix(
                matrix = norm_HeightRetrace,
                m = m,
                probability_distribution = self.distribution_function_HeightRetrace
            )
            return comulative_entropy
        else:
            norm_AmplitudeRetrace = mx.normalize_matrix(self.AmplitudeRetrace)
            comulative_entropy = mx.recursive_entropy_matrix(
                matrix = norm_AmplitudeRetrace,
                m = m,
                probability_distribution = self.distribution_function_AmplitudeRetrace
            )
            return comulative_entropy

    