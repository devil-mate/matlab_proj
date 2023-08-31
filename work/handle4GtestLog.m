function handle4GtestLog()
clc
clear
global sourceData
readData();
dealData();

end

function readData()
fileName = "D:\psg\0Proj\roadRobot_baseStation\testData\m4GTestData\test4G_E20_R05_lib.csv";
opts = delimitedTextImportOptions; 
a=  readmatrix(fileName,opts);
% format shortEng
format longG
global sourceData
sourceData=  readmatrix(fileName);

%type D:\psg\0Proj\roadRobot_baseStation\testData\m4GTestData\5.31_TEST_4G_E20_READ_highway_data.txt
end

function dealData()
global sourceData
sourceData(:,5);
[m,n] = size(sourceData);
% sourceData(end,5) -sourceData(1,5);
gapTime=0;
gapCount=0;
errorCount =0;
lastErrorTime =0;
for i=1:m-1
    gapTime = sourceData(i+1,5) -sourceData(i,5);
    if gapTime>=300
        gapCount=gapCount+1;
        fprintf("gapTime:%d at %d, count[%d] \n",gapTime,sourceData(i+1,5),gapCount);
%         fprintf('\n');
    end 
    if sourceData(i+1,2) -sourceData(i,2) >0
        errorCount=errorCount+1;
        lastErrorTime =(sourceData(i+1,5)-lastErrorTime)/1000;
        fprintf("error:%4d  at %8d, errorGap[%5.2fs] \n",...
                sourceData(i+1,2),sourceData(i+1,5),lastErrorTime);
        lastErrorTime = sourceData(i+1,5);
    end
end
if gapCount<=0
    fprintf("no gapTime\n")
end
totalTime = (sourceData(end,5)-sourceData(1,5))/1000;
fprintf("error:[%d],  total count [%d], total time[%fs] \n",...
        sourceData(end,2),sourceData(end,4)-sourceData(1,4),totalTime);



end