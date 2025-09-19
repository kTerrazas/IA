import cv2

# Clasificador de rostros de OpenCV
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

# Abrir cámara (0 = cámara integrada, prueba 1 o 2 si tienes otra)
cap = cv2.VideoCapture(0, cv2.CAP_DSHOW)

if not cap.isOpened():
    print("⚠️ Error: No se pudo abrir la cámara.")
    exit()

while True:
    # Capturar frame
    ret, frame = cap.read()
    if not ret:
        print("⚠️ Error al capturar el frame.")
        break

    # Convertir a escala de grises
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Detectar rostros
    faces = face_cascade.detectMultiScale(gray, 1.2, 5)
    print("Rostros detectados:", faces)

    for (x, y, w, h) in faces:
        cv2.rectangle(frame, (x, y), (x+w, y+h), (255, 0, 0), 2)

        roi_gray = gray[y:y+h, x:x+w]
        roi_color = frame[y:y+h, x:x+w]

        # Mostrar solo si hay rostro
        cv2.imshow('ROI Color', roi_color)
        cv2.imshow('ROI Gris', roi_gray)

    # Mostrar frame completo
    cv2.imshow('Detección de Rostros', frame)

    # Salir con la tecla 'q'
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Liberar recursos
cap.release()
cv2.destroyAllWindows()
