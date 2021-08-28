function [pathofDTA,DTAnum,foldernum]=autosearchnew2(genfilepath,cengshu,pathofDTA,DTAnum,foldernum)
%E:\For Profession\DATA\Gamry\
flag=0;
if(cengshu<4)
    DTApath=dir(fullfile(genfilepath,'*.DTA'));
    Allpath=dir(genfilepath);
    [DTApathlength,~]=size(DTApath);
    [Allpathlength,~]=size(Allpath);
    if(DTApathlength~=0)
%         for i=3:Allpathlength
%             if(strcmp(Allpath(i).name,'Savedata'))
%                 flag=1;
%                 break;
%             end
%         end
        if(flag==0)
            foldernum=foldernum+1;
            pathofDTA.data(foldernum).Folderpath=genfilepath;
            for i=1:DTApathlength
                pathofDTA.list(DTAnum).Ceng=cengshu;
                pathofDTA.list(DTAnum).DTApath=[DTApath(i).folder,'\',DTApath(i).name];
                pathofDTA.list(DTAnum).Folderpath=genfilepath;
                pathofDTA.list(DTAnum).bytes=DTApath(i).bytes;
                pathofDTA.list(DTAnum).name=DTApath(i).name;
                pathofDTA.list(DTAnum).Id=DTAnum;
                pathofDTA.data(foldernum).DTAdata(i).DTApath=[DTApath(i).folder,'\',DTApath(i).name];
                pathofDTA.data(foldernum).DTAdata(i).bytes=DTApath(i).bytes;
                pathofDTA.data(foldernum).DTAdata(i).name=DTApath(i).name;
                pathofDTA.data(foldernum).DTAdata(i).Id=DTAnum;
                DTAnum=DTAnum+1;
            end
        end
    end
    if(Allpathlength>2)
        cengshu=cengshu+1;
        for i=3:Allpathlength
            if(Allpath(i).isdir)
                [pathofDTA,DTAnum,foldernum]=autosearchnew2([Allpath(i).folder,'\',Allpath(i).name,'\'],cengshu,pathofDTA,DTAnum,foldernum);
            else
                continue
            end
        end
    end
end


end