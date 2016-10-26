function [ z ] = METRIC( y , N , M )
 % N : number of raws
 % M : number of columns
 z = 0 ;
 for i = 2:N-1
     for j = 2:M-1
         if( y(i,j)==0)
             if(y(i+1,j)==0)
                 z = z + 1 ;
             elseif(y(i,j+1)==0)
                z = z + 1 ;
             elseif(y(i+1,j+1)==0)
                z = z + 1 ;
             elseif(y(i-1,j)==0)
                 z = z + 1 ;
             elseif(y(i,j-1)==0)
                z = z + 1 ;
             elseif(y(i-1,j-1)==0)
                z = z + 1 ;
              
             end
         end
     end
end

