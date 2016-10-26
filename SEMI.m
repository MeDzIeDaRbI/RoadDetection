
% ==============================================%
% Automatic Road Detection                      %
% Developper : Arbi Mohamed Zied                %
% University : SupCom                           % 
% ==============================================%
[x y] = ginput;
image_gray = roifill(image_gray, x, y)
imshow(image_gray);
[x y] = ginput;
image_gray = roifill(image_gray, x, y)
imshow(image_gray);
[x y] = ginput;
image_gray = roifill(image_gray, x, y)
imshow(image_gray);
[x y] = ginput;
image_gray = roifill(image_gray, x, y)
imshow(image_gray);
[x y] = ginput;
image_gray = roifill(image_gray, x, y)
imshow(image_gray);
[x y] = ginput;
image_gray = roifill(image_gray, x, y)
imshow(image_gray);
[x y] = ginput;
image_gray = roifill(image_gray, x, y)
imshow(image_gray);
[x y] = ginput;
image_gray = roifill(image_gray, x, y)
imshow(image_gray);

 
diff_im = anisodiff2D(image_gray, 15, 0.35, 30, 2)

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
% 
