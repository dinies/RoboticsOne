function collisionFree = isCollisionFree(robot, obs, q)
% outputs:
% collisionFree = 1 if robot collides with obstacles, 0 otherwise


positionedLinkArray = forwardKinematics(robot,q);

nObstacles = length(obs);

for iL = 1:robot.nLinks
    for iO = 1:nObstacles
        
        %dist = distLinkBody( positionedLinkArray{iL}, obs{iO} );
        collision = isLinkBodyCollision( positionedLinkArray{iL}, obs{iO} );
       
        if ( collision == true )
            collisionFree = false;
            return;
        end
        
    end
end

collisionFree = true;