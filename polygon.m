function [ y ] = polygon(y , N , M ,x ,i )
 % N : number of raws
 % M : number of columns
 
 for i = 1:N
     for j = 1:M
        if(y(i,j)<x+i & y(i,j)>x-i)
            y(i,j) = 0 ;
        end
     end
end

