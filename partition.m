function partition(myImage,w)
%this function divide HD image "myImage" which may have
%larg dimensions into images smaller than w x w
imsize=size(myImage);
y=uint32((size(myImage,1)-mod(size(myImage,1),w))/w);
x=uint32((size(myImage,2)-mod(size(myImage,2),w))/w);
for i=1:1:y+1
for j=1:1:x+1
if(j~=x+1)&&(i~=y+1)
%figure,imshow(myImage(1+(i-1)*w:i*w,1+(j-1)*w:j*w,:))
imwrite(myImage(1+(i-1)*w:i*w,1+(j-1)*w:j*w,:),['part' num2str(i) num2str(j) '.jpg']);
elseif (j==x+1)&&(i~=y+1)
% figure,imshow(myImage(1+(i-1)*w:i*w,1+(j-1)*w:size(myImage,2),:))
imwrite(myImage(1+(i-1)*w:i*w,1+(j-1)*w:size(myImage,2),:),['part' num2str(i) num2str(j) '.jpg']);
elseif (j~=x+1)&&(i==y+1)
%figure,imshow(myImage(1+(i-1)*w:size(myImage,1),1+(j-1)*w:j*w,:));
imwrite(myImage(1+(i-1)*w:size(myImage,1),1+(j-1)*w:j*w,:),['part' num2str(i) num2str(j) '.jpg']);
elseif (j==x+1)&&(i==y+1)
%figure,imshow(myImage(1+(i-1)*w:size(myImage,1),1+(j-1)*w:size(myImage,2),:));
imwrite(myImage(1+(i-1)*w:size(myImage,1),1+(j-1)*w:size(myImage,2),:),['part' num2str(i) num2str(j) '.jpg']);
end
end
end
end