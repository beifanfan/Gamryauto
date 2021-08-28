function canshu=canshutreat(canshuin,handles)
[m,~]=size(canshuin);
m=m-1;
globalcanshu(1)=str2num(get(handles.Referencetext,'String'));
globalcanshu(2)=str2num(get(handles.Areatext,'String'));
globalcanshu(3)=str2num(get(handles.pHtext,'String'));
canshu=zeros(m,3);
for i=1:m
    for j=1:3
        if(strcmp(canshuin{i+1,j+1},'Global'))
            canshu(i,j)=globalcanshu(j);
        else
            canshu(i,j)=canshuin{i+1,j+1};
        end
    end
end
end