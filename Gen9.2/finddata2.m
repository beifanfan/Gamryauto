function pathofDTA=finddata2()
selpath = uigetdir;
if(selpath~=0)
    filepaths = dir(fullfile(selpath,'*.DTA'));
    [DTAnumjudge,~]=size(filepaths);
    if(DTAnumjudge>0)
        pathofDTA.data(1).Folderpath=selpath;
        [m,~]=size(filepaths);
        for i=1:m
            pathofDTA.data(1).DTAdata(i).bytes=filepaths(i).bytes;
            pathofDTA.data(1).DTAdata(i).name=filepaths(i).name;
            pathofDTA.data(1).DTAdata(i).DTApath=[filepaths(i).folder,'\',filepaths(i).name];
            pathofDTA.data(1).DTAdata(i).Id=i;
            pathofDTA.list(i).Ceng=0;
            pathofDTA.list(i).DTApath=[filepaths(i).folder,'\',filepaths(i).name];
            pathofDTA.list(i).Folderpath=selpath;
            pathofDTA.list(i).bytes=filepaths(i).bytes;
            pathofDTA.list(i).name=filepaths(i).name;
            pathofDTA.list(i).Id=i;
        end
    else
        [pathofDTA,~,~]=autosearchnew2([selpath,'\'],0,{},1,0);
    end
else
    pathofDTA=[];
end
end