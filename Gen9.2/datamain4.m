function [sumdata,Reportword]=datamain4(pathofDTA,canshuin,core)
Reportword='';
[~,m]=size(pathofDTA.list);
for i=1:m
    sumdata(i)=Gamrydataload5(pathofDTA.list(i).DTApath,canshuin(i),pathofDTA.list(i).name,pathofDTA.list(i).Id);
end

end