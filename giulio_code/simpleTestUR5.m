% Copyright 2006-2016 Coppelia Robotics GmbH. All rights reserved. 
% marc@coppeliarobotics.com
% www.coppeliarobotics.com
% 
% -------------------------------------------------------------------
% THIS FILE IS DISTRIBUTED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED
% WARRANTY. THE USER WILL USE IT AT HIS/HER OWN RISK. THE ORIGINAL
% AUTHORS AND COPPELIA ROBOTICS GMBH WILL NOT BE LIABLE FOR DATA LOSS,
% DAMAGES, LOSS OF PROFITS OR ANY OTHER KIND OF LOSS WHILE USING OR
% MISUSING THIS SOFTWARE.
% 
% You are free to use/modify/distribute this file for whatever purpose!
% -------------------------------------------------------------------
%
% This file was automatically created for V-REP release V3.3.2 on August 29th 2016

% Make sure to have the server side running in V-REP: 
% in a child script of a V-REP scene, add following command
% to be executed just once, at simulation start:
%
% simExtRemoteApiStart(19999)
%
% then start simulation, and run this program.
%
% IMPORTANT: for each successful call to simxStart, there
% should be a corresponding call to simxFinish at the end!



function simpleTestUR5()
    disp('Program started');
    % vrep=remApi('remoteApi','extApi.h'); % using the header (requires a compiler)
    vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
    vrep.simxFinish(-1); % just in case, close all opened connections
    clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

    function T = calculateDirect()
        
            q1 = pi/2;
    q2 = pi/2;
    q3 = 0;
    q4 = pi/2;
    q5 = 0;
    q6 = pi/2;

            d = 0.0892;
            a = 0;
            alpha = pi/2;
            %q1 = 0;
            m_joint1 = [cos(q1)     -cos(alpha)*sin(q1)     sin(alpha)*sin(q1)  a*cos(q1); 
                        sin(q1)     cos(alpha)*cos(q1)      -sin(alpha)*cos(q1) a*sin(q1); 
                        0           sin(alpha)              cos(alpha)          d; 
                        0           0                       0                   1];
            %%%%%%%%%%%%%%%%%%%%%%%
            m_joint1 = eye(4);
            d = 0;
            a = -0.4250;
            alpha = 0;
            %q2 = pi/2;
            m_joint2 = [cos(q2)     -cos(alpha)*sin(q2)     sin(alpha)*sin(q2)  a*cos(q2); 
                        sin(q2)     cos(alpha)*cos(q2)      -sin(alpha)*cos(q2) a*sin(q2); 
                        0           sin(alpha)              cos(alpha)          d; 
                        0           0                       0                   1];
            %%%%%%%%%%%%%%%%%%%%%%%%%%
            
            d = 0;
            a = -0.392;
            alpha = 0;
            %q3 = 0;
            m_joint3 = [cos(q3)     -cos(alpha)*sin(q3)     sin(alpha)*sin(q3)  a*cos(q3); 
                        sin(q3)     cos(alpha)*cos(q3)      -sin(alpha)*cos(q3) a*sin(q3); 
                        0           sin(alpha)              cos(alpha)          d; 
                        0           0                       0                   1];
            %%%%%%%%%%%%%%%%%%%%%%%%%%
            d = 0.109;
            a = 0;
            alpha = pi/2;
            %q4 = -pi/2;
            m_joint4 = [cos(q4)     -cos(alpha)*sin(q4)     sin(alpha)*sin(q4)  a*cos(q4); 
                        sin(q4)     cos(alpha)*cos(q4)      -sin(alpha)*cos(q4) a*sin(q4); 
                        0           sin(alpha)              cos(alpha)          d; 
                        0           0                       0                   1];
            %%%%%%%%%%%%%%%%%%%%%%%%%%
            d = 0.094;
            a = 0;
            alpha = -pi/2;
            %q5 = 0;
            m_joint5 = [cos(q5)     -cos(alpha)*sin(q5)     sin(alpha)*sin(q5)  a*cos(q5); 
                        sin(q5)     cos(alpha)*cos(q5)      -sin(alpha)*cos(q5) a*sin(q5); 
                        0           sin(alpha)              cos(alpha)          d; 
                        0           0                       0                   1];
            %%%%%%%%%%%%%%%%%%%%%%%%%%
            d = 0.082;
            a  =0;
            alpha = 0;
            %q6 = 0;
            m_joint6 = [cos(q6)     -cos(alpha)*sin(q6)     sin(alpha)*sin(q6)  a*cos(q6); 
                        sin(q6)     cos(alpha)*cos(q6)      -sin(alpha)*cos(q6) a*sin(q6); 
                        0           sin(alpha)              cos(alpha)          d; 
                        0           0                       0                   1];
            %%%%%%%%%%%%%%%%%%%%%%%%%%
            v = [ 0 0 0 1];
            T = m_joint1*m_joint2*m_joint3*m_joint4*m_joint5*m_joint6;%*v';%m_joint5;%*v';%*m_joint6;
            disp(T);
            
            T1 = m_joint1%*v';%m_joint5;%*v';%*m_joint6;
            disp(T1);
             
            T2 = m_joint1*m_joint2;%*v';%m_joint5;%*v';%*m_joint6;
            disp(T2);
    end



    if (clientID>-1)
        disp('Connected to remote API server');
            
        % Now try to retrieve data in a blocking fashion (i.e. a service call):
        [res,objs]=vrep.simxGetObjects(clientID,vrep.sim_handle_all,vrep.simx_opmode_blocking);
        if (res==vrep.simx_return_ok)
            fprintf('Number of objects in the scene: %d\n',length(objs));
        else
            fprintf('Remote API function call returned with error code: %d\n',res);
        end
   
        
        
        directK = calculateDirect();
        
        
        
        
      
       %[returnCode0,handleH1]=vrep.simxGetObjectHandle(clientID,'LBR4_link8',vrep.simx_opmode_oneshot_wait);
        %[returnCode1,p] = vrep.simxGetObjectPosition(clientID,handleH1,-1,vrep.simx_opmode_streaming);
        %disp(p);
        %disp(returnCode0);
        %disp(returnCode1);
        % Now send some data to V-REP in a non-blocking fashion:
        vrep.simxAddStatusbarMessage(clientID,'Hello V-REP!',vrep.simx_opmode_oneshot);

        % Before closing the connection to V-REP, make sure that the last command sent out had time to arrive. You can guarantee this with (for example):
        %vrep.simxGetPingTime(clientID);
    
        % Now close the connection to V-REP:    
        %vrep.simxFinish(clientID);
    else
        disp('Failed connecting to remote API server');
    end
    vrep.delete(); % call the destructor!
    
    disp('Program ended');
end
