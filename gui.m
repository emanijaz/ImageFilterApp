function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 07-Oct-2017 11:24:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)

set(handles.imgname, 'visible', 'off');


handles.output = hObject;
guidata(hObject, handles);
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
I = imread('C:\Users\emani\Desktop\deer.png');
imshow(I);

function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
[FileName,FilePath]=uigetfile();
ExPath = [FilePath FileName];


                set(handles.imgname, 'visible', 'on');
                textLabel ="Original image";
                set(handles.imgname, 'String', textLabel);
imshow(ExPath, 'Parent',handles.axes1);
handles.path = ExPath;
guidata(hObject, handles);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)

guidata(hObject, handles);
nonlinear = 0;
str = get(hObject, 'String');
val = get(hObject,'Value');

             switch str{val}
                 case 'MEAN FILTER'
img = imread(handles.path);
                             %%%% red %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
red = img(:,:,1); % Red channel           
    
output_red = (size(red));              %contains output%
s = size(red);
s= s+2;
tmp  =zeros(s);
tmp(2:end-1 , 2:end-1) = red;
red = tmp;          % I padded with zeros along all sides%


for i=1: size(red,1)-2
    
    for j=1: size(red,2)-2
        Array  =zeros(1,9);
        index=1;
        for x=1:3
            
            for y=1:3
                
                Array(index) = red(i+x-1,j+y-1);
                index =index+1;
                
            end
        end

       sum=0;
       for k=1: 9
           sum = sum + Array(k);
       end
       sum =round(sum/9);
       
       output_red(i,j) = sum;
        
    end
end

output_red=uint8(output_red);
%%%%%%%%%%%%%% green%%%%%%%%%%%%%%%%%%

green = img(:,:,2); % Green channel           
    
output_green = (size(green ));              %contains output%
s = size(green );
s= s+2;
tmp  =zeros(s);
tmp(2:end-1 , 2:end-1) = green ;
green  = tmp;          % I padded with zeros along all sides%


for i=1: size(green ,1)-2
    
    for j=1: size(green,2)-2
        Array  =zeros(1,9);
        index=1;
        for x=1:3
            
            for y=1:3
                
                Array(index) = green (i+x-1,j+y-1);
                index =index+1;
                
            end
        end

       sum=0;
       for k=1: 9
           sum = sum + Array(k);
       end
       sum =round(sum/9);
       
       output_green(i,j) = sum;
        
    end
end

output_green=uint8(output_green);


%%%%%%%%%%%%%% blue%%%%%%%%%%%%%%%5

blue= img(:,:,3); % Blue channel           
    
output_blue = (size(blue));              %contains output%
s = size(blue);
s= s+2;
tmp  =zeros(s);
tmp(2:end-1 , 2:end-1) = blue;
blue  = tmp;          % I padded with zeros along all sides%


for i=1: size(blue ,1)-2
    
    for j=1: size(blue,2)-2
        Array  =zeros(1,9);
        index=1;
        for x=1:3
            
            for y=1:3
                
                Array(index) = blue(i+x-1,j+y-1);
                index =index+1;
                
            end
        end

       sum=0;
       for k=1: 9
           sum = sum + Array(k);
       end
       sum =round(sum/9);
       
       output_blue(i,j) = sum;
        
    end
end

output_blue=uint8(output_blue);

back_original_image = cat(3, output_red, output_green, output_blue);

imwrite(back_original_image,'output.jpg');       
imshow('C:\Users\emani\Documents\MATLAB\output.jpg', 'Parent',handles.axes1);

       
                set(handles.imgname, 'visible', 'on');
                textLabel ="Mean Filtered image";
                set(handles.imgname, 'String', textLabel);
                nonlinear = 1;

                 case 'MEDIAN FILTER'
img = imread(handles.path);
%%%% red %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
red = img(:,:,1); % Red channel 

output_red = (size(red));              %contains output%
s = size(red);
s= s+2;
tmp  =zeros(s);
tmp(2:end-1 , 2:end-1) = red;
red = tmp;          % I padded with zeros along all sides%


for i=1: size(red,1)-2
    
    for j=1: size(red,2)-2
        Array  =zeros(1,9);
        index=1;
        for x=1:3
            
            for y=1:3
                
                Array(index) = red(i+x-1,j+y-1);
                index =index+1;
                
            end
        end
        
        
        
        swap = 1;  %sorting Array %
        while swap == 1
            swap = 0;
            for k=1 : size(Array,2)-1
                   if Array(k) > Array(k+1)
                
                        tmp1 = Array(k);
                        Array(k) = Array(k+1);
                        Array(k+1)=tmp1;
                        swap =1;
                   end
        
            end
        end  %swapping done%
        output_red(i,j) = Array(5);
        
    end
