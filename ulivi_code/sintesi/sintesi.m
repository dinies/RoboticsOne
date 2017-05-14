function varargout = sintesi(varargin)
% SINTESI Application M-file for sintesi.fig
%   SINTESI, by itself, creates a new SINTESI or raises the existing
%   singleton*.
%
%   H = SINTESI returns the handle to a new SINTESI or the handle to
%   the existing singleton*.
%
%   SINTESI('CALLBACK',hObject,eventData,handles,...) calls the local
%   function named CALLBACK in SINTESI.M with the given input arguments.
%
%   SINTESI('Property','Value',...) creates a new SINTESI or raises the
%   existing singleton*.  Starting from the left, property value pairs are
%   applied to the GUI before sintesi_OpeningFunction gets called.  An
%   unrecognized property name or invalid value makes property application
%   stop.  All inputs are passed to sintesi_OpeningFcn via varargin.
%
%   *See GUI Options - GUI allows only one instance to run (singleton).
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sintesi

% Last Modified by GUIDE v2.5 08-May-2004 18:28:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',          mfilename, ...
                   'gui_Singleton',     gui_Singleton, ...
                   'gui_OpeningFcn',    @sintesi_OpeningFcn, ...
                   'gui_OutputFcn',     @sintesi_OutputFcn, ...
                   'gui_LayoutFcn',     [], ...
                   'gui_Callback',      []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    varargout{1:nargout} = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before sintesi is made visible.
function sintesi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sintesi (see VARARGIN)

% Choose default command line output for sintesi
handles.output = hObject;

% Update handles structure

handles.prevplot=0;
guidata(hObject, handles);

f1 = str2double(get(handles.f1,'String'));
f2 = str2double(get(handles.f2,'String'));
w = logspace(floor(log10(f1)),ceil(log10(f2)),500);
axes(handles.mod_axes)
semilogx(w,zeros(size(w)))
axes(handles.fas_axes)
semilogx(w,zeros(size(w)))
set(handles.text13,'Visible','off');

% UIWAIT makes sintesi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sintesi_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes during object creation, after setting all properties.
function mod_axes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mod_axes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate mod_axes
%axes(handles.mod_axes)

% --- Executes during object creation, after setting all properties.
function fas_axes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fas_axes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate fas_axes
%axes(handles.fas_axes)

% --- Executes during object creation, after setting all properties.
function rete_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in rete.
function rete_Callback(hObject, eventdata, handles)
% hObject    handle to rete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns rete contents as cell array
%        contents{get(hObject,'Value')} returns selected item from rete


% --- Executes during object creation, after setting all properties.
function Num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Num_Callback(hObject, eventdata, handles)
% hObject    handle to Num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Num as text
%        str2double(get(hObject,'String')) returns contents of Num as a double


