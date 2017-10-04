function polygon = createPolygon(pointArray)
% create a polygon structure
% pointArray = [x1 y1; x2 y2; ... ; xn yn] 
% where [xi yi], i=1,2,..,n are the veritices of the polygon

if pointArray(1,:)==pointArray(end,:)     % if first and last points are the same point
    pointArray=pointArray(1:(end-1),:);   % delete last point
end

polygon.pointArray=pointArray;
polygon.nPoints=length(pointArray);
polygon.type = 'polygon';

% body.boundingBox = [xMin yMin; xMax yMax;]
polygon.boundingBox = [ min(pointArray(1,:)) min(pointArray(2,:));
                        max(pointArray(1,:)) max(pointArray(2,:))]; 