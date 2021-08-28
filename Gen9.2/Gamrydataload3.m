function [outdata,judge,cyclenumble,lim1,lim2,scanrate,Elearea,Reportword]=Gamrydataload3(path)
%类型判断
[judge,yushestart,yushelieshu,cyclenumble,lim1,lim2,scanrate,Elearea,Reportword]=Gamrydatajudge2(path);
%数据读取s
fid=fopen(path,'r');
%单圈CV自动读取
if(~strcmp(judge,'EISPOT'))
if(cyclenumble==1||cyclenumble==0)
    out=textscan(fid,'%s %s %s %s %s %s %s %s %s %s %s %s',yushestart);
    out=textscan(fid,'%22.12f %22.12f %22.12f %22.12f %22.12f %22.12f %22.12f %22.12f %s %22.12f %22.12f %22.12f',100000);
    for j=1:yushelieshu
        outdata(1).data(:,j)=out{1,j};
    end
end
%多圈CV自动处理
if(cyclenumble>1)
    out=textscan(fid,'%s %s %s %s %s %s %s %s %s %s %s %s',1,'HeaderLines',yushestart);
    for kk=1:cyclenumble
        out={};
        out=textscan(fid,'%22.22f %22.22f %22.22f %22.22f %22.22f %22.22f %22.22f %22.22f %s %22.22f %22.12f %22.12f',100000);
        if(isempty(out{1}))
            break
        end
        for j=1:yushelieshu
            outdata(kk).data(:,j)=out{j};
        end
        out=textscan(fid,'%s %s %s %s %s %s %s %s %s %s %s %s',1,'HeaderLines',1);
        out=textscan(fid,'%s %s %s %s %s %s %s %s %s %s %s %s',1,'HeaderLines',1);
        out=textscan(fid,'%s %s %s %s %s %s %s %s %s %s %s %s',1,'HeaderLines',1);
    end
end
else
    %处理EIS数据
    out=textscan(fid,'%s %s %s %s %s %s %s %s %s %s %s %s %s %s',yushestart-1);
    out=textscan(fid,'%22.12f %22.12f %22.12f %22.12f %22.12f %22.12f %22.12f %22.12f %22.12f %22.12f %22.12f %22.12f',100000);
    for j=1:yushelieshu
        outdata(1).data(:,j)=out{1,j};
    end
end

fclose(fid);
end