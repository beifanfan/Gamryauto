function pathlist=pathchange(pathofDTA)
    [~,m]=size(pathofDTA.list);
    for i=1:m
        pathlist{i,1}=pathofDTA.list(i).name;
    end
end