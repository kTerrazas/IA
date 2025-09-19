#escala de grises 
import numpy as np
import cv2

import tkinter as tk
from tkinter import filedialog

path=filedialog.askopenfilename()
# Load an color image in grayscale
#img = cv2.imread('MediaNaranja.jpg')
img = cv2.imread(path,0)

cv2.imwrite('Imagenes/MediaNaranja.png',img)

cv2.namedWindow('MI IMAGEN', cv2.WINDOW_NORMAL)
cv2.imshow('MI IMAGEN',img)
cv2.waitKey(0)
cv2.destroyAllWindows()