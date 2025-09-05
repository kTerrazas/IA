clc; 
clear all; 
close all; 

% ----------- Imagen A ---------------
[file,path] = uigetfile({'*.png';'*.jpg';'*.jpeg';...
                            '*.bmp';'*.gif'},...
                            'Selecciona la imagen A');
ruta = strcat(path,file);

A = imread(ruta);
A = im2double(A);
% A = rgb2gray(A); 
% A = imbinarize(A);


% ----------- Imagen B ---------------
[file1,path1] = uigetfile({'*.png';'*.jpg';'*.jpeg';...
                            '*.bmp';'*.gif'},...
                            'Selecciona la imagen B');
ruta1 = strcat(path1,file1);

B = imread(ruta1);
B = im2double(B);
% B = rgb2gray(B); 
% B = imbinarize(B);

% Ajustar A al tamaño de B
[bx, by, bz] = size(B);
A = imresize(A, [bx by]);
R1 = A+B;
R2 = (A+B)/2;

figure,
subplot(221); imshow(A); title('A');
subplot(222); imshow(B); title('B');
subplot(223); imshow(R1); title('R1 = A+B');
subplot(224); imshow(R2); title('R2 = (A+B)/2');
