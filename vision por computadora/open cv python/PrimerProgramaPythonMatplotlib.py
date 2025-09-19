#Este programa permite elegir una imagen desde tu PC y mostrarla usando Matplotlib, 
# ocultando los ejes y aplicando una interpolación bicúbica para mejorar la visualización.

import numpy as np
import cv2
from matplotlib import pyplot as plt

import tkinter as tk
from tkinter import filedialog

path=filedialog.askopenfilename()

img = cv2.imread(path)
plt.imshow(img, cmap = 'gray', interpolation = 'bicubic')
plt.xticks([]), plt.yticks([])  # to hide tick values on X and Y axis
plt.show()