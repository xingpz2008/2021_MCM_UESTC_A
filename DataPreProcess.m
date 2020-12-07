%JobVector Including 
%   income, distance(ex), transportsimularity(minus m), time(assum), type(ex), sociality(ex),
%   profession(ex), workload^-1, periodsimularity(minus m), 9 intotal.
%ExpectVector and Weight Vector Shares the same number of attributes as the
%Job Vector
%Pre process of JobVector,ExpectVector,WeightVector



%For an individual, weight vector and expect vector should be single,
%jobvector varies
%At moment and furtue, individual data shares the same formant as the
%surveylist
%Set an ID as to choose the individual or custom person( -1)
%Process the ID data in survey list
WeightVectorfromList=[surveylist(ID,3)+1,surveylist(ID,7)+1,surveylist(ID,11)+1,surveylist(ID,19)+1,surveylist(ID,21)+1];
%WeightVectorfromList=WeightVectorfromList./4;

%Process expect vector, extrac first
ExpectVectorfromList=[surveylist(ID,4)/MeanProfit,3,1,surveylist(ID,20)^(-1),4];

%process job vector
TransAvail=0;
TimeAvail=0;
for i=1:3
    if(JobLibrary(JobID,3+i)>surveylist(ID,7+i))
        TransAvail=TransAvail+1;
    end
end
for i=1:4
    if(JobLibrary(JobID,11+i)<=surveylist(ID,21+i))
        TimeAvail=TimeAvail+1;
    end
end

JobVectorfromList=[JobLibrary(JobID,2),TransAvail,(1+abs(JobLibrary(JobID,7)-surveylist(ID,12)))^(-1),JobLibrary(JobID,11)^(-1),TimeAvail];
JobAttrExfromList=[abs(JobLibrary(JobID,3)-surveylist(ID,6)),abs(JobLibrary(JobID,8)-surveylist(ID,14)),abs(JobLibrary(JobID,9)-surveylist(ID,16)),abs(JobLibrary(JobID,10)-surveylist(ID,18))];