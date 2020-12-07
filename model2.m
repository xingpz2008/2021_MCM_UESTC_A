clc;
clear;

JobLibrary=xlsread('JobLibrary.xlsx');
surveylist=xlsread('survey_list.xlsx');
%Metainfo of Xls data
AttributeNum=9;
DataNum=74;
JobNum=9;
%End of Meta data

MeanVal=mean(JobLibrary,1);
MeanProfit=MeanVal(2);

for i=1:JobNum
    JobLibrary(i,2)=JobLibrary(i,2)/MeanProfit;
end

ID=1;
JobID=1;
Score=[];
for i=1:DataNum
    for j=1:JobNum
        DataPreProcess;
        Score(ID,JobID)=Process_Single_Job(JobVectorfromList,ExpectVectorfromList,WeightVectorfromList,ID,JobAttrExfromList,surveylist);
        JobID=JobID+1;
    end
    ID=ID+1;
    JobID=1;
end