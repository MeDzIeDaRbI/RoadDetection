clc;
close all;
clear all;
Image= imread('new.jpg');
figure,imshow(Image)
prev_rgb=0;
prev_B=0;
prev_S=0;
prev_CurrentRoads=Image;
%prev_S=back;
CurrentRoads=prev_CurrentRoads;
sensitivity=0.92;
RoadWidth=4;
for i=1:100
S=prev_S+RoadExtractor(CurrentRoads,CurrentRoads,sensitivity,RoadWidth);
back=prev_S;
prev_CurrentRoads=CurrentRoads;
prev_S=S;
imwrite(S,'S.jpg');
rgb=imread('S.jpg');
R=rgb;R(:,:,[2 3])=0;
G=rgb;G(:,:,2)=G(:,:,1);G(:,:,[1 3])=0;
B=rgb;B(:,:,3)=B(:,:,1);B(:,:,[1 2])=0;
rgb=R+G+B;
CurrentRoads=Image-rgb+B;
end
[features,colored]=RoadFeatures(Image,S,6);
figure,imshow(colored)
figure,imshow(features)
figure,imshow(S)