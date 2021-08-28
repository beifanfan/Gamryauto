function jifensum=chaoranjifen1(jifenqujian,choiceout,sumdata)

[~,n]=size(choiceout);
%输出文件构建
jifensum{1,2}='range1';
jifensum{1,3}='range2';
jifensum{1,4}='range3';
jifensum{1,5}='range4';
jifensum{1,6}='range5';
for i=1:1:n
    jifensum{i+1,1}=sumdata(choiceout(i)).DTAname;
end
%开始计算
for i=1:n
    data=[];
    [~,k]=size(sumdata(choiceout(i)).data.cycle(1).data);
    if(k<3)
        continue
    end
    data(:,1)=sumdata(choiceout(i)).data.cycle(1).data(:,1);
    data(:,2)=sumdata(choiceout(i)).data.cycle(1).data(:,3);
    sum=zeros(5);
    for j=1:5
        [tip,~]=find(data(:,1)==jifenqujian(j,1));
        if(isempty(tip))
            continue
        end
        while(data(tip,1)<jifenqujian(j,2))
            sum(j)=sum(j)+(data(tip+1,1)-data(tip,1))*(data(tip,2)+data(tip+1,2))/2;
            tip=tip+1;
        end
        jifensum{i+1,j+1}=sum(j)/1000;
    end
end
end