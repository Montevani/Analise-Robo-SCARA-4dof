function varargout = RoboSCARA(varargin)
% ROBOSCARA MATLAB code for RoboSCARA.fig
%      ROBOSCARA, by itself, creates a new ROBOSCARA or raises the existing
%      singleton*.
%
%      H = ROBOSCARA returns the handle to a new ROBOSCARA or the handle to
%      the existing singleton*.
%
%      ROBOSCARA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROBOSCARA.M with the given input arguments.
%
%      ROBOSCARA('Property','Value',...) creates a new ROBOSCARA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RoboSCARA_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RoboSCARA_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RoboSCARA

% Last Modified by GUIDE v2.5 28-Jun-2016 11:26:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RoboSCARA_OpeningFcn, ...
                   'gui_OutputFcn',  @RoboSCARA_OutputFcn, ...
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

function RoboSCARA_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RoboSCARA (see VARARGIN)

% Choose default command line output for RoboSCARA
handles.output = hObject;
%Imagem?
axes(handles.axes2)
matlabImage = imread('C:\JoseMiguelRIN\Foto2.png');
image(matlabImage)
axis off
axis image

%Inicializar tudo com Zero
handles.metricdata.t1 = 0;
handles.metricdata.t2 = 0;
handles.metricdata.d3 = 0;
handles.metricdata.t4 = 0;
handles.metricdata.jt1 = 0;
handles.metricdata.jt2 = 0;
handles.metricdata.jd3 = 0;
handles.metricdata.jt4 = 0;
handles.metricdata.PhiCI = 0;
handles.metricdata.ThetaCI = 0;
handles.metricdata.PsiCI = 0;
handles.metricdata.ox = 0;
handles.metricdata.oy = 0;
handles.metricdata.oz = 0;
handles.metricdata.L1 = 0;
handles.metricdata.L2 = 0;
handles.metricdata.d4 = 0;

set(handles.L1, 'String', handles.metricdata.L1);
set(handles.L2,  'String', handles.metricdata.L2);
set(handles.d4,  'String', handles.metricdata.d4);
set(handles.t1, 'String', handles.metricdata.t1);
set(handles.t2,  'String', handles.metricdata.t2);
set(handles.d3,  'String', handles.metricdata.d3);
set(handles.t4,  'String', handles.metricdata.t4);
set(handles.jt1, 'String', handles.metricdata.jt1);
set(handles.jt2,  'String', handles.metricdata.jt2);
set(handles.jd3,  'String', handles.metricdata.jd3);
set(handles.jt4,  'String', handles.metricdata.jt4);
set(handles.PhiCD, 'String', 0);
set(handles.ThetaCD, 'String', 0);
set(handles.PsiCD, 'String', 0);
set(handles.m14, 'String', 0);
set(handles.m24, 'String', 0);
set(handles.m34, 'String', 0);
set(handles.PhiCI,  'String', handles.metricdata.PhiCI);
set(handles.ThetaCI,  'String', handles.metricdata.ThetaCI);
set(handles.PsiCI,  'String', handles.metricdata.PsiCI);
set(handles.ox,  'String', handles.metricdata.ox);
set(handles.oy,  'String', handles.metricdata.oy);
set(handles.oz,  'String', handles.metricdata.oz);
set(handles.n14, 'String', 0);
set(handles.n24, 'String', 0);
set(handles.n33, 'String', 0);
set(handles.n44, 'String', 0);
set(handles.mn11, 'String', 0);
set(handles.mn12, 'String', 0);
set(handles.mn21, 'String', 0);
set(handles.mn22, 'String', 0);
set(handles.mn33, 'String', 0);
set(handles.mn61, 'String', 0);
set(handles.mn62, 'String', 0);
set(handles.mn64, 'String', 0);
guidata(handles.figure1, handles);

% Update handles structure
guidata(hObject, handles);
function varargout = RoboSCARA_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%Variaveis para Cinem�tica Direta
function t1_Callback(hObject, eventdata, handles)
t1 = str2double(get(hObject, 'String'));
if isnan(t1)
    set(hObject, 'String', 0);
    errordlg('O �ngulo precisa ser um n�mero.','Erro');
end
handles.metricdata.t1 = t1;
guidata(hObject,handles)
function t1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function t2_Callback(hObject, eventdata, handles)
t2 = str2double(get(hObject, 'String'));
if isnan(t2)
    set(hObject, 'String', 0);
    errordlg('O �ngulo precisa ser um n�mero.','Erro');
