clc; 
clear all; 
close all; 

[file,path] = uigetfile({'*.png';'*.jpg';'*.jpeg';...
                            '*.bmp';'*.gif'},...
                            'File Selector');
ruta=strcat(path,file);


A=imread(ruta);
A=im2double(A);


R=zeros(size(A)); 
R1=zeros(size(A));

R = histeq(A);
R1(:,:,1) = adapthisteq(A (:,:,1));
R1(:,:,2) = adapthisteq(A (:,:,2));
R1(:,:,3) = adapthisteq(A (:,:,3));

figure;
subplot(321);imshow(A);title('Imagen Original');
subplot(322);imhist(A);title('Histograma de A');
subplot(323);imshow(R);title('Ecualizaión de histograma');
subplot(324);imhist(R);title('Histograma de R')

subplot(325);imshow(R1);title('Ecualizaión de Clame');
subplot(326);imhist(R1);title('Histograma de R1')
