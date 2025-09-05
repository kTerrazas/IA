clc; 
clear all; 
close all; 

[file,path] = uigetfile({'*.png';'*.jpg';'*.jpeg';...
                            '*.bmp';'*.gif'},...
                            'File Selector');
ruta=strcat(path,file);


A=imread(ruta);
A=im2double(A);


m=0.33; 
M=0.8;

R=zeros(size(A)); 
R=((A-m)*1.0)/(M-m);


figure;
subplot(221);imshow(A);title('Imagen Original');
subplot(222);imhist(A);title('Histograma de A');
subplot(223);imshow(R);title('Ajuste Lineal');
subplot(224);imhist(R);title('Histograma de R');

% Suma de uma constante a
%a=0.2;
% 
% for a=0.0:0.1:1.0;
%     R1=zeros(size(A));
%     R1=A+a;
%     subplot(223);imshow(R1);title('Imagen Resultante R1(x,y)=A(x,y)+a');
%     subplot(224);imhist(R1);title(a);
%     pause(1);
% end


