function canshuin=canshuchushi(pathofDTA,canshu0)
[~,m]=size(pathofDTA.list);
for i=1:m
    canshuin(i).Reference=canshu0.Reference;
    canshuin(i).Area=canshu0.Area;
    canshuin(i).pH=canshu0.pH;
end
end