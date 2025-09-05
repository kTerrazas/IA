clc; 
clear all; 
close all; 

[file,path] = uigetfile({'*.png';'*.jpg';'*.jpeg';...
                            '*.bmp';'*.gif'},...
                            'File Selector');
ruta=strcat(path,file);

A=imread(ruta);
A=im2double(A);

% Convertir a escala de grises si es RGB
if size(A,3) == 3
    A = rgb2gray(A);
end

[ax,ay] = size(A); % solo 2 dimensiones
umbral = 0.5;
R = zeros(size(A));

for m = 1:ax
    for n = 1:ay
        if A(m,n) >= umbral
            R(m,n) = 1;
        else
            R(m,n) = 0;
        end
    end
end


figure, imshow(R); title('Imagen binarizada')