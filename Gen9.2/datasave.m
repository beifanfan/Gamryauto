function datasave(sumdata,pathofDTA)
[~,foldernum]=size(pathofDTA.data);
for i=1:foldernum
    selpath=pathofDTA.data(i).Folderpath;
    [~,pp]=size(selpath);
    selpath(pp+1)='\';
    mkdir(selpath,'Savedata');
    selpath(pp+2:pp+10)='Savedata\';
    [~,DTAnuminfolder]=size(pathofDTA.data(i).DTAdata);
    pathofDTAforsave.data(1)=pathofDTA.data(i);
    for k=1:DTAnuminfolder
        numinlist=Idfindlist(pathofDTA,pathofDTA.data(i).DTAdata(k).Id);
        sumdataforsave(k)=sumdata(numinlist);
        pathofDTAforsave.list(k)=pathofDTA.list(numinlist);
        datause=sumdata(numinlist).data;
        cyclenum=sumdata(numinlist).cyclenumble;
        DTAname=pathofDTA.list(numinlist).name;
        [~,qq]=size(DTAname);
        if(~isequal(datause,0))
            if(cyclenum==1||cyclenum==0)
                DTAname(:,qq-2:qq)='txt';
                dlmwrite([selpath,DTAname], datause.cycle(1).data,'delimiter','\t','precision', 6);
            else
                foldername=DTAname(1:qq-3);
                [~,p]=size(datause.cycle);
                foldername2=foldername;
                foldername2(qq-2)='\';
                mkdir(selpath,foldername);
                for j=1:p
                    pathh='cycle';
                    num=num2str(j);
                    [~,lengh]=size(num);
                    pathh(6:5+lengh)=num;
                    pathh(6+lengh:9+lengh)='.txt';
                    dlmwrite([selpath,foldername2,pathh], datause.cycle(j).data,'delimiter','\t','precision', 6);
                end
            end
        else
            continue
        end
    end
    Summary_data.sumdata=sumdataforsave;
    Summary_data.pathofDTA=pathofDTAforsave;
    save([selpath,'Summary_data','.mat'],'Summary_data');
end

end