% clc; 
% clear all; 
% close all; 
% 
% [file,path] = uigetfile({'*.png';'*.jpg';'*.jpeg';...
%                             '*.bmp';'*.gif'},...
%                             'File Selector');
% ruta=strcat(path,file);
% 
% A=imread(ruta);
% A=im2double(A);
% 
% 
% 
% umbral= 180.0/255.0;
% R= imbinarize (A, umbral); 
% subplot (122); imshow(R);imwrite(R,'IMAGEN/BinariaEdgar.pgn');

clc; 
clear all; 
close all; 

% -------- Seleccionar la imagen --------
[file,path] = uigetfile({'*.png';'*.jpg';'*.jpeg';...
                         '*.bmp';'*.gif'},...
                         'Selecciona una imagen');
ruta = strcat(path,file);

A = imread(ruta);
A = im2double(A);

% Si la imagen es a color -> pasar a escala de grises
if size(A,3) == 3
    A = rgb2gray(A);
end

% -------- Umbralización manual --------
umbral = 180.0/255.0;   % valor entre 0 y 1
R = imbinarize(A, umbral);

% -------- Mostrar resultados ----------
figure;

subplot(1,3,1);
imshow(A);
title('Imagen original (gris)');

subplot(1,3,2);
imshow(R);
title(['Binarizada con umbral = ', num2str(umbral)]);

% subplot(1,3,3);
% imhist(A); hold on;
% yLimits = ylim; % límites del eje Y
% line([umbral umbral], yLimits, 'Color','r','LineWidth',2);
% title('Histograma con umbral');
% hold off;

% -------- Guardar la imagen -----------
if ~exist('IMAGEN','dir')
    mkdir('IMAGEN');
end
imwrite(R, 'IMAGEN/BinariaEdgar.png');

