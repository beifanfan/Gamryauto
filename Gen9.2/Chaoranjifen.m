function varargout = Chaoranjifen(varargin)
% CHAORANJIFEN MATLAB code for Chaoranjifen.fig
%      CHAORANJIFEN, by itself, creates a new CHAORANJIFEN or raises the existing
%      singleton*.
%
%      H = CHAORANJIFEN returns the handle to a new CHAORANJIFEN or the handle to
%      the existing singleton*.
%
%      CHAORANJIFEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAORANJIFEN.M with the given input arguments.
%
%      CHAORANJIFEN('Property','Value',...) creates a new CHAORANJIFEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Chaoranjifen_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Chaoranjifen_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Chaoranjifen

% Last Modified by GUIDE v2.5 15-Jul-2021 19:52:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Chaoranjifen_OpeningFcn, ...
                   'gui_OutputFcn',  @Chaoranjifen_OutputFcn, ...
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


% --- Executes just before Chaoranjifen is made visible.
function Chaoranjifen_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Chaoranjifen (see VARARGIN)

% Choose default command line output for Chaoranjifen
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes Chaoranjifen wait for user response (see UIRESUME)
% uiwait(handles.Chaoran_figure);
handles.sumdata=evalin('base','Sumdata');
[~,m]=size(handles.sumdata);
for i=1:m
    handles.pathh{i,1}=handles.sumdata(i).DTAname;
end
handles.subflodertable.Data=handles.pathh;
handles.subflodertable.ColumnWidth={300};
handles.folderindex=[1 1];
set(handles.range1l,'String','1200.8');
set(handles.range1r,'String','1203');
set(handles.range2l,'String','1800.8');
set(handles.range2r,'String','1803');
set(handles.range3l,'String','2400.8');
set(handles.range3r,'String','2403');
set(handles.range4l,'String','3000.8');
set(handles.range4r,'String','3003');
set(handles.range5l,'String','3600.8');
set(handles.range5r,'String','3603');
set(hObject,'DeleteFcn',@Chaoranclose);
guidata(hObject,handles);
% --- Outputs from this function are returned to the command line.
function varargout = Chaoranjifen_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function range1l_Callback(hObject, eventdata, handles)
% hObject    handle to range1l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of range1l as text
%        str2double(get(hObject,'String')) returns contents of range1l as a double


% --- Executes during object creation, after setting all properties.
function range1l_CreateFcn(hObject, eventdata, handles)
% hObject    handle to range1l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function range2l_Callback(hObject, eventdata, handles)
% hObject    handle to range2l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of range2l as text
%        str2double(get(hObject,'String')) returns contents of range2l as a double


% --- Executes during object creation, after setting all properties.
function range2l_CreateFcn(hObject, eventdata, handles)
% hObject    handle to range2l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function range3l_Callback(hObject, eventdata, handles)
% hObject    handle to range3l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of range3l as text
%        str2double(get(hObject,'String')) returns contents of range3l as a double


% --- Executes during object creation, after setting all properties.
function range3l_CreateFcn(hObject, eventdata, handles)
% hObject    handle to range3l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function range4l_Callback(hObject, eventdata, handles)
% hObject    handle to range4l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of range4l as text
%        str2double(get(hObject,'String')) returns contents of range4l as a double


% --- Executes during object creation, after setting all properties.
function range4l_CreateFcn(hObject, eventdata, handles)
% hObject    handle to range4l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function range5l_Callback(hObject, eventdata, handles)
% hObject    handle to range5l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of range5l as text
%        str2double(get(hObject,'String')) returns contents of range5l as a double


% --- Executes during object creation, after setting all properties.
function range5l_CreateFcn(hObject, eventdata, handles)
% hObject    handle to range5l (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function range1r_Callback(hObject, eventdata, handles)
% hObject    handle to range1r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of range1r as text
%        str2double(get(hObject,'String')) returns contents of range1r as a double


% --- Executes during object creation, after setting all properties.
function range1r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to range1r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function range2r_Callback(hObject, eventdata, handles)
% hObject    handle to range2r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of range2r as text
%        str2double(get(hObject,'String')) returns contents of range2r as a double


% --- Executes during object creation, after setting all properties.
function range2r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to range2r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function range3r_Callback(hObject, eventdata, handles)
% hObject    handle to range3r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of range3r as text
%        str2double(get(hObject,'String')) returns contents of range3r as a double


% --- Executes during object creation, after setting all properties.
function range3r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to range3r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function range4r_Callback(hObject, eventdata, handles)
% hObject    handle to range4r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of range4r as text
%        str2double(get(hObject,'String')) returns contents of range4r as a double


% --- Executes during object creation, after setting all properties.
function range4r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to range4r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function range5r_Callback(hObject, eventdata, handles)
% hObject    handle to range5r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of range5r as text
%        str2double(get(hObject,'String')) returns contents of range5r as a double


% --- Executes during object creation, after setting all properties.
function range5r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to range5r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in jifenbutton.
function jifenbutton_Callback(hObject, eventdata, handles)
% hObject    handle to jifenbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jifenqujian=zeros(5,2);
jifenqujian(1,1)=str2num(get(handles.range1l,'String'));
jifenqujian(1,2)=str2num(get(handles.range1r,'String'));
jifenqujian(2,1)=str2num(get(handles.range2l,'String'));
jifenqujian(2,2)=str2num(get(handles.range2r,'String'));
jifenqujian(3,1)=str2num(get(handles.range3l,'String'));
jifenqujian(3,2)=str2num(get(handles.range3r,'String'));
jifenqujian(4,1)=str2num(get(handles.range4l,'String'));
jifenqujian(4,2)=str2num(get(handles.range4r,'String'));
jifenqujian(5,1)=str2num(get(handles.range5l,'String'));
jifenqujian(5,2)=str2num(get(handles.range5r,'String'));
choiceout=handles.folderindex(:,1)';
jifensum=chaoranjifen1(jifenqujian,choiceout,handles.sumdata);
assignin('base','Jifendata',jifensum);


% --- Executes when selected cell(s) is changed in subflodertable.
function subflodertable_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to subflodertable (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
handles.folderindex=eventdata.Indices;
guidata(hObject,handles);
