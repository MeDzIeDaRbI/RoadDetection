function [features,colored]=RoadFeatures(Image,road,RoadWidth)
%% Remaining Noise Cleaning
% Clear noise in the roads
Q=1+(RoadWidth-mod(RoadWidth,2))/2;
SE = strel('square',Q);
closed = imclose(road,SE);
closed=im2bw(closed);
%% Feature Derivation
SE = strel('square',3);
dilated=imdilate(closed,SE);
edges=dilated-closed;
%Skeltonization
thined=bwmorph(closed,'thin','inf');
SE = strel('square',2);
skelton=imdilate(thined,SE);
% Junctions
branchpoints=bwmorph(thined,'branchpoints',1);
SE = strel('diamond',3);
Crossroads=imdilate(branchpoints,SE);
%% Result Coloring and Collecting
%white junctions
imwrite(Crossroads,'Crossroad.jpg');
Crossroad=imread('Crossroad.jpg');
delete('Crossroad.jpg');
Crossroad(:,:,3)=Crossroad(:,:,1);
Crossroad(:,:,2)=Crossroad(:,:,1);
%red edges
imwrite(edges,'edge.jpg');
Edges=imread('edge.jpg');
Red_edges=Edges;
Red_edges(:,:,[2 3])=0;
%green skelton
imwrite(skelton,'skelton.jpg');
rgb_skelton=imread('skelton.jpg');
Green_skelton=rgb_skelton;
Green_skelton(:,:,2)=Green_skelton(:,:,1);
Green_skelton(:,:,[1 3])=0;
%prfilation
pro=closed-skelton-edges-Crossroads;
%blue and black profile
imwrite(pro,'profile.jpg');
profile=imread('profile.jpg');
Blue_road=profile;
Blue_road(:,:,3)=Blue_road(:,:,1);
Blue_road(:,:,[1 2])=0;
%figure,imshow(Blue_road+Green_skelton+Red_edges+Crossroad);
features=Blue_road+Green_skelton+Red_edges+Crossroad;
imwrite(closed+skelton+edges+Crossroads,'all.jpg');
all=imread('all.jpg');
all(:,:,3)=all(:,:,1);
all(:,:,2)=all(:,:,1);
RGB=Image-all;
colored=RGB+Blue_road+Green_skelton+Red_edges+Crossroad;
end