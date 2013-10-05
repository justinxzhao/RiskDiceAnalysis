% Calculates how much is lost or won given different dice amounts

function varargout = diceGUI(varargin)
% DICEGUI MATLAB code for diceGUI.fig
%      DICEGUI, by itself, creates a new DICEGUI or raises the existing
%      singleton*.
%
%      H = DICEGUI returns the handle to a new DICEGUI or the handle to
%      the existing singleton*.
%
%      DICEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DICEGUI.M with the given input arguments.
%
%      DICEGUI('Property','Value',...) creates a new DICEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before diceGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to diceGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help diceGUI

% Last Modified by GUIDE v2.5 18-Aug-2012 02:46:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @diceGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @diceGUI_OutputFcn, ...
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


% --- Executes just before diceGUI is made visible.
function diceGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to diceGUI (see VARARGIN)

% Choose default command line output for diceGUI
handles.output = hObject;

handles.num_diceA = 3;
handles.num_diceD = 2;
handles.num_considered = 2;
handles.diceMax = 6;
handles.num_trials = 10000;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes diceGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = diceGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% number considered
function edit3_Callback(hObject, eventdata, handles)
handles.num_considered = str2double(get(hObject, 'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% number of attacking dice
function edit1_Callback(hObject, eventdata, handles)
handles.num_diceA = str2double(get(hObject, 'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% number of defending dice
function edit2_Callback(hObject, eventdata, handles)
handles.num_diceD = str2double(get(hObject, 'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% max dice value
function edit4_Callback(hObject, eventdata, handles)
handles.diceMax = str2double(get(hObject, 'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% number of trials
function edit5_Callback(hObject, eventdata, handles)
handles.num_trials = str2double(get(hObject, 'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Calculate Probabilities button
function pushbutton1_Callback(hObject, eventdata, handles)

disp('Running Simulations');

handles.winTrends = diceGUIMainFunction(handles.num_diceA, handles.num_diceD, ...
    handles.diceMax, handles.num_considered, handles.num_trials);

set(handles.uitable1, 'Data', handles.winTrends);
bar(handles.axes1, handles.winTrends);
explode = ones(1, size(handles.winTrends,1));
pie(handles.axes2, handles.winTrends, explode);

disp('Finished Running Simulations');

guidata(hObject,handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
figure;
bar(handles.winTrends);
figure;
explode = ones(1, size(handles.winTrends,1));
h = pie3(handles.winTrends, explode);
title(['Probability of troops lost by the attack, ' num2str(handles.num_diceA) ' vs. ' num2str(handles.num_diceD)]);

labels = num2cell(1:size(handles.winTrends,1));

for i = 1 : (handles.num_diceA-1)
    labels{i} = [num2str(labels{i}-1) ': '];
end

textObjs = findobj(h,'Type','text');
oldStr = get(textObjs,{'String'});
val = get(textObjs,{'Extent'});
oldExt = cat(1,val{:});
% Create the new strings, and set the text objects' String properties to the new strings:

Names = labels';
newStr = strcat(Names,oldStr);
set(textObjs,{'String'},newStr)
% Find the difference between the widths of the new and old text strings and change the values of the Position properties:

val1 = get(textObjs, {'Extent'});
newExt = cat(1, val1{:});
offset = sign(oldExt(:,1)).*(newExt(:,3)-oldExt(:,3))/2;
pos = get(textObjs, {'Position'});
textPos =  cat(1, pos{:});
textPos(:,1) = textPos(:,1)+offset;
set(textObjs,{'Position'},num2cell(textPos,[3,2]))


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
load('Data.mat', handlesArray);
save('Data.mat', handles, '-append');
