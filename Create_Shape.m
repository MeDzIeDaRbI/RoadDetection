function [ y ] = Create_Shape( N,M, y , z )
 for i = 1:N
     for j = 1:M
        if(i >= z(1,1) & j >= z(1,2))
            y(i,j) = 0 ;
        end
        if(i <= z(2,1) & j <= z(2,2))
            y(i,j) = 0 ;
        end
     end
end


end

