function sumdata=fuzhufunction(sumdata,canshu,selpath)
[~,m]=size(sumdata);
[n,~]=size(canshu);
%Tafel计算
sumdata{12,1}='Tafeldata';
for i=2:m
    if(strcmp(sumdata{3,i},'CV')||strcmp(sumdata{3,i},'LSV'))
        if(sumdata{4,i}==1)
            if(sumdata{7,i}<=5)
                logI=log10(abs(sumdata{2,i}(:,2)));
                sumdata{12,i}(:,1)=logI;
                sumdata{12,i}(:,2)=sumdata{2,i}(:,1);
            else
                sumdata{12,i}='High scan speed';
            end
        else
            if(sumdata{7,i}<=5)
                [~,p]=size(sumdata{2,i});
                for j=1:p
                    logI=log10(sumdata{2,i}{2,j}(:,2));
                    sumdata{12,i}{1,j}=j;
                    sumdata{12,i}{2,j}(:,1)=logI;
                    sumdata{12,i}{2,j}(:,2)=sumdata{2,i}{2,j}(:,1);
                end
            else
                sumdata{12,i}='High scan speed';
            end
        end
    else
        sumdata{12,i}=[];
    end
end
%反应类型猜测
sumdata{13,1}='H/OER';
for i=2:m
    if(m==n)
        if(((sumdata{5,i}+sumdata{6,i})/2+canshu(i,1)+0.0592*canshu(i,3))>1.23)
            sumdata{13,i}='OER';
        elseif(((sumdata{5,i}+sumdata{6,i})/2+canshu(i,1)+0.0592*canshu(i,3))<0)
            sumdata{13,i}='HER';
        else
            sumdata{13,i}='-';
        end
    else
        if(((sumdata{5,i}+sumdata{6,i})/2+canshu(1,1)+0.0592*canshu(1,3))>1.23)
            sumdata{13,i}='OER';
        elseif(((sumdata{5,i}+sumdata{6,i})/2+canshu(1,1)+0.0592*canshu(1,3))<0)
            sumdata{13,i}='HER';
        else
            sumdata{13,i}='-';
        end
    end
end
sumdata{14,1}=selpath;
end