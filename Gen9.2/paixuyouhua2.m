function [Taskpercore,line0,score00,score0,sumbit]=paixuyouhua2(pathofDTA,core,m)
%初始化数据
gibt=zeros(1,m);
for i=1:m
    gibt(i)=pathofDTA.list(i).bytes;
end
sumbit=sum(gibt);
Taskpercore=ceil(m/core);
%排序优化 先判断是否需要优化
%初始化
line0=1:m;
score00=taskputrand2(line0,core,m,gibt);
cyclenum=core*Taskpercore*100;
score0=score00;
if(Taskpercore>1)
    for i=1:cyclenum
        line=randperm(m);
        score=taskputrand2(line,core,m,gibt);
        if(score<score0)
            line0=line;
            score0=score;
        end
    end
else
    line0=1:m;
end
end