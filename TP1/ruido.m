close all;
N = 256;
A = 1;
noise = zeros(N,1);
signal = zeros(N,1);
Qsignal = zeros(N,1);
noiseAndSignal = zeros(N,1);
QnoiseAndSignal = zeros(N,1);

k=1:N;
noise(k) =  0.1*A*randn(1,N);
signal = fsenoidal(A,1000,0,1,N,44100);
noiseAndSignal(k) = signal + noise;

figure;
subplot(311);
plot(signal);
subplot(312);
plot(noise);
subplot(313);
plot(noiseAndSignal);
%%
Bits = 8;
TopEscala = 2^(Bits-1)-1;
BottomEscala = 2^(Bits-1);

Qsignal = 1/TopEscala*round(signal*TopEscala);
QnoiseAndSignal = 1/TopEscala*round(noiseAndSignal*TopEscala);        



Qnoise = Qsignal - signal;

figure;
subplot(311);
plot(Qsignal);
subplot(312);
plot(QnoiseAndSignal);
subplot(313);
plot(Qnoise);

%%
dep_Qnoise = abs(fft(xcorr(Qnoise)));

figure;
subplot(311);
plot(dep_Qnoise);
subplot(312);
hist(dep_Qnoise,100);
subplot(313);
hist(Qnoise,100);
