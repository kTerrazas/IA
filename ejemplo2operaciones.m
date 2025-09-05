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
A = rgb2gray(A); 
A = imbinarize(A);


% ----------- Imagen B ---------------
[file1,path1] = uigetfile({'*.png';'*.jpg';'*.jpeg';...
                            '*.bmp';'*.gif'},...
                            'Selecciona la imagen B');
ruta1 = strcat(path1,file1);

B = imread(ruta1);
B = im2double(B);
B = rgb2gray(B); 
B = imbinarize(B);

% Ajustar A al tamaño de B
[bx, by, bz] = size(B);
A = imresize(A, [bx by]);

% ----------- Imagen C ---------------
[file2,path2] = uigetfile({'*.png';'*.jpg';'*.jpeg';...
                            '*.bmp';'*.gif'},...
                            'Selecciona la imagen C');
ruta2 = strcat(path2,file2);

C = imread(ruta2);
C = im2double(C);
C = rgb2gray(C); 
C = imbinarize(C);

% Ajustar C también al tamaño de B
C = imresize(C, [bx by]);

% ----------- Operaciones lógicas -----
% NOTC = not(C);   % complemento lógico de C
% T1 = B. *NOTC;            % AND entre B y NOTC
% T2 = A. *C; 
% R = T1+T2; 

% ----------- Operaciones lógicas -----
NOTC = ~C;          % complemento lógico de C
T1 = B & NOTC;      % AND entre B y NOT C
T2 = A & C;         % AND entre A y C
R  = T1 | T2;       % OR entre T1 y T2

% ----------- Mostrar resultados ------
figure;
subplot(331); imshow(B); title('B');
subplot(332); imshow(NOTC); title('NOT C');
subplot(333); imshow(T1); title('T1 = B AND NOT C');
subplot(334); imshow(A); title('A');
subplot(335); imshow(C); title('C');
subplot(336); imshow(T2); title('T2 = A and C');
subplot(337); imshow(T1); title('T1');
subplot(338); imshow(T2); title('T2');
subplot(339); imshow(R); title('R = T1 + T2');
