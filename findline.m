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
        if i(y,x)==0            %����ϵת��
            for l=1:360
            
                r=x*cos(l*pi/180)+y*sin(l*pi/180); 
                w=fix(r)+300;           %����Ϊ������
                i_hough(w,l)=i_hough(w,l)+1; 
            end

        end 
    end 
end 

m=max(max(i_hough)); 
i_hough=(i_hough./m);   %���ȵ���

threshold=0.75;         %����ֱ��������ֵ
ih_hight=size(i_hough,1); 
ih_width=size(i_hough,2);

temp=zeros(20,20); 
count=0;

for y=1:ih_hight            %����Щ���ȸߵ�ֱ��
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

for i=1:count               %��ѽ��
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