clc; 
clear; 
close all; 
%% STEP 1: Generate Original Signal 
fs = 1000;              
t = 0:1/fs:1;           
f = 5;                  
x = sin(2*pi*f*t);      
% Sampling frequency 
% Time vector (1 second) 
% Signal frequency (5 Hz) 
% Original clean signal 
%% STEP 2: Add Noise 
noise = 0.5*randn(size(t));   % Gaussian noise 
x_noisy = x + noise;          
% Noisy signal 
%% STEP 3: Apply Moving Average Filter 
N = 10;                       
b = (1/N)*ones(1,N);          
a = 1; 
% Window size 
% Filter coefficients 
x_filtered = filter(b, a, x_noisy);   % Filtered signal 
%% STEP 4: Plot Time Domain Signals 
figure; 
subplot(3,1,1); 
plot(t, x); 
title('Original Signal'); 
xlabel('Time'); 
ylabel('Amplitude'); 
subplot(3,1,2); 
plot(t, x_noisy); 
title('Noisy Signal'); 
xlabel('Time'); 
ylabel('Amplitude'); 
subplot(3,1,3); 
plot(t, x_filtered); 
title('Filtered Signal (After Noise Removal)'); 
xlabel('Time'); 
ylabel('Amplitude'); 
%% STEP 5: Frequency Domain Analysis (FFT) 
n = length(t); 
f_axis = (0:n-1)*(fs/n); 
X = abs(fft(x)); 
X_noisy = abs(fft(x_noisy)); 
X_filtered = abs(fft(x_filtered)); 
figure; 
subplot(3,1,1); 
plot(f_axis, X); 
title('FFT of Original Signal'); 
xlabel('Frequency'); 
ylabel('Magnitude'); 
subplot(3,1,2); 
plot(f_axis, X_noisy); 
title('FFT of Noisy Signal'); 
xlabel('Frequency'); 
ylabel('Magnitude'); 
subplot(3,1,3); 
plot(f_axis, X_filtered); 
title('FFT of Filtered Signal'); 
xlabel('Frequency'); 
ylabel('Magnitude');