function line = createLineSeg(pointArray)
% create a line segment structure 
% inputs:
% pointArray = [x1 y1; x2 y2] 
% where [x1 y1] and [x2 y2] are the end points of the line segment

line.pointArray=pointArray;
line.nPoints=length(pointArray);
line.type = 'line';

% body.boundingBox = [xMin yMin; xMax yMax;]
line.boundingBox = [ min(pointArray(1,:)) min(pointArray(2,:));
                     max(pointArray(1,:)) max(pointArray(2,:))]; 