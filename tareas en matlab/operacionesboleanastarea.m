clc;
clear all;
close all;

% ==============================
% Seleccionar primera imagen (A)
% ==============================
[file,path] = uigetfile({'*.png';'*.jpg';'*.jpeg';'*.bmp';'*.gif'},...
                        'Seleccionar Imagen A');
ruta = strcat(path,file);

A = imread(ruta);
A = im2double(A);

% ==============================
% Seleccionar segunda imagen (B)
% ==============================
[file1,path1] = uigetfile({'*.png';'*.jpg';'*.jpeg';'*.bmp';'*.gif'},...
                          'Seleccionar Imagen B');
ruta1 = strcat(path1,file1);

B = imread(ruta1);
B = im2double(B);   % Convertimos a double

% Redimensionamos A al tamaño de B
[bx, by, ~] = size(B);
A = imresize(A, [bx by]);

% % ==============================
% % Seleccionar tercera imagen (C)
% % ==============================
[file2,path2] = uigetfile({'*.png';'*.jpg';'*.jpeg';'*.bmp';'*.gif'},...
                          'Seleccionar Imagen C');
ruta2 = strcat(path2,file2);

C = imread(ruta2);
C = im2double(C);

% ==============================
% Operaciones lógicas
% ==============================
% Para usar AND y NOT, las imágenes deben ser binarias
% Convertimos a escala de grises y luego a binario
Bbin = im2bw(rgb2gray(B), 0.5);
Cbin = im2bw(rgb2gray(C), 0.5);

% Asegurar que C tenga el mismo tamaño que B
Cbin = imresize(Cbin, size(Bbin));


NOTC = ~Cbin;      %not
T1   = Bbin & NOTC; %and 
T2 = Bbin | Cbin; %or 
% Operación XOR
Ixor = xor(Bbin, Cbin);

% ==============================
% Mostrar resultados
% ==============================
subplot(331); imshow(Bbin); title('B (binaria)');
subplot(332); imshow(NOTC); title('NOT C');
subplot(333); imshow(T1); title('T1 = B AND NOT C');
subplot(334); imshow(A); title('A (redimensionada)');
subplot(335); imshow(Cbin); title('C (binaria)');
subplot(336); imshow(T2); title('T2 = B OR C'); 
subplo(337); imshow(Ixor); title('Ixor= B XOR c'); 