end

output_red=uint8(output_red);

 %%%%%%%%%%%% green %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
green= img(:,:,2); % Green channel 

output_green = (size(green));              %contains output%
s = size(green);
s= s+2;
tmp  =zeros(s);
tmp(2:end-1 , 2:end-1) = green;
green = tmp;          % I padded with zeros along all sides%


for i=1: size(green,1)-2
    
    for j=1: size(green,2)-2
        Array  =zeros(1,9);
        index=1;
        for x=1:3
            
            for y=1:3
                
                Array(index) = green(i+x-1,j+y-1);
                index =index+1;
                
            end
        end
        
        
        
        swap = 1;  %sorting Array %
        while swap == 1
            swap = 0;
            for k=1 : size(Array,2)-1
                   if Array(k) > Array(k+1)
                
                        tmp1 = Array(k);
                        Array(k) = Array(k+1);
                        Array(k+1)=tmp1;
                        swap =1;
                   end
        
            end
        end  %swapping done%
        output_green(i,j) = Array(5);
        
    end
end

output_green=uint8(output_green);


%%%%%%%%%%%%%%%%%%%%% blue%%%%%%%%%%%%%%%%%%%%%

blue= img(:,:,3); % Green channel 

output_blue = (size(blue));              %contains output%
s = size(blue);
s= s+2;
tmp  =zeros(s);
tmp(2:end-1 , 2:end-1) = blue;
blue = tmp;          % I padded with zeros along all sides%


for i=1: size(blue,1)-2
    
    for j=1: size(blue,2)-2
        Array  =zeros(1,9);
        index=1;
        for x=1:3
            
            for y=1:3
                
                Array(index) = blue(i+x-1,j+y-1);
                index =index+1;
                
            end
        end
        
        
        
        swap = 1;  %sorting Array %
        while swap == 1
            swap = 0;
            for k=1 : size(Array,2)-1
                   if Array(k) > Array(k+1)
                
                        tmp1 = Array(k);
                        Array(k) = Array(k+1);
                        Array(k+1)=tmp1;
                        swap =1;
                   end
        
            end
        end  %swapping done%
        output_blue(i,j) = Array(5);
        
    end
end

output_blue=uint8(output_blue);

back_original_image = cat(3, output_red, output_green, output_blue); 


imwrite(back_original_image,'output.jpg');       
imshow('C:\Users\emani\Documents\MATLAB\output.jpg', 'Parent',handles.axes1);
           
                set(handles.imgname, 'visible', 'on');
                textLabel ="Median Filtered image";
                set(handles.imgname, 'String', textLabel);
                nonlinear = 1;

                 case 'SHARPENING FILTER'  % sharpening convolution  3x3
                      mask = [0,-1,0;-1,5,-1;0,-1,0];  % sharpening
                      set(handles.imgname, 'visible', 'on');
                      textLabel ="Sharpened Filtered image";
                      
                      
                 case 'BLUR FILTER 3X3'  % blur convolution
                       mask=[1/9,1/9,1/9;1/9,1/9,1/9;1/9,1/9,1/9]; %3x3
                      
                       set(handles.imgname, 'visible', 'on');
                        textLabel ="Blur Filtered image";
                 
                 case 'BLUR FILTER 5X5'
                      mask =[1/25,1/25,1/25,1/25,1/25;1/25,1/25,1/25,1/25,1/25;1/25,1/25,1/25,1/25,1/25;1/25,1/25,1/25,1/25,1/25;1/25,1/25,1/25,1/25,1/25];% 5x5
                      set(handles.imgname, 'visible', 'on');
                      textLabel ="Blur Filtered image 5x5 kernel";
                 
                 case 'EDGE DETECTION FILTER 3X3'
                      mask = [-1,-1,-1; -1,8,-1; -1,-1,-1];
                      set(handles.imgname, 'visible', 'on');
                      textLabel ="Edge Filtered image 3X3";
                 
                  case 'EDGE DETECTION FILTER 5X5'
                      mask=[1,2,0,-2,-1;4,8,0,-8,-4;6,12,0,-12,-6;4,8,0,-8,-4;1,2,0,-2,-1];
                      set(handles.imgname, 'visible', 'on');
                      textLabel ="Edge Filtered image 5X5";
                      
                      
                 case 'EMBOSS FILTER 3X3'
                      mask =  [-2,-1,0;-1,1,1;0,1,2];
                      set(handles.imgname, 'visible', 'on');
                      textLabel ="Emboss Filtered image 3X3";
                 
                 case 'EMBOSS FILTER 5X5'
                      mask =[-1,-1,-1,-1,0;-1,-1,-1,0,1;-1,-1,0,1,1;-1,0,1,1,1;0,1,1,1,1];
                      set(handles.imgname, 'visible', 'on');
                      textLabel ="Emboss Filtered image 5X5";
                      
                 case 'SMOOTHING FILTER 3X3'
                     mask = [1/16,2/16,1/16; 2/16,4/16,2/16;1/16,2/16,1/16];
                     set(handles.imgname, 'visible', 'on');
                     textLabel ="SMOOTH Filtered image 3X3";
                   
                  case 'SMOOTHING FILTER 5X5'
                     mask = [1/273,4/273,7/273,4/273,1/273;4/273,16/273,26/273,16/273,4/273;7/273,26/273,41/273,26/273,7/273;4/273,16/273,26/273,16/273,4/273;1/273,4/273,7/273,4/273,1/273];
                     set(handles.imgname, 'visible', 'on');
                     textLabel ="SMOOTH Filtered image 5X5";
                     
                 case 'CUSTOM FILTER'

                         
                         prompt = {'Enter element 1','Enter element 2','Enter element 3','Enter element 4','Enter element 5','Enter element 6','Enter element 7','Enter element 8','Enter element 9'};
                         title = 'INPUT MASK';
                         num_lines = [1,10; 1,10; 1,10; 1,10;1,10; 1,10; 1,10;1,10; 1,10];
                         rc = inputdlg(prompt,title,num_lines) ;
                         mask = [str2num(rc{1}),str2num(rc{2}),str2num(rc{3});str2num(rc{4}),str2num(rc{5}),str2num(rc{6});str2num(rc{7}),str2num(rc{8}),str2num(rc{9})];
                         
        
                      set(handles.imgname, 'visible', 'on');
                      textLabel ="Custom Filtered image";

              end       
  %%