end
handles.metricdata.t2 = t2;
guidata(hObject,handles)
function t2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function d3_Callback(hObject, eventdata, handles)
d3 = str2double(get(hObject, 'String'));
if isnan(d3)
    set(hObject, 'String', 0);
    errordlg('O comprimento precisa ser um n�mero.','Erro');
end
if (d3<0)
    set(hObject, 'String', 0);
    errordlg('O comprimento precisa ser positivo.','Erro');
end
handles.metricdata.d3 = d3;
guidata(hObject,handles)
function d3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function t4_Callback(hObject, eventdata, handles)
t4 = str2double(get(hObject, 'String'));
if isnan(t4)
    set(hObject, 'String', 0);
    errordlg('O �ngulo precisa ser um n�mero.','Erro');
end
handles.metricdata.t4 = t4;
guidata(hObject,handles)
function t4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%Painel de par�metros
function ResetPar_Callback(hObject, eventdata, handles)
handles.metricdata.L1 = 0;
handles.metricdata.L2 = 0;
handles.metricdata.d4 = 0;

set(handles.L1, 'String', handles.metricdata.L1);
set(handles.L2,  'String', handles.metricdata.L2);
set(handles.d4,  'String', handles.metricdata.d4);

function d4_Callback(hObject, eventdata, handles)
d4 = str2double(get(hObject, 'String'));
if isnan(d4)
    set(hObject, 'String', 0);
    errordlg('O comprimento precisa ser um n�mero.','Erro');
end
if (d4<0)
    set(hObject, 'String', 0);
    errordlg('O comprimento precisa ser positivo.','Erro');
end
handles.metricdata.d4 = d4;
guidata(hObject,handles)
function d4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function L2_Callback(hObject, eventdata, handles)
L2 = str2double(get(hObject, 'String'));
if isnan(L2)
    set(hObject, 'String', 0);
    errordlg('O comprimento precisa ser um n�mero.','Erro');
end
if (L2<0)
    set(hObject, 'String', 0);
    errordlg('O comprimento precisa ser positivo.','Erro');
end
handles.metricdata.L2 = L2;
guidata(hObject,handles)
function L2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function L1_Callback(hObject, eventdata, handles)
L1 = str2double(get(hObject, 'String'));
if isnan(L1)
    set(hObject, 'String', 0);
    errordlg('O comprimento precisa ser um n�mero.','Erro');
end
if (L1<0)
    set(hObject, 'String', 0);
    errordlg('O comprimento precisa ser positivo.','Erro');
end
handles.metricdata.L1 = L1;
guidata(hObject,handles)
function L1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%C�lculo da cinem�tica direta e reset
function CalcularCD_Callback(hObject, eventdata, handles)
m11 = cos(handles.metricdata.t1 + handles.metricdata.t2) * cos(handles.metricdata.t4) + sin(handles.metricdata.t1 + handles.metricdata.t2) * sin(handles.metricdata.t4);
m12 = sin(handles.metricdata.t1 + handles.metricdata.t2) * cos(handles.metricdata.t4) - cos(handles.metricdata.t1 + handles.metricdata.t2) * sin(handles.metricdata.t4);

m14 = handles.metricdata.L1*cos(handles.metricdata.t1)+handles.metricdata.L2*cos(handles.metricdata.t1 + handles.metricdata.t2);
m24 = handles.metricdata.L1*sin(handles.metricdata.t1)+handles.metricdata.L2*sin(handles.metricdata.t1 + handles.metricdata.t2);
m34 = -handles.metricdata.d3-handles.metricdata.d4;

PhiCD = atan2(m12,m11);
ThetaCD = atan2(0,1);
PsiCD = atan2(0,-1);

set(handles.m14, 'String', m14);
set(handles.m24, 'String', m24);
set(handles.m34, 'String', m34);
set(handles.PhiCD, 'String', PhiCD);
set(handles.ThetaCD, 'String', ThetaCD);
set(handles.PsiCD, 'String', PsiCD);
function ResetarCD_Callback(hObject, eventdata, handles)
handles.metricdata.t1 = 0;
handles.metricdata.t2 = 0;
handles.metricdata.d3 = 0;
handles.metricdata.t4 = 0;

