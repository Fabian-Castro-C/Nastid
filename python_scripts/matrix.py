import numpy as np
import matplotlib.pyplot as plt

def random_matrix(n):
    '''Generate a random n x n matrix'''
    return np.random.rand(n, n)

def plot_matrix(matrix):
    '''Plot the input matrix as a heatmap'''
    plt.imshow(matrix, cmap='hot', interpolation='nearest')
    plt.colorbar()
    plt.show()


def probability_matrix(matrix, bins=256):
    '''Return the probability distribution function of the intensity values in the input matrix'''
    max_value = np.max(matrix)
    min_value = np.min(matrix)
    matrix = matrix.flatten()
    # Calculate the histogram of the flattened matrix
    hist, _ = np.histogram(matrix, bins=bins, range=(min_value, max_value))
    # Normalize the histogram to obtain the probability distribution
    probability_distribution = hist / np.sum(hist)
    def probability_function(value):
        '''Return the probability of a given intensity value'''
        return probability_distribution[int(value * (bins - 1))]
    return np.vectorize(probability_function)

def calculate_entropy(submatrix, probability_function, bins=256):
    '''Calculate the entropy of a submatrix using the input probability distribution of intensity values'''
    prob_matrix = probability_function(submatrix)
    entropy = -np.sum(prob_matrix * np.log2(prob_matrix+1e-10))
    return entropy

def entropy_matrix(matrix, m, bins=256):
    '''Calculate the entropy of each m x m submatrix of the input matrix'''
    n = matrix.shape[0]
    result = np.zeros((n, n))

    # Normalize the matrix to [0, 1]
    normalized_matrix = np.copy((matrix - np.min(matrix)) / (np.max(matrix) - np.min(matrix)))

    probabilities = probability_matrix(normalized_matrix, bins)
    for i in range(n):
        for j in range(n):
            row_min = max(0, i - m // 2)
            row_max = min(n, i + m // 2 + 1)
            col_min = max(0, j - m // 2)
            col_max = min(n, j + m // 2 + 1)
            submatrix = normalized_matrix[row_min:row_max, col_min:col_max]
            result[i, j] = calculate_entropy(submatrix, probabilities, bins)
    return result

def recursive_entropy_matrix(matrix, m, bins=256):
    '''Calculate the entropy of each m x m submatrix of the input matrix using a recursive approach'''
    n = matrix.shape[0]
    S = np.zeros((n, n))
    F = np.zeros(n)

    # Normalize the matrix to [0, 1]
    normalized_matrix = np.copy((matrix - np.min(matrix)) / (np.max(matrix) - np.min(matrix)))

    # Calculate the probability distribution of the input matrix
    probabilities = probability_matrix(normalized_matrix, bins)
    prob_matrix = probabilities(normalized_matrix)
    entropy_local = -prob_matrix * np.log2(prob_matrix+1e-10)

    # Completamos la primera columna
    for i in range(n):
        start_i = max(0, i - m)
        end_i = min(n, i + m + 1)
        S[i,0] = np.sum(entropy_local[start_i:end_i, 0:m+1])

    # Ahora definimos el primer vector F
    for j in range(n):
        F[j] = np.sum(entropy_local[0:m+1, j])

    # Definimos funcion que calcula el paso siguiente en el vector F.
    def next_F(F,i):
        if i < m:
            F = F + entropy_local[i+m+1,:]
        elif i < n-m-1:
            F = F + entropy_local[i+m+1,:] - entropy_local[i-m,:]
        else:
            F = F - entropy_local[i-m,:]
        return F

    # Ahora podemos aplicar la recursividad
    for i in range(n):
        for j in range(n-1):
            if j <= m-1:
                S[i,j+1] = S[i,j] + F[j+1+m]
            elif j < n-m-1:
                S[i,j+1] = S[i,j] + F[j+1+m] - F[j-m]
            else:
                S[i,j+1] = S[i,j] - F[j-m]
        F = next_F(F,i)
    return S


def mask_sum(mask1, mask2):
    '''Combine two masks using logical AND'''
    return np.logical_or(mask1, mask2)


def mask_subtract(mask1, mask2):
    '''Subtract mask2 from mask1 using logical AND and NOT'''
    return np.logical_and(mask1, np.logical_not(mask2))


def anti_mask(mask):
    '''Generate the anti-mask of a mask using logical NOT'''
    res = np.logical_not(mask)
    return res


def apply_mask(matrix, mask, to_NaN=False):
    '''Apply a mask to a matrix'''
    # Apply the mask to the matrix
    if to_NaN:
        return np.where(mask, matrix, np.nan)
    else:
        return np.where(mask, matrix, 0)


def generate_mask(n, center_i, center_j, r):
    '''Generate a circular mask of radius r centered at (center_i, center_j) in an n x n matrix'''
    # Create a matrix of True values
    mask = np.ones((n, n), dtype=bool)
    # Create a grid of (x, y) coordinates
    y, x = np.ogrid[:n, :n]
    # Calculate the distance of each point from the center (center_i, center_j)
    distance = np.sqrt((x - center_j) ** 2 + (y - center_i) ** 2)
    # Set the mask to False within the radius r
    mask[distance <= r] = False
    return mask