if nonlinear == 0     
img = imread(handles.path);
    %%%% red %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
red = img(:,:,1); % Red channel 

output_red = size(red);


          % flipping rows &
i = 1;
j = size(mask,1);
while i ~= j && i < j
    
        mask([i,j],:) = mask([j,i],:);
        
    i = i+1;
    j=j-1;
end

              % flipping columns%
i = 1;
j = size(mask,2);
while i ~= j && i < j
    
        mask(:,[i,j]) = mask(:,[j,i]);
        
    i = i+1;
    j=j-1;
end
         % padding %
[r,c] = size(mask);
if r == 2 && c == 2
    s = size(red);
    s= s+2;
    tmp  =zeros(s);
    tmp(2:end-1 , 2:end-1) = red;
    red = tmp;          % padded with zeros along all sides%
    red(:,[1,2]) = red(:,[2,2]);  % left side coloumns replication
    red(:,[size(red,2),size(red,2)-1]) = red(:,[size(red,2)-1,size(red,2)-1]); % right coloumns replication
    
    red([1,2],:) = red([2,2],:);  %upper row replication
    red([size(red,1),size(red,1)-1],:) = red([size(red,1)-1,size(red,1)-1],:);%lower row replication
    
    for i=1: size(red,1)-2
    
         for j=1: size(red,2)-2
             
             sum=0;
             for x=1:2
                    for y=1:2
                        sum = sum + ( red(i+x-1,j+y-1) * mask(x,y));
                    end
             end
             output_red(i,j)= sum; 
        
         end
    end
end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        3X3 matrix
if r == 3 && c == 3
   
    s = size(red);
    s= s+2;
    tmp  =zeros(s);
    tmp(2:end-1 , 2:end-1) = red;
    red = tmp;          % padded with zeros along all sides%
    red(:,[1,2]) = red(:,[2,2]);  % left side coloumns replication
    red(:,[size(red,2),size(red,2)-1]) = red(:,[size(red,2)-1,size(red,2)-1]); % right coloumns replication
    
    red([1,2],:) = red([2,2],:);  %upper row replication
    red([size(red,1),size(red,1)-1],:) = red([size(red,1)-1,size(red,1)-1],:);%lower row replication
    for i=1: size(red,1)-2
    
         for j=1: size(red,2)-2
             
             sum=0;
             for x=1:3
                    for y=1:3
                        sum = sum + ( red(i+x-1,j+y-1) * mask(x,y));
                    end
             end

             output_red(i,j)= sum; 
        
         end
    end

    
