function canshuin=canshugouzao(sumdata)
[~,m]=size(sumdata);
for i=1:m
    canshuin(i).Reference=sumdata(i).canshu1;
    canshuin(i).Area=sumdata(i).canshu2;
    canshuin(i).pH=sumdata(i).canshu3;
end

end