set(handles.t1, 'String', handles.metricdata.t1);
set(handles.t2,  'String', handles.metricdata.t2);
set(handles.d3,  'String', handles.metricdata.d3);
set(handles.t4,  'String', handles.metricdata.t4);
set(handles.PhiCD, 'String', 0);
set(handles.ThetaCD, 'String', 0);
set(handles.PsiCD, 'String', 0);
set(handles.m14, 'String', 0);
set(handles.m24, 'String', 0);
set(handles.m34, 'String', 0);
guidata(handles.figure1, handles);


%C�lculo da cinem�tica inversa e reset
function CalcularCI_Callback(hObject, eventdata, handles)
c2 = ((handles.metricdata.ox^2)+(handles.metricdata.oy^2)-(handles.metricdata.L1^2)-(handles.metricdata.L2^2))/(2*handles.metricdata.L1*handles.metricdata.L2);
n33 = handles.metricdata.oz + handles.metricdata.d4;

%Calcula �ngulos para primeira poss�vel trajet�ria
Pn24 = atan2(c2,sqrt(1-c2));
Pn14 = atan2(handles.metricdata.ox,handles.metricdata.oy)-atan2(handles.metricdata.L1+handles.metricdata.L2*c2,handles.metricdata.L2*sin(Pn24));
Pn44 = Pn14 + Pn24 -  handles.metricdata.PhiCI;
%Calcula �ngulos para segunda poss�vel trajet�ria
Nn24 = atan2(c2,-sqrt(1-c2));
Nn14 = atan2(handles.metricdata.ox,handles.metricdata.oy)-atan2(handles.metricdata.L1+handles.metricdata.L2*c2,handles.metricdata.L2*sin(Nn24));
Nn44 = Nn14 + Nn24 -  handles.metricdata.PhiCI;
%Compara os dois e escolhe o menor, caso forem iguais n�o faz diferen�a
if ((sqrt(Nn14^2)+sqrt(Nn24^2))>(sqrt(Nn14^2)+sqrt(Nn24^2)))
    set(handles.n14, 'String', Pn14);
    set(handles.n24, 'String', Pn24);
    set(handles.n44, 'String', Pn44);
else
    set(handles.n14, 'String', Nn14);
    set(handles.n24, 'String', Nn24);
    set(handles.n44, 'String', Nn44);
end
set(handles.n33, 'String', n33);
function ResetarCI_Callback(hObject, eventdata, handles)
handles.metricdata.PhiCI = 0;
handles.metricdata.ThetaCI = 0;
handles.metricdata.PsiCI = 0;
handles.metricdata.ox = 0;
handles.metricdata.oy = 0;
handles.metricdata.oz = 0;

set(handles.PhiCI,  'String', handles.metricdata.PhiCI);
set(handles.ThetaCI,  'String', handles.metricdata.ThetaCI);
set(handles.PsiCI,  'String', handles.metricdata.PsiCI);
set(handles.ox,  'String', handles.metricdata.ox);
set(handles.oy,  'String', handles.metricdata.oy);
set(handles.oz,  'String', handles.metricdata.oz);
set(handles.n14, 'String', 0);
set(handles.n24, 'String', 0);
set(handles.n33, 'String', 0);
set(handles.n44, 'String', 0);
guidata(handles.figure1, handles);


%Variaveis para a cinem�tica inversa
function ox_Callback(hObject, eventdata, handles)
ox = str2double(get(hObject, 'String'));
if isnan(ox)
    set(hObject, 'String', 0);
    errordlg('O valor precisa ser um n�mero.','Erro');
end
handles.metricdata.ox = ox;
guidata(hObject,handles)
function ox_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function oy_Callback(hObject, eventdata, handles)
oy = str2double(get(hObject, 'String'));
if isnan(oy)
    set(hObject, 'String', 0);
    errordlg('O valor precisa ser um n�mero.','Erro');
end
handles.metricdata.oy = oy;
guidata(hObject,handles)
function oy_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function oz_Callback(hObject, eventdata, handles)
oz = str2double(get(hObject, 'String'));
if isnan(oz)
    set(hObject, 'String', 0);
    errordlg('O valor precisa ser um n�mero.','Erro');
end
handles.metricdata.oz = oz;
guidata(hObject,handles)
function oz_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function PhiCI_Callback(hObject, eventdata, handles)
PhiCI = str2double(get(hObject, 'String'));
if isnan(PhiCI)
    set(hObject, 'String', 0);
    errordlg('O valor precisa ser um n�mero.','Erro');
