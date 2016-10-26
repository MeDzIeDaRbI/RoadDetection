function [ y ] = isolated( y,N,M )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    for i = 2:N-1  
        for j = 2:M-1 
            if(y(i,j) ~= 0) 
            if(y(i,j-1) == 0 &y(i+1,j+1) == 0 &y(i+1,j-1) == 0 &y(i+1,j) == 0 & y(i+1,j+1) == 0 &y(i-1,j-1) == 0&y(i-1,j) == 0&y(i-1,j+1) == 0 )
                y(i,j) = 0 ;
            end
            end
     end

end

