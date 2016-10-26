% Automatic road detection

%%
% 
%  PREFORMATTED
%  TEXT
% 
%%
% $x^2+e^{\pi i}$
clear all ;
close all ;
% Read image file
image = imread('new.jpg');
figure
imshow(image) ;



% to gray scale
image_gray = rgb2gray(image);
figure
imshow(image_gray);

[counts,x] = imhist(image_gray);
figure
stem(x,counts);

imshow(image_gray);
% [x y] = ginput;
% image_gray = roifill(image_gray, x, y)
% imshow(image_gray);
% [x y] = ginput;
% image_gray = roifill(image_gray, x, y)
% imshow(image_gray);
% [x y] = ginput;
% image_gray = roifill(image_gray, x, y)
% imshow(image_gray);
% [x y] = ginput;
% image_gray = roifill(image_gray, x, y)
% imshow(image_gray);
% [x y] = ginput;
% image_gray = roifill(image_gray, x, y)
% imshow(image_gray);
% [x y] = ginput;
% image_gray = roifill(image_gray, x, y)
% imshow(image_gray);
image_gray = isolated( image_gray,512,512 )
figure
imshow(image_gray);

figure
imshow(image_gray);
% % y = polygon(image_gray , 512 , 512 ,10 ,4 ) ;
% % z = image_gray + y
% % figure
% % imshow(z);
% % Anistropic diffusion 
% % t =[] ;
% % z =[] ;
% 
diff_im = anisodiff2D(image_gray, 15, 0.35, 30, 2)
% diff_im = image_gray ;
% figure
% imshow(diff_im);245779

 BW = edge(diff_im,'canny');
% figure
% imshow(BW);
%z = [z METRIC(BW,512,512)] ;
%t = [t METRIC2(BW,512,512)] ;


BW = edge(diff_im,'canny');
figure
imshow(BW);


imshow(BW);
BW_e=im2uint8(BW);
I3=image_gray-BW_e;
figure;imshow(I3);
s=size(I3);
%seuil=140;
img = uint8(zeros(s));
img=I3>140;
figure;imshow(img);
img1 = img + BW ;
figure;imshow(img1);
img1 = isolated( img1,512,512 )
figure
imshow(img1);
background = imopen(img1,strel('disk',15));
img2 = img1 - background;
figure, imshow(img2)
img2 = imadjust(img2);
img2 = imadjust(img2);
img2 = imadjust(img2);
I3 = imadjust(img2);
figure, imshow(I3);
level = graythresh(I3);
bw = im2bw(I3,level);
se2 = strel('line',5,3)
bw1 = imclose(bw,se2) 
figure, imshow(bw1);