end

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        5X5 matrix
if r == 5 && c == 5
    
    output_red = (size(red));              %contains output%
    s = size(red);
    s= s+4;
    tmp  =zeros(s);
    tmp(3:end-2 , 3:end-2) = red;
    red = tmp;          % padded with zeros along all sides%
    red(:,[1,3]) = red(:,[3,3]);  % left side coloumns replication
    red(:,[2,3]) = red(:,[3,3]);  % left side coloumns replication
    red(:,[size(red,2),size(red,2)-2]) = red(:,[size(red,2)-2,size(red,2)-2]);  % right coloumns replication
    red(:,[size(red,2)-1,size(red,2)-2]) = red(:,[size(red,2)-2,size(red,2)-2]);  % right coloumns replication
    
    
    red([1,3],:) = red([3,3],:);
    red([2,3],:) = red([3,3],:);
    red([size(red,1),size(red,1)-2],:) = red([size(red,1)-2,size(red,1)-2],:);
    red([size(red,1)-1,size(red,1)-2],:) = red([size(red,1)-2,size(red,1)-2],:);
    
    for i=1: size(red,1)-4
    
         for j=1: size(red,2)-4
             
              sum=0;
             for x=1:5
            
                    for y=1:5
                        sum = sum + ( red(i+x-1,j+y-1) * mask(x,y));
                    end
             end
             output_red(i,j)= sum; 
         end
    end
end


 output_red=uint8(output_red);

 %%%%%%%%%%%%%%%%%%%%%%%%%%green%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                  
green = img(:,:,2); % Green channel

output_green = size(green);


         % padding %
[r,c] = size(mask);
if r == 2 && c == 2
    s = size(green);
    s= s+2;
    tmp  =zeros(s);
    tmp(2:end-1 , 2:end-1) = green;
    green = tmp;          % padded with zeros along all sides%
    green(:,[1,2]) = green(:,[2,2]);  % left side coloumns replication
    green(:,[size(green,2),size(green,2)-1]) = green(:,[size(green,2)-1,size(green,2)-1]); % right coloumns replication
    
    green([1,2],:) = green([2,2],:);  %upper row replication
    green([size(green,1),size(green,1)-1],:) = green([size(green,1)-1,size(green,1)-1],:);%lower row replication
    
    for i=1: size(green,1)-2
    
         for j=1: size(green,2)-2
             
             sum=0;
             for x=1:2
                    for y=1:2
                        sum = sum + ( green(i+x-1,j+y-1) * mask(x,y));
                    end
             end
             output_green(i,j)= sum; 
        
         end
    end
end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        3X3 matrix
if r == 3 && c == 3
   
    s = size(green);
    s= s+2;
    tmp  =zeros(s);
    tmp(2:end-1 , 2:end-1) = green;
    green = tmp;          % padded with zeros along all sides%
    green(:,[1,2]) = green(:,[2,2]);  % left side coloumns replication
    green(:,[size(green,2),size(green,2)-1]) = green(:,[size(green,2)-1,size(green,2)-1]); % right coloumns replication
    
    green([1,2],:) = green([2,2],:);  %upper row replication
    green([size(green,1),size(green,1)-1],:) = green([size(green,1)-1,size(green,1)-1],:);%lower row replication
    for i=1: size(green,1)-2
    
         for j=1: size(green,2)-2
             
             sum=0;
             for x=1:3
                    for y=1:3
                        sum = sum + ( green(i+x-1,j+y-1) * mask(x,y));
                    end
             end

             output_green(i,j)= sum; 
        
         end
    end

    
end

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        5X5 matrix
if r == 5 && c == 5
    
    output_green = (size(green));              %contains output%
    s = size(green);
    s= s+4;
    tmp  =zeros(s);
    tmp(3:end-2 , 3:end-2) = green;
    green = tmp;          % padded with zeros along all sides%
    green(:,[1,3]) = green(:,[3,3]);  % left side coloumns replication
    green(:,[2,3]) = green(:,[3,3]);  % left side coloumns replication
    green(:,[size(green,2),size(green,2)-2]) = green(:,[size(green,2)-2,size(green,2)-2]);  % right coloumns replication
    green(:,[size(green,2)-1,size(green,2)-2]) = green(:,[size(green,2)-2,size(green,2)-2]);  % right coloumns replication
    
    
    green([1,3],:) = green([3,3],:);
    green([2,3],:) = green([3,3],:);
    green([size(green,1),size(green,1)-2],:) = green([size(green,1)-2,size(green,1)-2],:);
    green([size(green,1)-1,size(green,1)-2],:) = green([size(green,1)-2,size(green,1)-2],:);
    
    for i=1: size(green,1)-4
    
         for j=1: size(green,2)-4
             
              sum=0;
             for x=1:5
            
                    for y=1:5
                        sum = sum + ( green(i+x-1,j+y-1) * mask(x,y));
                    end
             end
             output_green(i,j)= sum; 
         end
    end
