close all;
N = 256;
A = 1;
fs = 1000;
Ts = 1/fs;
dt = Ts/N;

%% Generacion de las señales

k=1:N;
noise(k) =  0.1*A*randn(1,N);                   % Ruido aleatorio generado
signal = fsenoidal(A,100,0,1,N,fs);             % Senoidal generada
noiseAndSignal(k) = signal + noise;             % Senoidal + ruido

t=0:dt:(Ts-dt);                                 % Eje de tiempo

figure('Name','Señales','NumberTitle','off');
subplot(311);
plot(t,signal);title('Senoidal');ylabel('Amplitud(V)');     % Gráfica del seno puro

subplot(312);
plot(t,noise);title('Ruido');ylabel('Amplitud(V)');         % Gráfica del ruido generado aleatoriamente

subplot(313);
plot(t,noiseAndSignal);title('Senoidal + Ruido');xlabel('Tiempo(s)');ylabel('Amplitud(V)');     % Gráfica de seno con ruido

%% Muestreado con 4 bits

Bits = 4;
TopEscala = 2^(Bits-1)-1;

Qsignal_4b = 1/TopEscala*round(signal*TopEscala);
QnoiseAndSignal_4b = 1/TopEscala*round(noiseAndSignal*TopEscala);        



Qnoise_4b = Qsignal_4b - signal;                  % Obtengo el ruido de cuantización a partir de la resta de mi señal con la señal cuantizada

figure('Name','Cuantización a muestras de 4 bits','NumberTitle','off');
subplot(311);
plot(Qsignal_4b);title('Senoidal cuantizada');ylabel('Amplitud(V)');                        % Seno cuantizado
subplot(312);
plot(QnoiseAndSignal_4b);title('Senoidal + Ruido cuantizada');ylabel('Amplitud(V)');        % Cuantización del seno con ruido
subplot(313);
plot(Qnoise_4b);title('Ruido de cuantización');xlabel('Muestras');ylabel('Amplitud(V)');    % Ruido de cuantización

%% Muestreado con 8 bits

Bits = 8;
TopEscala = 2^(Bits-1)-1;

Qsignal_8b = 1/TopEscala*round(signal*TopEscala);
QnoiseAndSignal_8b = 1/TopEscala*round(noiseAndSignal*TopEscala);        



Qnoise_8b = Qsignal_8b - signal;                  % Obtengo el ruido de cuantización a partir de la resta de mi señal con la señal cuantizada

figure('Name','Cuantización a muestras de 8 bits','NumberTitle','off');
subplot(311);
plot(Qsignal_8b);title('Senoidal cuantizada');ylabel('Amplitud(V)');                        % Seno cuantizado
subplot(312);
plot(QnoiseAndSignal_8b);title('Senoidal + Ruido cuantizada');ylabel('Amplitud(V)');        % Cuantización del seno con ruido
subplot(313);
plot(Qnoise_8b);title('Ruido de cuantización');xlabel('Muestras');ylabel('Amplitud(V)');    % Ruido de cuantización

%% Muestreado con 16 bits

Bits = 16;
TopEscala = 2^(Bits-1)-1;

Qsignal_16b = 1/TopEscala*round(signal*TopEscala);
QnoiseAndSignal_16b = 1/TopEscala*round(noiseAndSignal*TopEscala);        



Qnoise_16b = Qsignal_16b - signal;                  % Obtengo el ruido de cuantización a partir de la resta de mi señal con la señal cuantizada

figure('Name','Cuantización a muestras de 16 bits','NumberTitle','off');
subplot(311);
plot(Qsignal_16b);title('Senoidal cuantizada');ylabel('Amplitud(V)');                       % Seno cuantizado
subplot(312);
plot(QnoiseAndSignal_16b);title('Senoidal + Ruido cuantizada');ylabel('Amplitud(V)');       % Cuantización del seno con ruido
subplot(313);
plot(Qnoise_16b);title('Ruido de cuantización');xlabel('Muestras');ylabel('Amplitud(V)');   % Ruido de cuantización

%% Histograma 4 bits

dep_Qnoise_4b = abs(fft(xcorr(Qnoise_4b)));

figure('Name','Histograma a muestras de 4 bits','NumberTitle','off');
subplot(311);
plot(dep_Qnoise_4b);
subplot(312);
hist(dep_Qnoise_4b,100);
subplot(313);
hist(Qnoise_4b,100);