end
handles.metricdata.PhiCI = PhiCI;
guidata(hObject,handles)
function PhiCI_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ThetaCI_Callback(hObject, eventdata, handles)
ThetaCI = str2double(get(hObject, 'String'));
if isnan(ThetaCI)
    set(hObject, 'String', 0);
    errordlg('O valor precisa ser um n�mero.','Erro');
end
handles.metricdata.ThetaCI = ThetaCI;
guidata(hObject,handles)
function ThetaCI_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function PsiCI_Callback(hObject, eventdata, handles)
PsiCI = str2double(get(hObject, 'String'));
if isnan(PsiCI)
    set(hObject, 'String', 0);
    errordlg('O valor precisa ser um n�mero.','Erro');
end
handles.metricdata.PsiCI = PsiCI;
guidata(hObject,handles)
function PsiCI_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Outras fun��es em par�metros
function ResetTudo_Callback(hObject, eventdata, handles)
handles.metricdata.t1 = 0;
handles.metricdata.t2 = 0;
handles.metricdata.d3 = 0;
handles.metricdata.t4 = 0;
handles.metricdata.jt1 = 0;
handles.metricdata.jt2 = 0;
handles.metricdata.jd3 = 0;
handles.metricdata.jt4 = 0;
handles.metricdata.PhiCI = 0;
handles.metricdata.ThetaCI = 0;
handles.metricdata.PsiCI = 0;
handles.metricdata.ox = 0;
handles.metricdata.oy = 0;
handles.metricdata.oz = 0;
handles.metricdata.L1 = 0;
handles.metricdata.L2 = 0;
handles.metricdata.d4 = 0;

set(handles.L1, 'String', handles.metricdata.L1);
set(handles.L2,  'String', handles.metricdata.L2);
set(handles.d4,  'String', handles.metricdata.d4);
set(handles.t1, 'String', handles.metricdata.t1);
set(handles.t2,  'String', handles.metricdata.t2);
set(handles.d3,  'String', handles.metricdata.d3);
set(handles.t4,  'String', handles.metricdata.t4);
set(handles.jt1, 'String', handles.metricdata.jt1);
set(handles.jt2,  'String', handles.metricdata.jt2);
set(handles.jd3,  'String', handles.metricdata.jd3);
set(handles.jt4,  'String', handles.metricdata.jt4);
set(handles.PhiCD, 'String', 0);
set(handles.ThetaCD, 'String', 0);
set(handles.PsiCD, 'String', 0);
set(handles.m14, 'String', 0);
set(handles.m24, 'String', 0);
set(handles.m34, 'String', 0);
set(handles.PhiCI,  'String', handles.metricdata.PhiCI);
set(handles.ThetaCI,  'String', handles.metricdata.ThetaCI);
set(handles.PsiCI,  'String', handles.metricdata.PsiCI);
set(handles.ox,  'String', handles.metricdata.ox);
set(handles.oy,  'String', handles.metricdata.oy);
set(handles.oz,  'String', handles.metricdata.oz);
set(handles.n14, 'String', 0);
set(handles.n24, 'String', 0);
set(handles.n33, 'String', 0);
set(handles.n44, 'String', 0);
set(handles.mn11, 'String', 0);
set(handles.mn12, 'String', 0);
set(handles.mn21, 'String', 0);
set(handles.mn22, 'String', 0);
set(handles.mn33, 'String', 0);
set(handles.mn61, 'String', 0);
set(handles.mn62, 'String', 0);
set(handles.mn64, 'String', 0);
guidata(handles.figure1, handles);
function Exemplo_Callback(hObject, eventdata, handles)
set(handles.L1, 'String', 0.2);
handles.metricdata.L1 = 0.2;
set(handles.L2, 'String', 0.15);
handles.metricdata.L2 = 0.15;
set(handles.d4, 'String', 0.075);
handles.metricdata.d4 = 0.075;
set(handles.t1, 'String', 0.5236);
handles.metricdata.t1 = 0.5236;
set(handles.t2, 'String', 1.0472);
handles.metricdata.t2 = 1.0472;
set(handles.t4, 'String', 1.0472);
handles.metricdata.t4 = 1.0472;
set(handles.d3, 'String', 0.1);
handles.metricdata.d3 = 0.1;
set(handles.PhiCI, 'String', 0.5236);
handles.metricdata.PhiCI = 0.5236; 
set(handles.ThetaCI, 'String', 0);
handles.metricdata.ThetaCI = 0;
set(handles.PsiCI, 'String', 3.1416);
handles.metricdata.PsiCI = 3.1416;
set(handles.ox, 'String', 0.173);
handles.metricdata.ox = 0.173;
set(handles.oy, 'String', 0.25);
handles.metricdata.oy = 0.25;
set(handles.oz, 'String', -0.175);
handles.metricdata.oz = -0.175;
set(handles.jt1, 'String', 0.5236);
handles.metricdata.jt1 = 0.5236;
set(handles.jt2, 'String', 1.0472);
handles.metricdata.jt2 = 1.0472;
set(handles.jt4, 'String', 1.0472);
handles.metricdata.jt4 = 1.0472;
set(handles.jd3, 'String', 0.1);
handles.metricdata.jd3 = 0.1;
guidata(hObject,handles)


