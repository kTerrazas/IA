clc; 
clear all; 
close all; 

[file,path] = uigetfile({'*.png';'*.jpg';'*.jpeg';...
                            '*.bmp';'*.gif'},...
                            'File Selector');
ruta=strcat(path,file);

A=imread(ruta);
A=im2double(A);


[file1,path1] = uigetfile({'*.png';'*.jpg';'*.jpeg';...
                            '*.bmp';'*.gif'},...
                            'File Selector');
ruta1=strcat(path1,file1);

B=imread(ruta2);
% A=imresize(A,size(B));
%B=im2double(B);
[bx by bz]= size(B);
A = imresize(bx by); 

[file2,path2] = uigetfile({'*.png';'*.jpg';'*.jpeg';...
                            '*.bmp';'*.gif'},...
                            'File Selector');
ruta2=strcat(path2,file2);

C=imread(ruta3);

NOTC= not(C);
T1= and (B, NOTC); 
subplot(331);imshow(B); title ('B');
subplot(332);imshow(NOTC); title ('NOT C');
subplot(333);imshow(T1); title ('T1= B and NOT C');
subplot(334);imshow(A); title ('A');
subplot(335);imshow(C); title ('C');