% --- Executes during object creation, after setting all properties.
function Den_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Den (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Den_Callback(hObject, eventdata, handles)
% hObject    handle to Den (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Den as text
%        str2double(get(hObject,'String')) returns contents of Den as a double


% --- Executes during object creation, after setting all properties.
function Mrete_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mrete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Mrete_Callback(hObject, eventdata, handles)
% hObject    handle to Mrete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mrete as text
%        str2double(get(hObject,'String')) returns contents of Mrete as a double


% --- Executes during object creation, after setting all properties.
function Taurete_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Taurete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function Taurete_Callback(hObject, eventdata, handles)
% hObject    handle to Taurete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Taurete as text
%        str2double(get(hObject,'String')) returns contents of Taurete as a double

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
%get(handles.checkbox1,'Value')

% --- Executes during object creation, after setting all properties.
function f1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function f1_Callback(hObject, eventdata, handles)
% hObject    handle to f1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f1 as text
%        str2double(get(hObject,'String')) returns contents of f1 as a double


% --- Executes during object creation, after setting all properties.
function f2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function f2_Callback(hObject, eventdata, handles)
% hObject    handle to f2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f2 as text
%        str2double(get(hObject,'String')) returns contents of f2 as a double


% -----diagrammi di Bode normali-------------------------
function varargout = plot_button_Callback(h, eventdata, handles, varargin)
% hObject    handle to plot_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get user input from GUI
nu = eval(get(handles.Num,'String'));
de = eval(get(handles.Den,'String'));
f1 = str2double(get(handles.f1,'String'));
f2 = str2double(get(handles.f2,'String'));
M = str2double(get(handles.Mrete,'String'));
tau = str2double(get(handles.Taurete,'String'));

set(handles.text4,'String','Mod(F)')
set(handles.text5,'String','Fase(F)')
if handles.prevplot==1, set(handles.checkbox1,'Value',1), end

handles.prevplot = 0; 
guidata(h,handles);
set(handles.text13,'Visible','off');

% Calculate data
w = logspace(floor(log10(f1)),ceil(log10(f2)),500);

popup_sel_index = get(handles.rete, 'Value');
switch popup_sel_index
    case 1
        %anticipatrice
        nr= [tau 1];
        dr= [tau/M 1];
    case 2
        %attenuatrice
        nr= [tau/M 1];
        dr= [tau 1];
end
disp(' '), disp('Processo')
printsys(nu,de), 
disp(' '), disp('rete')
printsys(nr,dr)

[mod,fas]=bode(nu,de,w);
[mr,fr]=bode(nr,dr,w);
% plot modulo
axes(handles.mod_axes)
if get(handles.checkbox1,'Value')==1, hold off, end;
semilogx(w,20*log10(mod))
set(handles.mod_axes,'XMinorTick','on')
grid on
hold on
semilogx(w,zeros(size(w)))
semilogx(w, 20*log10(mr),'r')
semilogx(w, 20*log10(mr.*mod),'k')


% plot fase
axes(handles.fas_axes)
if get(handles.checkbox1,'Value')==1, hold off, end;
semilogx(w,fas)
set(handles.fas_axes,'XMinorTick','on')
grid on
hold on
semilogx(w,-180*ones(size(w)))
semilogx(w,fr,'r')
semilogx(w,fas+fr,'k')



% --- Diagrammi a ciclo chiuso ----------------------------
function W_Callback(hObject, eventdata, handles)
% hObject    handle to W (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nu = eval(get(handles.Num,'String'));
de = eval(get(handles.Den,'String'));
f1 = str2double(get(handles.f1,'String'));
f2 = str2double(get(handles.f2,'String'));
M = str2double(get(handles.Mrete,'String'));
tau = str2double(get(handles.Taurete,'String'));

set(handles.text4,'String','W(jw)')
set(handles.text5,'String','W(t)')
handles.prevplot
if handles.prevplot==0, set(handles.checkbox1,'Value',1), end
handles.prevplot = 1; 
guidata(hObject,handles);
set(handles.text13,'Visible','on');

% Calculate data
w = logspace(floor(log10(f1)),ceil(log10(f2)),500);

popup_sel_index = get(handles.rete, 'Value');
switch popup_sel_index
    case 1
        %anticipatrice
        nr= [tau 1];
        dr= [tau/M 1];
    case 2
        %attenuatrice
        nr= [tau/M 1];
        dr= [tau 1];
end

sproc=tf(nu,de);
srete=tf(nr,dr);
sist=(sproc*srete)/(1+sproc*srete)
[mod,fas]=bode(sist,w);
Tmax=0.25/min(w);
[risp,tempo]=step(sist,0:Tmax/500:Tmax);

if sum(real(roots(sist.den{1}))>0)==0,
    istabile=0;
else
    istabile=1;
end

% plot modulo risp armonica ciclo chiuso
axes(handles.mod_axes)
if get(handles.checkbox1,'Value')==1, hold off, end;
semilogx(w, 20*log10(squeeze(mod)))
set(handles.mod_axes,'XMinorTick','on')
if istabile, ...
        a=axis;
        text(sqrt(a(2)*a(1)),(a(4)+a(3))/2,'sistema instabile!','fontsize',24,...
        'color','red','HorizontalAlignment','center'),
end
grid on
hold on

% plot risposta a gradino
axes(handles.fas_axes)
if get(handles.checkbox1,'Value')==1, hold off, end;
plot(tempo,risp)
set(handles.fas_axes,'XMinorTick','on')
grid on
hold on


% --- Diagrammi di Bode asintotici --------------------------------
function plot_asint_Callback(h, eventdata, handles)
% hObject    handle to plot_asint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get user input from GUI
nu = eval(get(handles.Num,'String'));
de = eval(get(handles.Den,'String'));
f1 = str2double(get(handles.f1,'String'));
f2 = str2double(get(handles.f2,'String'));
M = str2double(get(handles.Mrete,'String'));
tau = str2double(get(handles.Taurete,'String'));

set(handles.text4,'String','Mod(F)')
set(handles.text5,'String','Fase(F)')
if handles.prevplot==1, set(handles.checkbox1,'Value',1), end

handles.prevplot = 0; 
guidata(h,handles);
set(handles.text13,'Visible','off');

% Calculate data
w = logspace(floor(log10(f1)),ceil(log10(f2)),500);

popup_sel_index = get(handles.rete, 'Value');
switch popup_sel_index
    case 1
        %anticipatrice
        nr= [tau 1];
        dr= [tau/M 1];
    case 2
        %attenuatrice
        nr= [tau/M 1];
        dr= [tau 1];
end
disp(' '), disp('Processo')
printsys(nu,de), 
disp(' '), disp('rete')
printsys(nr,dr)

[mod,fas]=asintotico(nu,de,w);
[mr,fr]=asintotico(nr,dr,w);
% plot modulo
axes(handles.mod_axes)
if get(handles.checkbox1,'Value')==1, hold off, end;
semilogx(w,mod)
set(handles.mod_axes,'XMinorTick','on')
grid on
hold on
semilogx(w,zeros(size(w)))
semilogx(w, mr,'r')
semilogx(w, mr+mod,'k')


% plot fase
axes(handles.fas_axes)
if get(handles.checkbox1,'Value')==1, hold off, end;
semilogx(w,fas)
set(handles.fas_axes,'XMinorTick','on')
grid on
hold on
semilogx(w,-180*ones(size(w)))
semilogx(w,fr,'r')
semilogx(w,fas+fr,'k')


