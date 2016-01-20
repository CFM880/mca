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


%% 导入数据按钮回调函数
function pushbutton1_Callback(hObject, eventdata, handles)
%% 获取文件路径
% 打开文件选择对话框
[filename, pathname]=... 
uigetfile({'*.mca;*.pu','所有谱数据文件'; },'读取文件');
% 得到文件路径字符串str
str=[pathname filename];
% 定义全局变量filePath
global filePath;
filePath=str;
%% 得到文件后缀名，依据不同的后缀名对二进制和文本文件进行不同的操作
% 文件后缀名为c
[~,~,c]=fileparts(filePath);
% 如果是以.pu结尾的
if strcmp(c,'.pu')
    a=textread(filePath);
    y=a(1:2048,1);
    n=length(y);
    x=1:n;
    axes(handles.axes1);
    plot(x,y,'.');
    title('文本原谱线');
end
% 如果是以.mca结尾的
if strcmp(c,'.mca')
    fid=fopen(filePath,'rb');
    fseek(fid,230,'cof');
    y=fread(fid,1024,'ulong');
    n=length(y);
    x=1:n;
    axes(handles.axes1);
    plot(x,y,'.');
    title('二进制原谱线');
end
    


%% 设置数据光标为关闭，Zoom打开，datacursormode和Zoom不能同时使用
function pushbutton2_Callback(hObject, eventdata, handles)
% 对axes1操作数据光标为关闭，Zoom打开
axes(handles.axes1);
% 数据光标为关闭
datacursormode off;
% Zoom打开
zoom on;

%% 设置数据光标为打开，Zoom关闭，datacursormode和Zoom不能同时使用
function pushbutton3_Callback(hObject, eventdata, handles)
% 对axes1操作Zoom关闭，数据光标为打开，
axes(handles.axes1)
zoom off;
datacursormode on;


%% 五点光滑 
function pushbutton4_Callback(hObject, eventdata, handles)
%% 得到文件后缀名，依据不同的后缀名对二进制和文本文件进行不同的操作
global filePath;
[~,filename,c]=fileparts(filePath);
setappdata(hObject,'file_path',filePath);
% 如果是以.pu结尾的
if strcmp(c,'.pu')
    a=textread(filePath);
    y=a(1:2048,1);
end
% 如果是以.mca结尾的
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
title('五点光滑谱线')
