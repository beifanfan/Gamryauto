function varargout = Gamryautogui(varargin)
% GAMRYAUTOGUI MATLAB code for Gamryautogui.fig
%      GAMRYAUTOGUI, by itself, creates a new GAMRYAUTOGUI or raises the existing
%      singleton*.
%
%      H = GAMRYAUTOGUI returns the handle to a new GAMRYAUTOGUI or the handle to
%      the existing singleton*.
%
%      GAMRYAUTOGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAMRYAUTOGUI.M with the given input arguments.
%
%      GAMRYAUTOGUI('Property','Value',...) creates a new GAMRYAUTOGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gamryautogui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gamryautogui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gamryautogui

% Last Modified by GUIDE v2.5 03-Aug-2021 16:00:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Gamryautogui_OpeningFcn, ...
    'CloseRequestFcn',  @Gamryautogui_CloseRequestFcn,...
    'gui_OutputFcn',  @Gamryautogui_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Gamryautogui is made visible.
function Gamryautogui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gamryautogui (see VARARGIN)
% Choose default command line output for Gamryautogui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gamryautogui wait for user response (see UIRESUME)
% uiwait(handles.figuremain);
handles.cyclechoice=1;
%handles.canshu0.Reference=0.218;%type1
%handles.canshu0.Area=1;%type1
%handles.canshu0.pH=0;%type1
% handles.canshu0.Reference=0.2046;%type2
% handles.canshu0.Area=1;%type2
% handles.canshu0.pH=6.86;%type2
handles.canshu0.Reference=0.098;%type3
handles.canshu0.Area=0.0707;%type3
handles.canshu0.pH=14;%type3
handles.Originstate=0;
handles.genfilepath='D:\';
handles.folderindex=[1 1];
handles.drawdata.type=0;
handles.Referencetext.String=num2str(handles.canshu0.Reference);
handles.Areatext.String=num2str(handles.canshu0.Area);
handles.pHtext.String=num2str(handles.canshu0.pH);
handles.Eminedit.String='Auto';
handles.Emaxedit.String='Auto';
handles.Iminedit.String='Auto';
handles.Imaxedit.String='Auto';
handles.pathedit.String='???????????????';
handles.timechoice.Visible='off';
handles.Echoice.Visible='off';
handles.Ichoice.Visible='off';
MatlabProcess = System.Diagnostics.Process.GetCurrentProcess(); %// "Matlab" process
cpuIdleProcess = 'Idle' ;
strdata.str1='';
strdata.str2='';
strdata.str3='';
handles.Cyclechoice.ColumnWidth={300};
handles.foldertable.ColumnWidth={300};
CPUdata.NumOfCPU = double(System.Environment.ProcessorCount);
CPUdata.ProcPerfCounter.Matlab  = System.Diagnostics.PerformanceCounter('Process', '% Processor Time', MatlabProcess.ProcessName );
CPUdata.ProcPerfCounter.cpuIdle = System.Diagnostics.PerformanceCounter('Process', '% Processor Time', cpuIdleProcess );
ud1=struct('statenum',0,'handle',handles,'Times',0,'CPUDATA',CPUdata,'STRdata',strdata,'Statebefore',-1,'Report','','Time',0);
handles.statetreat=timer(...
    'Name','StatetreatTimer',...
    'TimerFcn',@ExecuteTask1,...
    'ErrorFcn',@ExecuteError1,...
    'Period',0.099,...
    'ExecutionMode','fixedrate');
set(handles.statetreat,'UserData',ud1);
start(handles.statetreat);

handles.core=maxNumCompThreads();
set(hObject,'DeleteFcn',@Mainclose);
guidata(hObject,handles);


% --- Outputs from this function are returned to the command line.
function varargout = Gamryautogui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in folderchoice.
function folderchoice_Callback(hObject, eventdata, handles)
handles.pathofDTA=finddata2();
[DTAnumjudge,~]=size(handles.pathofDTA);
if(DTAnumjudge>0)
    handles.pathedit.String=['??????????????????',handles.pathofDTA.data(1).Folderpath];
    handles.foldertable.Data=pathchange(handles.pathofDTA);
    handles.foldertable.ColumnWidth={300};
    handles.canshuin=canshuchushi(handles.pathofDTA,handles.canshu0);
    handles.statetreat.Userdata.statenum=1;
