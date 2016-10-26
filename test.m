      img = imread('coins.png');
      imshow(img);
      imgBW = edge(img);
      rad = 24;
      [y0detect,x0detect,Accumulator] = houghcircle(imgBW,rad,rad*pi);
      figure;
      imshow(imgBW);
      hold on;
      plot(x0detect(:),y0detect(:),'x','LineWidth',2,'Color','yellow');
      figure;
      imagesc(Accumulator);
