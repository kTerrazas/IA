#Este código abre un archivo de video (vtest.avi), lo reproduce cuadro a cuadro en escala de grises 
# y se detiene si presionas la tecla q.

import cv2
from tkinter import Tk, filedialog

# Abrir ventana para seleccionar el archivo
Tk().withdraw()
ruta = filedialog.askopenfilename(title="Selecciona un video", filetypes=[("Archivos de video", "*.avi *.mp4 *.mov")])

cap = cv2.VideoCapture(ruta)

if not cap.isOpened():
    print("Error: no se pudo abrir el video.")
    exit()

while True:
    ret, frame = cap.read()
    if not ret:
        print("Fin del video.")
        break

    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    cv2.imshow('frame', gray)

    if cv2.waitKey(30) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