else
    handles.statetreat.Userdata.statenum=7;
end

guidata(hObject,handles);
% hObject    handle to folderchoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Referencetext_Callback(hObject, eventdata, handles)
% hObject    handle to Referencetext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Referencetext as text
%        str2double(get(hObject,'String')) returns contents of Referencetext as a double


% --- Executes during object creation, after setting all properties.
function Referencetext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Referencetext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Areatext_Callback(hObject, eventdata, handles)
% hObject    handle to Areatext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Areatext as text
%        str2double(get(hObject,'String')) returns contents of Areatext as a double


% --- Executes during object creation, after setting all properties.
function Areatext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Areatext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pHtext_Callback(hObject, eventdata, handles)
% hObject    handle to pHtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pHtext as text
%        str2double(get(hObject,'String')) returns contents of pHtext as a double


% --- Executes during object creation, after setting all properties.
function pHtext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pHtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pathedit_Callback(hObject, eventdata, handles)
% hObject    handle to pathedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pathedit as text
%        str2double(get(hObject,'String')) returns contents of pathedit as a double


% --- Executes during object creation, after setting all properties.
function pathedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pathedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Canshuconfirm.
function Canshuconfirm_Callback(hObject, eventdata, handles)
% hObject    handle to Canshuconfirm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.canshuin(handles.folderindex(1,1)).Reference=str2num(handles.Referencetext.String);
handles.canshuin(handles.folderindex(1,1)).Area=str2num(handles.Areatext.String);
handles.canshuin(handles.folderindex(1,1)).pH=str2num(handles.pHtext.String);
guidata(hObject,handles);




% --- Executes during object creation, after setting all properties.



function drawchoiceedit_Callback(hObject, eventdata, handles)
% hObject    handle to drawchoiceedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of drawchoiceedit as text
%        str2double(get(hObject,'String')) returns contents of drawchoiceedit as a double


% --- Executes during object creation, after setting all properties.


function figuremain_WindowButtonMotionFcn(hObject, eventdata, handles)





% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in datasavebutton.
function datasavebutton_Callback(hObject, eventdata, handles)
% hObject    handle to datasavebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
datasave(handles.sumdata,handles.pathofDTA)
handles.statetreat.Userdata.statenum=3;
guidata(hObject,handles);



% --- Executes on button press in Opendata.
function Opendata_Callback(hObject, eventdata, handles)
% hObject    handle to Opendata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fname, pname] = uigetfile();
a=load([pname,fname]);
handles.sumdata=a.Summary_data.sumdata;
handles.pathofDTA=a.Summary_data.pathofDTA;
handles.pathedit.String=handles.pathofDTA.data(1).Folderpath;
handles.foldertable.Data=pathchange(handles.pathofDTA);
handles.foldertable.ColumnWidth={300};
handles.canshuin=canshugouzao(handles.sumdata);

handles.statetreat.Userdata.statenum=4;

guidata(hObject,handles);



% --- Executes on button press in bingxingcal.



% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in Chaoranbutton.
function Chaoranbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Chaoranbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p=handles.statetreat.Userdata.statenum;
if(p==2||p==3||p==4)
Chaoranjifen;
handles.statetreat.Userdata.Statebefore=10;
assignin('base','statebase',1);
else
    handles.statetreat.Userdata.Report='???????????????????????????';
end


% --- Executes on button press in Autofindbutton.
function Autofindbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Autofindbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.pathofDTA,DTAnum,foldernum]=autosearchnew(handles.genfilepath,0,{},1,0);
handles.statetreat.Userdata.Report=['????????????',num2str(DTAnum-1),'????????????'];
handles.pathedit.String=handles.genfilepath;
handles.foldertable.Data=pathchange(handles.pathofDTA);
handles.foldertable.ColumnWidth={300};
handles.canshuin=canshuchushi(handles.pathofDTA,handles.canshu0);
handles.statetreat.Userdata.statenum=1;


guidata(hObject,handles);




