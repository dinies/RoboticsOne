function collision = checkPath4Collision(path, robot,obs)    

pathLength = size(path,1);
collision = 0;

for j=1:pathLength
     qj = path(j,:);
     if ~isCollisionFree(robot, obs, qj)
        collision = 1;
        break;
     end
end