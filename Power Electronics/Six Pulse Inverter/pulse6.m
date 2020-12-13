

function varargout = pulse6(varargin)
% PULSE6 MATLAB code for pulse6.fig
%      PULSE6, by itself, creates a new PULSE6 or raises the existing
%      singleton*.
%
%      H = PULSE6 returns the handle to a new PULSE6 or the handle to
%      the existing singleton*.
%
%      PULSE6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PULSE6.M with the given input arguments.
%
%      PULSE6('Property','Value',...) creates a new PULSE6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pulse6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pulse6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pulse6

% Last Modified by GUIDE v2.5 13-May-2018 21:46:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pulse6_OpeningFcn, ...
                   'gui_OutputFcn',  @pulse6_OutputFcn, ...
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


% --- Executes just before pulse6 is made visible.
function pulse6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pulse6 (see VARARGIN)

% Choose default command line output for pulse6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pulse6 wait for user response (see UIRESUME)
%uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pulse6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pushbutton1.


switch(get(eventdata.NewValue,'tag'));
    case'radiobutton1'
        set(handles.text2,'string','R');
        s=1;
       [x,map]=imread('Capture11.png');
        axes(handles.axes1);
         imshow(x,map);
         set(handles.text8,'visible','on');
     case'radiobutton2'
         s=2;
         set(handles.text2,'string','RL');
        [x,map]=imread('Capture22.png');
         axes(handles.axes1);
        imshow(x,map);
        set(handles.text8,'visible','off');
end
set(handles.text10,'string',s);

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
%if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
   % set(hObject,'BackgroundColor','white');
%end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%returns contents of edit2 as a double



% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
%if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
 %   set(hObject,'BackgroundColor','white');
%end




function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double




% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
%if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
 %   set(hObject,'BackgroundColor','white');
%end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
%if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    %set(hObject,'BackgroundColor','white');
%end



function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 %sim('pulse66');
 
 
 
 a=str2double(get(handles.edit1,'string'));
 b=str2double(get(handles.edit2,'string'));
 c=str2double(get(handles.edit3,'string'));
 d=str2double(get(handles.edit4,'string'));
load_system('pulse66');
%get_param('pulse66/Bridge Firing Unit (DC)', 'DialogParameters')

set_param('pulse66/Bridge Firing Unit (DC)','x4',num2str(d));
set_param('pulse66/Series RLC Branch','Resistance',num2str(a));
set_param('pulse66/Series RLC Branch','Inductance',num2str(b));
set_param('pulse66/AC Voltage Source','Amplitude',num2str(c));
set_param('pulse66/AC Voltage Source2','Amplitude',num2str(c));
set_param('pulse66/AC Voltage Source1','Amplitude',num2str(c));
set_param('pulse66/AC Voltage Source1','Frequency',num2str(d));
set_param('pulse66/AC Voltage Source2','Frequency',num2str(d));
set_param('pulse66/AC Voltage Source','Frequency',num2str(d));
save_system('pulse66');
close_system('pulse66');
sim('pulse66');
  load('wave.mat')
  load('input3.mat')
  load('time.mat')
  load('output.mat')
   load('input1.mat')
Va=input1(2,1:500);
Vc=wave(2,1:500);
Vb=input3(2,1:500);
Angle=2*pi*60*time(2,1:500);
Vo=output(2,1:500);
set(gca,'Xlim',[0,18],'Ylim',[-1000,1000]);
%set(gca,'XAxisLocation' , 'origin');
 
%{
ax = gca;
ax.XLim = [0 4*180]
ax.XTick = [0 180 2*180 3*180 4*180]
ax.XAxisLocation = 'origin';
 %}
grid on 
curve= animatedline('color','b','parent',handles.axes2);
curve2= animatedline('color','y','parent',handles.axes2);
curve1= animatedline('color','r','parent',handles.axes2);
curve3=animatedline('color','g','parent',handles.axes2);
 for i=1:500
     addpoints (curve,Angle(i),Va(i));
     addpoints (curve1,Angle(i),Vb(i));
     addpoints (curve2,Angle(i),Vc(i));
     addpoints (curve3,Angle(i),Vo(i));
     drawnow limitrate
     pause (0.01);
 end   
 d=str2double(get(handles.text10,'string'));
if d==1
   [x,map]=imread('Capture11.png');
        axes(handles.axes1);
         imshow(x,map);
         
else          
     [x,map]=imread('Capture22.png');
         axes(handles.axes1);
        imshow(x,map);
end        