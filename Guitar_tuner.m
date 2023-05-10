%Guitar tuner
%Designer: Ireneusz Wojtarowicz
%% Guidline to this tuner:
%   1.Run the code.
%   2.In this version of guitar tuner you will be asked to 
%     give the name of the string* (the one that you want to tune)
%     with .wav extension (e.g. G3.wav).
%   3.Then you'll have 1.5s to play a guitar string (the programm 
%     will record the sound of your string; make sure your mic is on).
%   4.Feedback will appear in command window.
%
%   Remember that there can't be any noise in your "tuning area" because
%   results will be wrong/missleading!
%
%   *String names from 1st to 6th: E4, B3, G3, D3, A2, E2
%% Code
clear all;
clc;
string_name = input('Enter file name with extension (e.g. G3.wav): ', 's');     %user's input

recObj = audiorecorder(48000, 16, 2)    %creating object used to record 
disp('Strike your string.')             
recordblocking(recObj, 1.5);            %pause recording after 1.5s
disp('End of Recording.');
% play(recObj);                         %play recording
sound = getaudiodata(recObj);
% plot(sound);                          %recording plot
audiowrite(string_name, sound, 48000)   %saving recording

[y,fs]=audioread(string_name);          %reading audio file

t=linspace(0,length(y)/fs,length(y));   %defining time vector
Nfft=fs;                    %setting number of data points needed in FFT
f=linspace(0,fs,Nfft);      %frequency
G=abs(fft(y,Nfft));         %abs from Fast Fourier Transform
A=f(1:Nfft/2);              %setting new range
B=G(1:Nfft/2);              %setting new range


figure(1)
subplot(2,1,1); plot(t,y,'k'); xlabel('Time [s]'); ylabel('Amplitude');title('Sound wave'); axis tight
subplot(2,1,2); plot(A,B);xlabel('Frequency [Hz]');ylabel('Amplitude');title('FFT plot'); axis tight

[row, col] = find(ismember(B, max(B(:))));      %finding the position of the biggest amplitude in the matrix B
freq_value=A(row,col);     %Defining variable C that is equal to proper frequency



%switch with instructions for different strings
switch string_name
    case 'E4.wav'
        if (freq_value>=329.33 && freq_value<=329.93)
            fprintf('Frequency of E4 string is ok (%f Hz)', freq_value);
        elseif (freq_value<329.33)
            fprintf('Frequency is too low (%f Hz), turn it up', freq_value);
        elseif (freq_value>329.93)
            fprintf('Frequency is too high (%f Hz), turn it down', freq_value);
        end
    case 'B3.wav'
        if (freq_value>=246.64 && freq_value<=247.24)
            fprintf('Frequency of B3 string is ok (%f Hz)', freq_value);
        elseif (freq_value<246.64)
            fprintf('Frequency is too low (%f Hz), turn it up', freq_value);
        elseif (freq_value>247.24)
            fprintf('Frequency is too high (%f Hz), turn it down', freq_value);
        end
    case 'G3.wav'
        if (freq_value>=195.7 && freq_value<=196.3)
            fprintf('Frequency of G3 string is ok (%f Hz)', freq_value);
        elseif (freq_value<195.7)
            fprintf('Frequency is too low (%f Hz), turn it up', freq_value);
        elseif (freq_value>196.3)
            fprintf('Frequency is too high (%f Hz), turn it down', freq_value);
        end
    case 'D3.wav'
        if (freq_value>=146.53 && freq_value<=147.13)
            fprintf('Frequency of D3 string is ok (%f Hz)', freq_value);
        elseif (freq_value<146.53)
            fprintf('Frequency is too low (%f Hz), turn it up', freq_value);
        elseif (freq_value>147.13)
            fprintf('Frequency is too high (%f Hz), turn it down', freq_value);
        end
    case 'A2.wav'
        if (freq_value>=109.7 && freq_value<=110.3)
            fprintf('Frequency of A2 string is ok (%f Hz)', freq_value);
        elseif (freq_value<109.7)
            fprintf('Frequency is too low (%f Hz), turn it up', freq_value);
        elseif (freq_value>110.3)
            fprintf('Frequency is too high (%f Hz), turn it down', freq_value);
        end
    case 'E2.wav'
        if (freq_value>=82.11 && freq_value<=82.71)
            fprintf('Frequency of E2 string is ok (%f Hz)', freq_value);
        elseif (freq_value<82.11)
            fprintf('Frequency is too low (%f Hz), turn it up', freq_value);
        elseif (freq_value>82.71)
            fprintf('Frequency is too high (%f Hz), turn it down', freq_value);
        end
    otherwise
        disp('Something did not work');
end