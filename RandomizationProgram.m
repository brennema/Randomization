function varargout = RandomizationProgram(varargin)
% RANDOMIZATIONPROGRAM MATLAB code for RandomizationProgram.fig
%      RANDOMIZATIONPROGRAM, by itself, creates a new RANDOMIZATIONPROGRAM or raises the existing
%      singleton*.
%
% This GUI randomizes a block of 6 participants based on a single
% stratified variable.
%
% Inputs:                   varargin
%
% Outputs:                  varargout
%
% Subfunctions called:      Randomization.m
%
% Authors:                  Anthony Gatti
%                           Elora Brenneman
%
% Last updated:             15 May 2015
%
% ------------------------------------------------------------------
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RandomizationProgram_OpeningFcn, ...
                   'gui_OutputFcn',  @RandomizationProgram_OutputFcn, ...
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
end
% End initialization code - DO NOT EDIT
% ------------------------------------------------------------------

% Executes just before GUI is made visible
function RandomizationProgram_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
end

% Outputs from this function are returned to the command line
function varargout = RandomizationProgram_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
end

% Block number
function edit1_Callback(hObject, eventdata, handles)
warning('off');
blockNum=str2double(get(hObject,'String'));
if isnan(blockNum)
    errordlg('You must enter a numeric value','modal')
    uicontrol(hObject)
    return
else
end
handles.blockNum=blockNum;
guidata(hObject,handles)
end

% Executes during object creation after setting all properties
function edit1_CreateFcn(hObject, eventdata, handles)
warning('off');
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% Executes on button press for randomization
function pushbutton1_Callback(hObject, eventdata, handles)
blockNum=handles.blockNum;
[combined_all]=Randomization(blockNum);
set(handles.uitable1,'Data',combined_all);
end
