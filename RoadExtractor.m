function road=RoadExtractor(Image,CurrentRoads,sensitivity,RoadWidth)
%% Seed Coordination
figure,imshow(CurrentRoads)
[x y] = ginput;
close
int_x = uint32(x);
int_y = uint32(y);
%% PreProcessing
gray=rgb2gray(Image);
L=1+(RoadWidth-mod(RoadWidth,2))/2;
median=medfilt2(gray,[L L]);
edges = edge(median,'canny',[]);
sx=size(x);
for i=1:sx(1)
thresh(i) = double(median(int_y(i),int_x(i))/9+median(int_y(i),int_x(i)+1)/9+median(int_y(i),int_x(i)-1)/9+median(int_y(i)+1,int_x(i))/9+median(int_y(i)+1,int_x(i)+1)/9+median(int_y(i)+1,int_x(i)-1)/9+median(int_y(i)-1,int_x(i))/9+median(int_y(i)-1,int_x(i)+1)/9+median(int_y(i),int_x(i)-1)/9)
th=thresh(i)/255;
edges = edges+edge(median,'canny',sensitivity*th);
end
edges = CarsRemover(edges,L);
SE = strel('square',2);
edges = imdilate(edges,SE);
%edges=whiteframe(edges);
imwrite(edges,'edges.jpg');
new=imread('edges.jpg');
delete('edges.jpg');
new(:,:,3)=new(:,:,1);
new(:,:,2)=new(:,:,1);
edges=rgb2gray(new);
M=imsubtract(median,edges);
%% Binerization
imsize=size(Image);
black=im2bw(gray-255);
road=black;
for i=1:sx(1)
thres(i) = double(M(int_y(i),int_x(i))/9+M(int_y(i),int_x(i)+1)/9+M(int_y(i),int_x(i)-1)/9+M(int_y(i)+1,int_x(i))/9+M(int_y(i)+1,int_x(i)+1)/9+M(int_y(i)+1,int_x(i)-1)/9+M(int_y(i)-1,int_x(i))/9+M(int_y(i)-1,int_x(i)+1)/9+M(int_y(i),int_x(i)-1)/9)
black(int_y(i)-L:int_y(i)+L,int_x(i)-L:int_x(i)+L)=ones(2*L+1,2*L+1);
t=thres(i)/255;
for j=1:imsize(1)
for k=1:imsize(2)
if(abs(thres(i)-double(M(j,k))) < (1-sensitivity)*255)
black(j,k)=1;
end
end
end
%black=im2bw(M,sensitivity*t);
selected = bwselect(black,x(i),y(i));
road=imadd(road,selected);
road=im2bw(road);
black=im2bw(black-255);
end
end