% --- Executes when selected cell(s) is changed in foldertable.
function foldertable_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to foldertable (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
handles.folderindex=eventdata.Indices;
p=handles.statetreat.Userdata.statenum;
if(isempty(handles.folderindex))
    handles.folderindex=[1 1];
    handles.Referencetext.String=num2str(handles.canshuin(handles.folderindex(1,1)).Reference);
    handles.Areatext.String=num2str(handles.canshuin(handles.folderindex(1,1)).Area);
    handles.pHtext.String=num2str(handles.canshuin(handles.folderindex(1,1)).pH);
else
    handles.cyclechoice=0;
    handles.Referencetext.String=num2str(handles.canshuin(handles.folderindex(1,1)).Reference);
    handles.Areatext.String=num2str(handles.canshuin(handles.folderindex(1,1)).Area);
    handles.pHtext.String=num2str(handles.canshuin(handles.folderindex(1,1)).pH);
    if(p==2||p==3||p==4)
        [~,m]=size(handles.sumdata(handles.folderindex(1,1)).data.cycle);
        for i=1:m
            showtable{i,1}=['cycle',num2str(i)];
        end
        handles.Cyclechoice.Data=showtable;
        if(strcmp(handles.sumdata(handles.folderindex(1,1)).judge,'CV')||strcmp(handles.sumdata(handles.folderindex(1,1)).judge,'LSV'))
            handles.timechoice.String='??????';
            handles.Echoice.String='??????';
            handles.Ichoice.String='??????';
            handles.timechoice.Visible='off';
            handles.Echoice.Visible='on';
            handles.Ichoice.Visible='on';
        elseif(strcmp(handles.sumdata(handles.folderindex(1,1)).judge,'EISPOT'))
            handles.timechoice.String='Freq';
            handles.Echoice.String='Zreal';
            handles.Ichoice.String='Zimag';
            handles.timechoice.Visible='on';
            handles.Echoice.Visible='on';
            handles.Ichoice.Visible='on';
        else
            handles.timechoice.String='??????';
            handles.Echoice.String='??????';
            handles.Ichoice.String='??????';
            handles.timechoice.Visible='on';
            handles.Echoice.Visible='on';
            handles.Ichoice.Visible='on';
        end
    end
end
guidata(hObject,handles);


% --- Executes when selected cell(s) is changed in Cyclechoice.
function Cyclechoice_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to Cyclechoice (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
handles.cyclefolderindex=eventdata.Indices;
if(isempty(handles.cyclefolderindex))
    handles.cyclechoice=0;
else
    handles.cyclechoice=handles.folderindex(1,1);
    %handles.Datashow.Data=handles.sumdata(handles.folderindex(1,1)).data.cycle(handles.cyclechoice).data;
    if(strcmp(handles.sumdata(handles.folderindex(1,1)).judge,'CV')||strcmp(handles.sumdata(handles.folderindex(1,1)).judge,'LSV'))
        fileID = fopen('copy.txt','w');
        fprintf(fileID,'%12.8f %12.8f\n',handles.sumdata(handles.folderindex(1,1)).data.cycle(handles.cyclefolderindex(1,1)).data');
        text = fileread('copy.txt');
        clipboard('copy', text );
    else
        k=1;
        copydata=[];
        if(handles.timechoice.Value)
            copydata(:,k)=handles.sumdata(handles.folderindex(1,1)).data.cycle(handles.cyclefolderindex(1,1)).data(:,1);
            k=k+1;
        end
        if(handles.Echoice.Value)
            copydata(:,k)=handles.sumdata(handles.folderindex(1,1)).data.cycle(handles.cyclefolderindex(1,1)).data(:,2);
            k=k+1;
        end
        if(handles.Ichoice.Value)
            copydata(:,k)=handles.sumdata(handles.folderindex(1,1)).data.cycle(handles.cyclefolderindex(1,1)).data(:,3);
        end
        [~,n]=size(copydata);
        fileID = fopen('copy.txt','w');
        if(n==1)
            fprintf(fileID,'%12.8f\n',copydata');
        elseif(n==2)
            fprintf(fileID,'%12.8f %12.8f\n',copydata');
        elseif(n==3)
            fprintf(fileID,'%12.8f %12.8f %12.8f\n',copydata');
        end
        text = fileread('copy.txt');
        clipboard('copy', text );
    end
    
end
guidata(hObject,handles);

% --- Executes on button press in timechoice.
function timechoice_Callback(hObject, eventdata, handles)
% hObject    handle to timechoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of timechoice


% --- Executes on button press in Echoice.
function Echoice_Callback(hObject, eventdata, handles)
% hObject    handle to Echoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Echoice


% --- Executes on button press in Ichoice.
function Ichoice_Callback(hObject, eventdata, handles)
% hObject    handle to Ichoice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Ichoice


% --- Executes on button press in Toorigin.
function Toorigin_Callback(hObject, eventdata, handles)
% hObject    handle to Toorigin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(handles.Originstate==0)
    %?????????Origin
    handles.originObj = actxserver('Origin.ApplicationSI');   % ??????Origin??????????????????????????????COM?????????
    invoke(handles.originObj, 'Execute', 'doc -mc 1;');       % ???????????????
    invoke(handles.originObj, 'IsModified', 'false'); 
    handles.Originstate=1;
end
if(handles.Originstate)
if(~isempty(handles.folderindex))
    transferdata=[];
    bookname=handles.originObj.ActivePage.name;
    wks = handles.originObj.FindWorksheet(bookname);
    wks.Activate;
    if(strcmp(handles.sumdata(handles.folderindex(1,1)).judge,'CV')||strcmp(handles.sumdata(handles.folderindex(1,1)).judge,'LSV'))
        if(handles.cyclechoice>1)
            [kk,~]=size(handles.cyclefolderindex);
            if(kk>1)
                for i=1:kk
                    k=wks.Columns.count+1;
                    transferdata=handles.sumdata(handles.folderindex(1,1)).data.cycle(handles.cyclefolderindex(i,1)).data;
                    invoke(handles.originObj, 'PutWorksheet', ['[',bookname,']',wks.name], transferdata,0,wks.Columns.count);
                    handles.originObj.Execute(['wks.col',num2str(k),'.Unit$=V vs.RHE']);
                    handles.originObj.Execute(['wks.col',num2str(k),'.lname$=Potential']);
                    handles.originObj.Execute(['wks.col',num2str(k+1),'.Unit$=mA/cm2']);
                    [~,m]=size(handles.sumdata(handles.folderindex(1,1)).DTAname);
                    handles.originObj.Execute(['wks.col',num2str(k+1),'.Comment$=',handles.sumdata(handles.folderindex(1,1)).DTAname(:,1:m-4),' cycle',num2str(handles.cyclefolderindex(i,1))]);
                    handles.originObj.Execute(['wks.col',num2str(k+1),'.lname$=Current density']);
                    handles.originObj.Execute(['wks.col',num2str(k),'.type=4']);
                    handles.originObj.Execute(['wks.col',num2str(k+1),'.type=1']);
                end
            else
                k=wks.Columns.count+1;
                transferdata=handles.sumdata(handles.folderindex(1,1)).data.cycle(handles.cyclefolderindex(1,1)).data;
                invoke(handles.originObj, 'PutWorksheet', ['[',bookname,']',wks.name], transferdata,0,wks.Columns.count);
                handles.originObj.Execute(['wks.col',num2str(k),'.Unit$=V vs.RHE']);
                handles.originObj.Execute(['wks.col',num2str(k),'.lname$=Potential']);
                handles.originObj.Execute(['wks.col',num2str(k+1),'.Unit$=mA/cm2']);
                [~,m]=size(handles.sumdata(handles.folderindex(1,1)).DTAname);
                handles.originObj.Execute(['wks.col',num2str(k+1),'.lname$=Current density']);
                handles.originObj.Execute(['wks.col',num2str(k),'.type=4']);
                handles.originObj.Execute(['wks.col',num2str(k+1),'.type=1']);
                [~,kkk]=size(handles.sumdata(handles.folderindex(1,1)).data.cycle);
                if(kkk>1)
                    handles.originObj.Execute(['wks.col',num2str(k+1),'.Comment$=',handles.sumdata(handles.folderindex(1,1)).DTAname(:,1:m-4),' cycle',num2str(handles.cyclefolderindex(1,1))]);
                else
                    handles.originObj.Execute(['wks.col',num2str(k+1),'.Comment$=',handles.sumdata(handles.folderindex(1,1)).DTAname(:,1:m-4)]);
                end
            end
        else
            [~,kk]=size(handles.sumdata(handles.folderindex(1,1)).data.cycle);
            if(kk>1)
                for i=1:kk
                    k=wks.Columns.count+1;
                    transferdata=handles.sumdata(handles.folderindex(1,1)).data.cycle(i).data;
                    invoke(handles.originObj, 'PutWorksheet', ['[',bookname,']',wks.name], transferdata,0,wks.Columns.count);
                    handles.originObj.Execute(['wks.col',num2str(k),'.Unit$=V vs.RHE']);
                    handles.originObj.Execute(['wks.col',num2str(k),'.lname$=Potential']);
                    handles.originObj.Execute(['wks.col',num2str(k+1),'.Unit$=mA/cm2']);
                    [~,m]=size(handles.sumdata(handles.folderindex(1,1)).DTAname);
                    handles.originObj.Execute(['wks.col',num2str(k+1),'.Comment$=',handles.sumdata(handles.folderindex(1,1)).DTAname(:,1:m-4),' cycle',num2str(i)]);
                    handles.originObj.Execute(['wks.col',num2str(k+1),'.lname$=Current density']);
                    handles.originObj.Execute(['wks.col',num2str(k),'.type=4']);
                    handles.originObj.Execute(['wks.col',num2str(k+1),'.type=1']);
                end
            else
                k=wks.Columns.count+1;
                transferdata=handles.sumdata(handles.folderindex(1,1)).data.cycle(1).data;
                invoke(handles.originObj, 'PutWorksheet', ['[',bookname,']',wks.name], transferdata,0,wks.Columns.count);
                handles.originObj.Execute(['wks.col',num2str(k),'.Unit$=V vs.RHE']);
                handles.originObj.Execute(['wks.col',num2str(k),'.lname$=Potential']);
                handles.originObj.Execute(['wks.col',num2str(k+1),'.Unit$=mA/cm2']);
                [~,m]=size(handles.sumdata(handles.folderindex(1,1)).DTAname);
                handles.originObj.Execute(['wks.col',num2str(k+1),'.lname$=Current density']);
                handles.originObj.Execute(['wks.col',num2str(k),'.type=4']);
                handles.originObj.Execute(['wks.col',num2str(k+1),'.type=1']);
                    handles.originObj.Execute(['wks.col',num2str(k+1),'.Comment$=',handles.sumdata(handles.folderindex(1,1)).DTAname(:,1:m-4)]);
            end
        end    
    elseif(strcmp(handles.sumdata(handles.folderindex(1,1)).judge,'EISPOT'))
        k=1;
        p=wks.Columns.count+1;
        if(handles.timechoice.Value)
            transferdata(:,k)=handles.sumdata(handles.folderindex(1,1)).data.cycle(1).data(:,1);
            k=k+1;
        end
        if(handles.Echoice.Value)
            transferdata(:,k)=handles.sumdata(handles.folderindex(1,1)).data.cycle(1).data(:,2);
            k=k+1;
        end
        if(handles.Ichoice.Value)
            transferdata(:,k)=handles.sumdata(handles.folderindex(1,1)).data.cycle(1).data(:,3);
        end
        invoke(handles.originObj, 'PutWorksheet', ['[',bookname,']',wks.name], transferdata,0,wks.Columns.count);
        k=p;
        if(handles.timechoice.Value)
            handles.originObj.Execute(['wks.col',num2str(k),'.lname$=Frequency']);
            handles.originObj.Execute(['wks.col',num2str(k),'.Unit$=Hz']);
            handles.originObj.Execute(['wks.col',num2str(k),'.type=4']);
            k=k+1;
        end
        if(handles.Echoice.Value)
            handles.originObj.Execute(['wks.col',num2str(k),'.lname$=Zreal']);
            handles.originObj.Execute(['wks.col',num2str(k),'.Unit$=Ohm']);
            handles.originObj.Execute(['wks.col',num2str(k),'.type=1']);
            [~,m]=size(handles.sumdata(handles.folderindex(1,1)).DTAname);
            handles.originObj.Execute(['wks.col',num2str(k),'.Comment$=',handles.sumdata(handles.folderindex(1,1)).DTAname(:,1:m-4)]);
            k=k+1;
        end
        if(handles.Ichoice.Value)
            handles.originObj.Execute(['wks.col',num2str(k),'.lname$=Zimag']);
            handles.originObj.Execute(['wks.col',num2str(k),'.Unit$=Ohm']);
            handles.originObj.Execute(['wks.col',num2str(k),'.type=1']);
            [~,m]=size(handles.sumdata(handles.folderindex(1,1)).DTAname);
            handles.originObj.Execute(['wks.col',num2str(k),'.Comment$=',handles.sumdata(handles.folderindex(1,1)).DTAname(:,1:m-4)]);
            k=k+1;
        end
    else
        k=1;
        p=wks.Columns.count+1;
        if(handles.timechoice.Value)
            transferdata(:,k)=handles.sumdata(handles.folderindex(1,1)).data.cycle(1).data(:,1);
            k=k+1;
        end
        if(handles.Echoice.Value)
            transferdata(:,k)=handles.sumdata(handles.folderindex(1,1)).data.cycle(1).data(:,2);
            k=k+1;
        end
        if(handles.Ichoice.Value)
            transferdata(:,k)=handles.sumdata(handles.folderindex(1,1)).data.cycle(1).data(:,3);
            k=k+1;
        end
        invoke(handles.originObj, 'PutWorksheet', ['[',bookname,']',wks.name], transferdata,0,wks.Columns.count);
        k=p;
        if(handles.timechoice.Value)
            handles.originObj.Execute(['wks.col',num2str(k),'.lname$=Time']);
            handles.originObj.Execute(['wks.col',num2str(k),'.Unit$=s']);
            handles.originObj.Execute(['wks.col',num2str(k),'.type=4']);
            k=k+1;
        end
        if(handles.Echoice.Value)
            handles.originObj.Execute(['wks.col',num2str(k),'.lname$=Potential']);
            handles.originObj.Execute(['wks.col',num2str(k),'.Unit$=V vs.RHE']);
            handles.originObj.Execute(['wks.col',num2str(k),'.type=1']);
            [~,m]=size(handles.sumdata(handles.folderindex(1,1)).DTAname);
            handles.originObj.Execute(['wks.col',num2str(k),'.Comment$=',handles.sumdata(handles.folderindex(1,1)).DTAname(:,1:m-4)]);
            k=k+1;
        end
        if(handles.Ichoice.Value)
            handles.originObj.Execute(['wks.col',num2str(k),'.lname$=Current']);
            handles.originObj.Execute(['wks.col',num2str(k),'.Unit$=mA']);
            handles.originObj.Execute(['wks.col',num2str(k),'.type=1']);
            [~,m]=size(handles.sumdata(handles.folderindex(1,1)).DTAname);
            handles.originObj.Execute(['wks.col',num2str(k),'.Comment$=',handles.sumdata(handles.folderindex(1,1)).DTAname(:,1:m-4)]);
            k=k+1;
        end
    end
end
end



guidata(hObject,handles);


% --- Executes on button press in Calbutton.
function Calbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Calbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pp=handles.statetreat.Userdata.statenum;
if(pp~=0)
    starttime=handles.statetreat.Userdata.Time;
    handles.statetreat.Userdata.Report='?????????';
    pause(0.001);
    [handles.sumdata,~]=datamain4(handles.pathofDTA,handles.canshuin,handles.core);
    %handles.sumdata{14,1}=handles.selpath;
    %handles.sumdata=fuzhufunction(handles.sumdata,handles.canshu,handles.selpath);
    assignin('base','Sumdata',handles.sumdata);
    endtime=handles.statetreat.Userdata.Time;
    handles.statetreat.Userdata.Report=['??????',num2str(endtime-starttime),'s'];
    handles.statetreat.Userdata.statenum=2;
    guidata(hObject,handles);
else
    handles.statetreat.Userdata.Report='??????????????????';
end
guidata(hObject,handles);
