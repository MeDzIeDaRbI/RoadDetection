function [ z ] = METRIC2( y , N , M )
 % N : number of raws
 % M : number of columns
 z = 0 ;
 for i = 3:N-2
     for j = 3:M-2
         if( y(i,j)==0)
             if(y(i+1,j)==0 & y(i+2,j)==0)
                 z = z + 1 ;
             elseif(y(i,j+1)==0 & y(i,j+2)==0)
                z = z + 1 ;
             elseif(y(i+1,j+1)==0 & y(i+2,j+2)==0)
                z = z + 1 ;
             elseif(y(i-1,j)==0 & y(i-2,j)==0)
                 z = z + 1 ;
             elseif(y(i,j-1)==0 & y(i,j-2)==0)
                z = z + 1 ;
             elseif(y(i-1,j-1)==0 & y(i-2,j-2)==0)
                z = z + 1 ;
              
             end
         end
     end
end
