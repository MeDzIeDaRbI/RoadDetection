figure, imshow('gantrycrane.png');
h = impoly(gca, [188,30; 189,142; 93,141; 13,41; 14,29]);
setColor(h,'yellow');
addNewPositionCallback(h,@(p) title(mat2str(p,3)));
fcn = makeConstrainToRectFcn('impoly',get(gca,'XLim'),...
    get(gca,'YLim'));
setPositionConstraintFcn(h,fcn);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%