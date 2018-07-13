clear all
close all
s=serial('COM3', 'BaudRate',115200, 'DataBits',8, 'Parity','none', 'StopBits',1,'FlowControl','none'); % Create a serial port object
s.InputBufferSize = 128*128;
fopen(s);
disp('com open');
try
s.ReadAsyncMode = 'continuous'; % Set reading operation continuous
tmpl = fread(s);
fclose(s);
catch ME % Close the serial connection if there in an exception.
disp('there is an error');
fclose(s);
delete(s);
clear s;
exceptionFlag=0;
end
c=tmpl' ;
b=reshape(c,[128,128]);
d=b' ;
d=uint8(d);
imshow(d); 
