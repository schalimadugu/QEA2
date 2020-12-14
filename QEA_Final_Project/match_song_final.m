function match_song_final(x1, y1, z1, Fs)

% make a frequency domain plot with frequency labels
%
%   x = input signal
%   Fs = sampling frequency in Hz


% X AXIS

if(mod(length(x1),2) ~=0)
    x1 = x1(1:end-1);
end

x2_x = linspace(-Fs/2, Fs/2-Fs/length(x1),length(x1));
y_x = 1/length(x1)*fftshift(abs(fft(x1)));

for index_x = 1:length(x1);
    if x2_x(index_x) > -0.001 && x2_x(index_x) < 0.001;
        y_x(index_x) = 0; 
    end
end

plot(linspace(-Fs/2, Fs/2-Fs/length(x1),length(x1)), y_x)

ylabel('Magnitude of FFT');
xlabel('Frequency (Hz)');

for index_x = 1:length(x1);
    if y_x(index_x) == max(y_x);
        frequency_x = x2_x(index_x);
    end    
end


% Y AXIS

if(mod(length(y1),2) ~=0)
    y1 = y1(1:end-1);
end

x2_y = linspace(-Fs/2, Fs/2-Fs/length(y1),length(y1));
y_y = 1/length(y1)*fftshift(abs(fft(y1)));

for index_y = 1:length(y1)
    if x2_y(index_y) > -0.001 && x2_y(index_y) < 0.001;
        y_y(index_y) = 0; 
    end
end

plot(linspace(-Fs/2, Fs/2-Fs/length(y1),length(y1)), y_y)

ylabel('Magnitude of FFT');
xlabel('Frequency (Hz)');

for index_y = 1:length(y1);
    if y_y(index_y) == max(y_y);
        frequency_y = x2_y(index_y);
    end    
end


% Z AXIS

if(mod(length(z1),2) ~=0)
    z1 = z1(1:end-1);
end

x2_z = linspace(-Fs/2, Fs/2-Fs/length(z1),length(z1));
y_z = 1/length(z1)*fftshift(abs(fft(z1)));

for index_z = 1:length(z1);
    if x2_z(index_z) > -0.001 && x2_z(index_z) < 0.001;
        y_z(index_z) = 0; 
    end
end

plot(linspace(-Fs/2, Fs/2-Fs/length(z1),length(z1)), y_z)

ylabel('Magnitude of FFT');
xlabel('Frequency (Hz)');

for index_z = 1:length(z1);
    if y_z(index_z) == max(y_z);
        frequency_z = x2_z(index_z);
    end    
end


if frequency_x > frequency_y && frequency_z
    frequency = frequency_x
end

if frequency_y > frequency_x && frequency_z
    frequency = frequency_y
end

if frequency_z > frequency_x && frequency_y
    frequency = frequency_z
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

if frequency > 1.25 && frequency < 1.42
    sound(x80, Fs);
end
if frequency > 1.43 && frequency < 1.58
    sound(x90, Fs);
end
if frequency > 1.59 && frequency < 1.75
    sound(x100, Fs);
end
if frequency > 1.76 && frequency < 1.92
    sound(x110, Fs);
end
if frequency > 1.93 && frequency < 2.08
    sound(x120, Fs);
end
if frequency > 2.09 && frequency < 2.25
    sound(x130, Fs);
end
if frequency > 2.26 && frequency < 2.42
    sound(x140, Fs);
end
if frequency > 2.43 && frequency < 2.58
    sound(x150, Fs);
end
if frequency > 2.59 && frequency < 2.75
    sound(x160, Fs);
end
if frequency > 2.76 && frequency < 2.92
    sound(x170, Fs);
end
if frequency > 2.93 && frequency < 3.08
    sound(x180, Fs);
end
