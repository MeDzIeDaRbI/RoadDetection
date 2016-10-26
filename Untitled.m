close all;clear all;clc;
I = imread('new.jpg');
figure
imshow(I);
bw_I = rgb2gray(I);
% diff_im = bw_I ;
 diff_im = anisodiff2D(bw_I, 20, 1/7, 30, 2)
imshow(diff_im)


 BW = edge(diff_im,'canny');
% BW = edge(bw_I,'sobel');
% BW = edge(bw_I,'prewitt');
% BW = edge(bw_I,'roberts');
% BW = edge(bw_I,'log')
% [BW,THRESH] = edge(bw_I,'zerocross') ;

imshow(BW);
BW_e=im2uint8(BW);
I3=bw_I-BW_e;
figure;imshow(I3);
s=size(I3);
%seuil=140;
img = uint8(zeros(s));
img=I3>140;
figure;imshow(img);


%%%%%ù

