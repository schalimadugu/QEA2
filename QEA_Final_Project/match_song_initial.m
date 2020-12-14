function match_song(x, Fs)

% make a frequency domain plot with frequency labels
%
%   x = input signal
%   Fs = sampling frequency in Hz

if(mod(length(x),2) ~=0)
    x = x(1:end-1);
end

x2 = linspace(-Fs/2, Fs/2-Fs/length(x),length(x))
y = 1/length(x)*fftshift(abs(fft(x)))

for index = 1:length(x)
    if x2(index) > -0.001 && x2(index) < 0.001;
        y(index) = 0; 
    end
end

plot(linspace(-Fs/2, Fs/2-Fs/length(x),length(x)), y)

ylabel('Magnitude of FFT');
xlabel('Frequency (Hz)');

for index = 1:length(x)
    if y(index) == max(y);
        frequency = x2(index)
    end    
end

[x80, Fs] = audioread('80bpm_halo.wav');
[x90, Fs] = audioread('90bpm_we_are_never_getting_back_together.wav');
[x100, Fs] = audioread('100bpm_hips_dont_lie.wav');
[x110, Fs] = audioread('110bpm_livin_on_a_prayer.wav');
[x120, Fs] = audioread('120bpm_tik_tok.wav');
[x130, Fs] = audioread('130bpm_since_u_been_gone.wav');
[x140, Fs] = audioread('140bpm_my_first_kiss.wav');
[x150, Fs] = audioread('150bpm_bang_bang.wav');
[x160, Fs] = audioread('160bpm_hey_ya.wav');
[x170, Fs] = audioread('170bpm_i_write_sins_not_tragedies.wav');
[x180, Fs] = audioread('180bpm_im_a_believer.wav');

% if frequency > 1.25 && frequency < 1.42
%     sound(x80, Fs);
% end
% if frequency > 1.43 && frequency < 1.58
%     sound(x90, Fs);
% end
% if frequency > 1.59 && frequency < 1.75
%     sound(x100, Fs);
% end
% if frequency > 1.76 && frequency < 1.92
%     sound(x110, Fs);
% end
% if frequency > 1.93 && frequency < 2.08
%     sound(x120, Fs);
% end
% if frequency > 2.09 && frequency < 2.25
%     sound(x130, Fs);
% end
% if frequency > 2.26 && frequency < 2.42
%     sound(x140, Fs);
% end
% if frequency > 2.43 && frequency < 2.58
%     sound(x150, Fs);
% end
% if frequency > 2.59 && frequency < 2.75
%     sound(x160, Fs);
% end
% if frequency > 2.76 && frequency < 2.92
%     sound(x170, Fs);
% end
% if frequency > 2.93 && frequency < 3.08
%     sound(x180, Fs);
% end
