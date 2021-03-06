clear all
close all
s=serial('COM3', 'BaudRate',115200, 'DataBits',8, 'Parity','none', 'StopBits',1,'FlowControl','none'); % Create a serial port object
s.InputBufferSize = 128*128;
fopen(s);
disp('com open');
try
im1=imread('image.png'); % Original Image file
im = rgb2gray(im1);
[mOld,nOld] = size(im);
s.ReadAsyncMode = 'continuous'; % Set reading operation continuous
disp('start sending data');
%fwrite(s, [0], 'uint8');
for y = 1:1:mOld
for x = 1:1:nOld
fwrite(s, im(y,x), 'uint8');
end
end
disp('data successfully sent');
fclose(s);
catch ME % Close the serial connection if there in an exception.
disp('there is an error');
fclose(s);
delete(s);
clear s;
exceptionFlag=0;
end
%imshow(im);
%figure
