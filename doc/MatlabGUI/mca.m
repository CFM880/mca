function varargout = mca(varargin)

% Edit the above text to modify the response to help mca

% Last Modified by GUIDE v2.5 15-Jan-2016 13:53:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mca_OpeningFcn, ...
                   'gui_OutputFcn',  @mca_OutputFcn, ...
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


% --- Executes just before mca is made visible.
function mca_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;


guidata(hObject, handles);

function varargout = mca_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


%% �������ݰ�ť�ص�����
function pushbutton1_Callback(hObject, eventdata, handles)
%% ��ȡ�ļ�·��
% ���ļ�ѡ��Ի���
[filename, pathname]=... 
uigetfile({'*.mca;*.pu','�����������ļ�'; },'��ȡ�ļ�');
% �õ��ļ�·���ַ���str
str=[pathname filename];
% ����ȫ�ֱ���filePath
global filePath;
filePath=str;
%% �õ��ļ���׺�������ݲ�ͬ�ĺ�׺���Զ����ƺ��ı��ļ����в�ͬ�Ĳ���
% �ļ���׺��Ϊc
[~,~,c]=fileparts(filePath);
% �������.pu��β��
if strcmp(c,'.pu')
    a=textread(filePath);
    y=a(1:2048,1);
    n=length(y);
    x=1:n;
    axes(handles.axes1);
    plot(x,y,'.');
    title('�ı�ԭ����');
end
% �������.mca��β��
if strcmp(c,'.mca')
    fid=fopen(filePath,'rb');
    fseek(fid,230,'cof');
    y=fread(fid,1024,'ulong');
    n=length(y);
    x=1:n;
    axes(handles.axes1);
    plot(x,y,'.');
    title('������ԭ����');
end
    


%% �������ݹ��Ϊ�رգ�Zoom�򿪣�datacursormode��Zoom����ͬʱʹ��
function pushbutton2_Callback(hObject, eventdata, handles)
% ��axes1�������ݹ��Ϊ�رգ�Zoom��
axes(handles.axes1);
% ���ݹ��Ϊ�ر�
datacursormode off;
% Zoom��
zoom on;

%% �������ݹ��Ϊ�򿪣�Zoom�رգ�datacursormode��Zoom����ͬʱʹ��
function pushbutton3_Callback(hObject, eventdata, handles)
% ��axes1����Zoom�رգ����ݹ��Ϊ�򿪣�
axes(handles.axes1)
zoom off;
datacursormode on;


%% ���⻬ 
function pushbutton4_Callback(hObject, eventdata, handles)
%% �õ��ļ���׺�������ݲ�ͬ�ĺ�׺���Զ����ƺ��ı��ļ����в�ͬ�Ĳ���
global filePath;
[~,filename,c]=fileparts(filePath);
setappdata(hObject,'file_path',filePath);
% �������.pu��β��
if strcmp(c,'.pu')
    a=textread(filePath);
    y=a(1:2048,1);
end
% �������.mca��β��
if strcmp(c,'.mca')
    fid=fopen(filePath,'rb');
    fseek(fid,230,'cof');
    y=fread(fid,1024,'ulong');
end
n=length(y);
x=1:n;
for i=3:(n-2)
    b(i)=(y(i-2)+4*y(i-1)+6*y(i)+4*y(i+1)+y(i+2))/16;
end
b(1)=y(1);
b(2)=y(2);
b(n-1)=y(n-1);
b(n)=y(n);
axes(handles.axes1)
plot(x,b,'.');
title('���⻬����')
