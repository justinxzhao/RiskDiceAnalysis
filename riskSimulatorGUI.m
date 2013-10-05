% Simulates Risk given certain parameters

function varargout = riskSimulatorGUI(varargin)
% RISKSIMULATORGUI MATLAB code for riskSimulatorGUI.fig
%      RISKSIMULATORGUI, by itself, creates a new RISKSIMULATORGUI or raises the existing
%      singleton*.
%
%      H = RISKSIMULATORGUI returns the handle to a new RISKSIMULATORGUI or the handle to
%      the existing singleton*.
%
%      RISKSIMULATORGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RISKSIMULATORGUI.M with the given input arguments.
%
%      RISKSIMULATORGUI('Property','Value',...) creates a new RISKSIMULATORGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before riskSimulatorGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to riskSimulatorGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help riskSimulatorGUI

% Last Modified by GUIDE v2.5 18-Aug-2012 00:30:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @riskSimulatorGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @riskSimulatorGUI_OutputFcn, ...
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


% --- Executes just before riskSimulatorGUI is made visible.
function riskSimulatorGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to riskSimulatorGUI (see VARARGIN)

% Choose default command line output for riskSimulatorGUI
handles.output = hObject;

handles.attackDiceLim = 3;
handles.defenseDiceLim = 2;
handles.numConsideredLim = 2;
handles.diceMax = 6;
handles.num_trials = 10000;
handles.num_attack = 10;
handles.num_defense = 4;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes riskSimulatorGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = riskSimulatorGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% number considered
function edit16_Callback(hObject, eventdata, handles)
handles.numConsideredLim = str2double(get(hObject, 'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% number of attacking dice
function edit17_Callback(hObject, eventdata, handles)
handles.attackDiceLim = str2double(get(hObject, 'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% number of defense dice
function edit18_Callback(hObject, eventdata, handles)
handles.defenseDiceLim = str2double(get(hObject, 'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% maxDice
function edit19_Callback(hObject, eventdata, handles)
handles.maxDice = str2double(get(hObject, 'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% number of trials
function edit20_Callback(hObject, eventdata, handles)
handles.num_trials = str2double(get(hObject, 'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Calculate Probabilities Button
function pushbutton7_Callback(hObject, eventdata, handles)
disp('Calculating Probabilities');
handles.probabilities = riskSimulationSingleBattleFlex ...
    (handles.num_attack, handles.num_defense, ...
    handles.num_trials, handles.diceMax, ...
    handles.attackDiceLim, handles.defenseDiceLim, ...
    handles.numConsideredLim);

set(handles.uitable4, 'Data', handles.probabilities);

bar(handles.axes7, handles.probabilities);
title(['Probability of retaining troops, ' num2str(handles.num_attack) ' vs. ' num2str(handles.num_defense)]);
xlabel('Number of troops retained');
ylabel('Probability (%)');

explode = ones(1, handles.num_attack);
pie3(handles.axes8, handles.probabilities, explode);

disp('Finished Calculating Probabilities');
disp('Chance of winning battle: ')
winChance = sum(handles.probabilities) - handles.probabilities(1);
disp(winChance);
guidata(hObject,handles);


% --- Plot Graphs button
function pushbutton8_Callback(hObject, eventdata, handles)
figure;
bar(handles.probabilities);
title(['Probability of retaining troops, ' num2str(handles.num_attack) ' vs. ' num2str(handles.num_defense)]);
xlabel('Number of troops retained');
ylabel('Probability (%)');

figure;
explode = ones(1, handles.num_attack);
h = pie3(handles.probabilities, explode);
title(['Probability of retaining troops, ' num2str(handles.num_attack) ' vs. ' num2str(handles.num_defense)]);

labels = num2cell(1:handles.num_attack);

for i = 1 : handles.num_attack
    labels{i} = [num2str(labels{i}) ': '];
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


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function edit21_Callback(hObject, eventdata, handles)


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


% number attacking
function edit22_Callback(hObject, eventdata, handles)
handles.num_attack = str2double(get(hObject, 'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% number defending
function edit23_Callback(hObject, eventdata, handles)
handles.num_defense = str2double(get(hObject, 'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
