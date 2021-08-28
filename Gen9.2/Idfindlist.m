function numinlist=Idfindlist(pathofDTA,Id)
[~,m]=size(pathofDTA.list);
for i=1:m
    if(pathofDTA.list(i).Id==Id)
        numinlist=i;
        break
    end
end
end