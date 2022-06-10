clc; clear; close all; warning off all;

% Membaca citra asli
RGB = imread('burung 5.jpg');
figure, imshow(RGB);

% Melakukan transformasi ruang warna citra yang semula RGB menjadi HSV
HSV = rgb2hsv(RGB);
%figure, imshow(HSV);

% Melakukan segmentasi terhadap warna biru (nilai Hue 100-250)
H = HSV(:,:,1);
range = [100 250]/360; 
mask = (H>range(1)) & (H<range(2));
%figure, imshow(mask)

% Mengubah warna background menjadi grayscale
H = HSV(:,:,1);
S = HSV(:,:,2);
V = HSV(:,:,3);

S = S.*mask;
HSV1 = cat(3,H,S,V);

RGB1 = hsv2rgb(HSV1);
figure, imshow(RGB1);