 vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
 vrep.simxFinish(-1); % just in case, close all opened connections
 clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);
 
 if (clientID>-1)
        disp('Connected to remote API server');
        
        %handle
        [returnCode,left_Motor]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_leftMotor',vrep.simx_opmode_blocking );
        [returnCode,front_Sensor]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor5',vrep.simx_opmode_blocking );
        [returnCode,camera]=vrep.simxGetObjectHandle(clientID,'Vision_sensor',vrep.simx_opmode_blocking );

        %other code
        [returnCode]=vrep.simxSetJointTargetVelocity(clientID,left_Motor,0.1,vrep.simx_opmode_blocking );
        [returnCode,detectionState,detectedPoint,~,~]=vrep.simxReadProximitySensor(clientID,front_Sensor,vrep.simx_opmode_streaming);
        [returnCode,resolution,image]=vrep.simxGetVisionSensorImage2(clientID,camera,1,vrep.simx_opmode_streaming);
        
        %tic
        for i=1:20
            [returnCode,detectionState,detectedPoint,~,~]=vrep.simxReadProximitySensor(clientID,front_Sensor,vrep.simx_opmode_buffer);
            [returnCode,resolution,image]=vrep.simxGetVisionSensorImage2(clientID,camera,1,vrep.simx_opmode_buffer);
           %disp(toc)
            imshow(image)
            disp(norm(detectedPoint));
            pause(0.1);
        end
        
        [returnCode]=vrep.simxSetJointTargetVelocity(clientID,left_Motor,0,vrep.simx_opmode_blocking );

                
                
        vrep.simxFinish(clientID);
        
        
        
 end
 
 vrep.delete(); % call the destructor!
      