%Par�metros para o Jacobiano
function jt1_Callback(hObject, eventdata, handles)
jt1 = str2double(get(hObject, 'String'));
if isnan(jt1)
    set(hObject, 'String', 0);
    errordlg('O �ngulo precisa ser um n�mero.','Erro');
end
handles.metricdata.jt1 = jt1;
guidata(hObject,handles)
function jt1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function jt2_Callback(hObject, eventdata, handles)
jt2 = str2double(get(hObject, 'String'));
if isnan(jt2)
    set(hObject, 'String', 0);
    errordlg('O �ngulo precisa ser um n�mero.','Erro');
end
handles.metricdata.jt2 = jt2;
guidata(hObject,handles)
function jt2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function jd3_Callback(hObject, eventdata, handles)
jd3 = str2double(get(hObject, 'String'));
if isnan(jd3)
    set(hObject, 'String', 0);
    errordlg('O comprimento precisa ser um n�mero.','Erro');
end
if (jd3<0)
    set(hObject, 'String', 0);
    errordlg('O comprimento precisa ser positivo.','Erro');
end
handles.metricdata.jd3 = jd3;
guidata(hObject,handles)
function jd3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function jt4_Callback(hObject, eventdata, handles)
jt4 = str2double(get(hObject, 'String'));
if isnan(jt4)
    set(hObject, 'String', 0);
    errordlg('O comprimento precisa ser um n�mero.','Erro');
end
handles.metricdata.jt4 = jt4;
guidata(hObject,handles)
function jt4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%C�lculo e reset Jacobiano
function CalcularJacobiano_Callback(hObject, eventdata, handles)
mn11 = -handles.metricdata.L1 * sin(handles.metricdata.jt1) - handles.metricdata.L2 * sin(handles.metricdata.jt1 + handles.metricdata.jt2);
mn12 = -handles.metricdata.L2 * sin(handles.metricdata.jt1 + handles.metricdata.jt2);
mn21 = handles.metricdata.L1 * cos(handles.metricdata.jt1) + handles.metricdata.L2 * cos(handles.metricdata.jt1 + handles.metricdata.jt2);
mn22 = handles.metricdata.L2 * cos(handles.metricdata.jt1 + handles.metricdata.jt2);
mn33 = -1;
mn61 = 1;

set(handles.mn11, 'String', mn11);
set(handles.mn12, 'String', mn12);
set(handles.mn21, 'String', mn21);
set(handles.mn22, 'String', mn22);
set(handles.mn33, 'String', mn33);
set(handles.mn61, 'String', mn61);
set(handles.mn62, 'String', mn61);
set(handles.mn64, 'String', mn33);
function ResetarJacob_Callback(hObject, eventdata, handles)
handles.metricdata.jt1 = 0;
handles.metricdata.jt2 = 0;
handles.metricdata.jd3 = 0;
handles.metricdata.jt4 = 0;

set(handles.jt1, 'String', handles.metricdata.jt1);
set(handles.jt2,  'String', handles.metricdata.jt2);
set(handles.jd3,  'String', handles.metricdata.jd3);
set(handles.jt4,  'String', handles.metricdata.jt4);
set(handles.mn11, 'String', 0);
set(handles.mn12, 'String', 0);
set(handles.mn21, 'String', 0);
set(handles.mn22, 'String', 0);
set(handles.mn33, 'String', 0);
set(handles.mn61, 'String', 0);
set(handles.mn62, 'String', 0);
set(handles.mn64, 'String', 0);
guidata(handles.figure1, handles);


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2
