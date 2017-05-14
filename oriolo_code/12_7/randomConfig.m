function q = randomConfig(robot)

%generate a random configuration in the cspace

q=rand(robot.nLinks+2,1).*(robot.jointRanges(:,2)-robot.jointRanges(:,1)) + robot.jointRanges(:,1);
q=q';