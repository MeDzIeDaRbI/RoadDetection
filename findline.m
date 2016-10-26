clc;
clear;
i=imread('new.jpg'); 
imshow(i)
figure
i=rgb2gray(i);

%imshow(i)
i_hight=size(i,1); 
i_width=size(i,2);

%i_edge=edge(i,'robert'); 
i_hough=zeros(1024+300,360);


for y=1:i_hight
    for x=1:i_width
        if i(y,x)==0            %坐标系转换
            for l=1:360
            
                r=x*cos(l*pi/180)+y*sin(l*pi/180); 
                w=fix(r)+300;           %修正为正整数
                i_hough(w,l)=i_hough(w,l)+1; 
            end

        end 
    end 
end 

m=max(max(i_hough)); 
i_hough=(i_hough./m);   %亮度调整

threshold=0.75;         %设置直线亮度阈值
ih_hight=size(i_hough,1); 
ih_width=size(i_hough,2);

temp=zeros(20,20); 
count=0;

for y=1:ih_hight            %找那些亮度高的直线
    for x=1:ih_width/2
        if i_hough(y,x)>threshold
            count = count+1;
            temp(count,1) = x;
            temp(count,2) = y;
        end
    end
end

imshow(i)
hold on

for i=1:count               %画呀话
    % y=kx+b
    k = tan(temp(i,1)*pi/180);
    b = (temp(i,2)-300)/sin(temp(i,1)*pi/180);
    for j=1:360
   
        x(j)=j;
        y(j)=-x(j)/k+b;
    end
    plot(x,y)
    hold on
end
axis equal

figure
imshow(i_hough)