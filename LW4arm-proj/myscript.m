
 vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
 vrep.simxFinish(-1); % just in case, close all opened connections
 clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);
 
 %check for connection
 if (clientID>-1)  
        disp('Connected to remote API server');
        
        %handle joints
        [returnCode,first_Joint]=vrep.simxGetObjectHandle(clientID,'LBR4p_joint1',vrep.simx_opmode_blocking );
        [returnCode,second_Joint]=vrep.simxGetObjectHandle(clientID,'LBR4p_joint2',vrep.simx_opmode_blocking );
        [returnCode,third_Joint]=vrep.simxGetObjectHandle(clientID,'LBR4p_joint3',vrep.simx_opmode_blocking );
        [returnCode,fourth_Joint]=vrep.simxGetObjectHandle(clientID,'LBR4p_joint4',vrep.simx_opmode_blocking );
        [returnCode,fifth_Joint]=vrep.simxGetObjectHandle(clientID,'LBR4p_joint5',vrep.simx_opmode_blocking );
        [returnCode,sixth_Joint]=vrep.simxGetObjectHandle(clientID,'LBR4p_joint6',vrep.simx_opmode_blocking );
        [returnCode,seventh_Joint]=vrep.simxGetObjectHandle(clientID,'LBR4p_joint7',vrep.simx_opmode_blocking );
        [returnCode,left_Motor]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_leftMotor',vrep.simx_opmode_blocking );
        [returnCode,mtb_motor]=vrep.simxGetObjectHandle(clientID,'MTB_axis1',vrep.simx_opmode_blocking );

       % [returnCode,front_Sensor]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor5',vrep.simx_opmode_blocking );
       
       %check the hand-shake
        vrep.simxAddStatusbarMessage(clientID,'Hello V-REP!',vrep.simx_opmode_oneshot);
        %handle vision sensor
        %[returnCode,camera]=vrep.simxGetObjectHandle(clientID,'Vision_sensor',vrep.simx_opmode_blocking );

        %joint desired velocity input 
        [returnCode]=vrep.simxSetJointTargetVelocity(clientID,fourth_Joint,50*pi/180,vrep.simx_opmode_blocking );
        %[returnCode]=vrep.simxSetJointTargetVelocity(clientID,second_Joint,0.01,vrep.simx_opmode_oneshot );
        %[returnCode]=vrep.simxSetJointTargetVelocity(clientID,third_Joint,1,vrep.simx_opmode_oneshot );
        %[returnCode]=vrep.simxSetJointTargetVelocity(clientID,fourth_Joint,189,vrep.simx_opmode_oneshot );
        %[returnCode]=vrep.simxSetJointTargetVelocity(clientID,fifth_Joint,0.9,vrep.simx_opmode_streaming );
        %[returnCode]=vrep.simxSetJointTargetVelocity(clientID,sixth_Joint,9000,vrep.simx_opmode_streaming );
        %[returnCode]=vrep.simxSetJointTargetVelocity(clientID,seventh_Joint,32,vrep.simx_opmode_streaming );
        [returnCode]=vrep.simxSetJointTargetVelocity(clientID,left_Motor,0.1,vrep.simx_opmode_blocking );
        [returnCode]=vrep.simxSetJointTargetVelocity(clientID,mtb_motor,0.1,vrep.simx_opmode_blocking );

        %[returnCode,detectionState,detectedPoint,~,~]=vrep.simxReadProximitySensor(clientID,front_Sensor,vrep.simx_opmode_streaming);
       % [returnCode,resolution,image]=vrep.simxGetVisionSensorImage2(clientID,camera,1,vrep.simx_opmode_streaming);
        
        %tic
        

        for i=1:50
         %   [returnCode,detectionState,detectedPoint,~,~]=vrep.simxReadProximitySensor(clientID,front_Sensor,vrep.simx_opmode_buffer);
         %   [returnCode,resolution,image]=vrep.simxGetVisionSensorImage2(clientID,camera,1,vrep.simx_opmode_buffer);
           %disp(toc)
          %  imshow(image)
        %    disp(norm(detectedPoint));
            pause(0.1);
        end
        
        [returnCode]=vrep.simxSetJointTargetVelocity(clientID,fourth_Joint,0,vrep.simx_opmode_blocking );
        
        [returnCode]=vrep.simxSetJointTargetVelocity(clientID,left_Motor,0,vrep.simx_opmode_blocking );

        [returnCode]=vrep.simxSetJointTargetVelocity(clientID,mtb_motor,0,vrep.simx_opmode_blocking );

                
                
        vrep.simxFinish(clientID);
        
        
        
 end
 
 vrep.delete(); % call the destructor!