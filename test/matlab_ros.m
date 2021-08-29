function matlab_ros_node()
% setenv('ROS_MASTER_URI','http://11.0.100.202:11311')
% % setenv('ROS_IP','11.0.18.58')
% rosinit
% ¶©ÔÄÕß
global chatterSub 
global stdIntSub
global chatterpub
global stdIntPub
stdIntPub = rospublisher('/stdInt', rostype.std_msgs_Int16);
stdIntSub = rossubscriber('/stdInt',@rosStdIntCb);
chatterSub = rossubscriber('/chatter',@rosChatterCb);
chatterpub = rospublisher('/chatter',rostype.std_msgs_String);
%chatterpub = rospublisher('/chatter', 'IsLatching', true);


chatterPubMsg()
end
function rosStdIntCb(~, message)
    intdata = message.Data
end 
function rosChatterCb(~, message)
    %exampleHelperROSPoseCallback Subscriber callback function for pose data    
    %   exampleHelperROSPoseCallback(~,MESSAGE) returns no arguments - it instead sets 
    %   global variables to the values of position and orientation that are
    %   received in the ROS message MESSAGE.
    %   
    %   See also ROSPublishAndSubscribeExample.
    
    %   Copyright 2014-2015 The MathWorks, Inc.
    
    % Declare global variables to store position and orientation
    global getStr
    % Extract position and orientation from the ROS message and assign the
    % data to the global variables.
     getStr = message.Data
end

function chatterPubMsg()
    global chatterpub
    global stdIntPub
    r = rosrate(1);
    reset(r);
    stdIntMsg = rosmessage(stdIntPub);
    chattermsg = rosmessage(chatterpub);
    
    chattermsg.Data = "hello world ! matlab";
    stdIntMsg.Data =0;
    while(1)
        stdIntMsg.Data=stdIntMsg.Data+1;
        send(chatterpub,chattermsg);
        send(stdIntPub,stdIntMsg);
        waitfor(r);
    end

end