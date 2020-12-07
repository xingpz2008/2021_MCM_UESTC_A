function [rank] = Process_Single_Job(JobVector,ExpectVector,WeightVector,ID,JobAttrEx,surveylist)
%JobVector Including 
%   income, distance(ex), transportsimularity(minus m), time(assum), type(ex), sociality(ex),
%   profession(ex), workload^-1, periodsimularity(minus m), 9 intotal.
%ExpectVector and Weight Vector Shares the same number of attributes as the
%Job Vector
NormalVector=WeightVector.^(-1);
DegreeN2UnderV=dot(NormalVector,JobVector)/(norm(NormalVector)*norm(JobVector));
%calculated the cosin 

DistanceFromOri=1/norm(NormalVector);
DistanceUnderV=DistanceFromOri/DegreeN2UnderV;
if(DistanceUnderV>norm(JobVector))
    DistanceUnderV=norm(JobVector);
end

DegreeExp2Job=dot(ExpectVector,JobVector)/(norm(ExpectVector)*norm(JobVector));
DegreeExp2Job=sqrt(1-DegreeExp2Job^2);

%calculated the sin

rank=DistanceUnderV*norm(JobVector)/(1+DegreeExp2Job);

%addition: process excluded factor:
%   income, distance(ex), transportsimularity(minus m), time(assum), type(ex), sociality(ex),
%   profession(ex), workload^-1, periodsimularity(minus m), 9 intotal.
TotalWeightVal=surveylist(ID,3)+surveylist(ID,5)+surveylist(ID,7)+surveylist(ID,11)+surveylist(ID,13)+surveylist(ID,15)+surveylist(ID,17)+surveylist(ID,19)+surveylist(ID,21);
DistanceRatio=surveylist(ID,5)/TotalWeightVal;
TypeRatio=surveylist(ID,13)/TotalWeightVal;
SocialalityRatio=surveylist(ID,15)/TotalWeightVal;
ProfessionRatio=surveylist(ID,17)/TotalWeightVal;

rank=rank-rank*DistanceRatio*(JobAttrEx(1)/2);
rank=rank-rank*TypeRatio*(JobAttrEx(2)/4);
rank=rank-rank*SocialalityRatio*(JobAttrEx(3)/2);
rank=rank-rank*ProfessionRatio*(JobAttrEx(4)/3);
end