end


 output_green=uint8(output_green);
 
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%blue%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                   
blue = img(:,:,3); % Blue channel 

output_blue = size(blue);

         % padding %
[r,c] = size(mask);
if r == 2 && c == 2
    s = size(blue);
    s= s+2;
    tmp  =zeros(s);
    tmp(2:end-1 , 2:end-1) = blue;
    blue = tmp;          % padded with zeros along all sides%
    blue(:,[1,2]) = blue(:,[2,2]);  % left side coloumns replication
    blue(:,[size(blue,2),size(blue,2)-1]) = blue(:,[size(blue,2)-1,size(blue,2)-1]); % right coloumns replication
    
    blue([1,2],:) = blue([2,2],:);  %upper row replication
    blue([size(blue,1),size(blue,1)-1],:) = blue([size(blue,1)-1,size(blue,1)-1],:);%lower row replication
    
    for i=1: size(blue,1)-2
    
         for j=1: size(blue,2)-2
             
             sum=0;
             for x=1:2
                    for y=1:2
                        sum = sum + ( blue(i+x-1,j+y-1) * mask(x,y));
                    end
             end
             output_blue(i,j)= sum; 
        
         end
    end
end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        3X3 matrix
if r == 3 && c == 3
   
    s = size(blue);
    s= s+2;
    tmp  =zeros(s);
    tmp(2:end-1 , 2:end-1) = blue;
    blue = tmp;          % padded with zeros along all sides%
    blue(:,[1,2]) = blue(:,[2,2]);  % left side coloumns replication
    blue(:,[size(blue,2),size(blue,2)-1]) = blue(:,[size(blue,2)-1,size(blue,2)-1]); % right coloumns replication
    
    blue([1,2],:) = blue([2,2],:);  %upper row replication
    blue([size(blue,1),size(blue,1)-1],:) = blue([size(blue,1)-1,size(blue,1)-1],:);%lower row replication
    for i=1: size(blue,1)-2
    
         for j=1: size(blue,2)-2
             
             sum=0;
             for x=1:3
                    for y=1:3
                        sum = sum + ( blue(i+x-1,j+y-1) * mask(x,y));
                    end
             end

             output_blue(i,j)= sum; 
        
         end
    end

    
end

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        5X5 matrix
if r == 5 && c == 5
    
    output_blue = (size(blue));              %contains output%
    s = size(blue);
    s= s+4;
    tmp  =zeros(s);
    tmp(3:end-2 , 3:end-2) = blue;
    blue = tmp;          % padded with zeros along all sides%
    blue(:,[1,3]) = blue(:,[3,3]);  % left side coloumns replication
    blue(:,[2,3]) = blue(:,[3,3]);  % left side coloumns replication
    blue(:,[size(blue,2),size(blue,2)-2]) = blue(:,[size(blue,2)-2,size(blue,2)-2]);  % right coloumns replication
    blue(:,[size(blue,2)-1,size(blue,2)-2]) = blue(:,[size(blue,2)-2,size(blue,2)-2]);  % right coloumns replication
    
    
    blue([1,3],:) = blue([3,3],:);
    blue([2,3],:) = blue([3,3],:);
    blue([size(blue,1),size(blue,1)-2],:) = blue([size(blue,1)-2,size(blue,1)-2],:);
    blue([size(blue,1)-1,size(blue,1)-2],:) = blue([size(blue,1)-2,size(blue,1)-2],:);
    
    for i=1: size(blue,1)-4
    
         for j=1: size(blue,2)-4
             
              sum=0;
             for x=1:5
            
                    for y=1:5
                        sum = sum + ( blue(i+x-1,j+y-1) * mask(x,y));
                    end
             end
             output_blue(i,j)= sum; 
         end
    end
end


 output_blue=uint8(output_blue);
 
 back_original_image = cat(3, output_red, output_green, output_blue);

imwrite(back_original_image,'output.jpg');       
imshow('C:\Users\emani\Documents\MATLAB\output.jpg', 'Parent',handles.axes1);

 set(handles.imgname, 'String', textLabel);
end
      
       guidata(hObject, handles);


% --- Executes when selected cell(s) is changed in uitable1.
% function uitable1_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
