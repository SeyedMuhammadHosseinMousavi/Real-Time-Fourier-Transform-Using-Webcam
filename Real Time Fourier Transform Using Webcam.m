%% Real Time Fourier Transform Using Webcam

clc;    % Clearing the Command Window
clear;  % Clearing the Workspace

%% Prepare video input from webcam 
camera = webcam('USB Camera'); 
set(camera, 'Resolution', '640x480'); 

% Figure
set(gcf, 'Position', get(0, 'Screensize'));

NR=1000;% Number of repeats 
for i=1:NR

cameraFrame = snapshot(camera); 
cameraFrameGray = rgb2gray(cameraFrame);

fft2imag=fft2(cameraFrameGray);
fft2imagshift=fftshift(fft2imag);
imgphase=angle(fft2imag);
imgshiftphase=angle(fft2imagshift);

subplot(2,2,1)
imshow(cameraFrame);
subplot(2,2,2)
imshow(log(1+abs(fft2imag)),[]);
subplot(2,2,3)
imshow(log(1+abs(fft2imagshift)),[]);
subplot(2,2,4)
mesh(log(1+abs(fft2imagshift)));
end

%% clean Webcam
delete(camera);
