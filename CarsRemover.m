function B = CarsRemover(BW2,RoadWidth)
B=BW2;
v=RoadWidth;
w=RoadWidth;
for j=1:(size(B,1)-w)
for k=1:(size(B,2)-v)
if (B(j,k:k+v-1) == zeros(1,v))
if(B(j+w-1,k:k+v-1) == zeros(1,v))
if(B(j:j+w-1,k)==zeros(w,1))
if(B(j:j+w-1,k+v-1)==zeros(w,1))
    B(j:j+w-1,k:k+v-1)=zeros(w,v);
end
end
end
end
end
end
end