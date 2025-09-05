%f(v):= 255·(v/255)1/GAMA  

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
%gamma=2; 

figure;
subplot(221);imshow(A);title('Imagen Original');
subplot(222);imhist(A);title('Histograma de A');

for gamma=0.1:0.1:4;
R= 1.0*(A/1.0).^(1/gamma); 
figure;
subplot(223);imshow(R);title('Ajuste Lineal');
subplot(224);imhist(R);title(gamma);
pause(0.1); 
end 






