function ejercicio4()
%% Parametros

    N = 100;
    fs = 10;
    A = 2/N;
	df = fs/N;

%% Efecto de leackage para senoidal de f=fn*df con fn=round(N/4)

    fn=round(N/4);
    f=fn*df;

    [signal1, t1]=fsenoidal_ejexy(A,f,0,0,N,fs);
    
    [signal1_dft, f1]=myDFT_ejexy(signal1',fs);

    
    figure('Name','Leackage con fn=round(N/4)','NumberTitle','off');
    subplot(211);
    plot(t1,signal1);title('Senoidal con fn=round(N/4)');ylabel('Tension[V]','Interpreter','latex');xlabel('Tiempo[s]','Interpreter','latex');
    subplot(212);
    aux = abs(signal1_dft);
    stem(f1,aux);title('Espectro senoidal con fn=round(N/4)');ylabel('Aplitud[V/$$\sqrt{Hz}$$]','Interpreter','latex');xlabel('Frecuencia[Hz]','Interpreter','latex');
    
%% Efecto de leackage para senoidal de f=fn*df con fn=fn+di, siendo di=[0.01 0.25 0.5]

    di=[0.01 0.25 0.5];
    fn=fn + di;
    f=fn*df;

    [signal_di01,t_di01]=fsenoidal_ejexy(A,f(1),0,0,N,fs);
    
    [signal_di01_dft, f_di01]=myDFT_ejexy(signal_di01',fs);

    figure('Name','Leackage con fn=round(N/4)+0.01','NumberTitle','off');
    subplot(211);
    plot(t_di01,signal_di01);title('Senoidal con fn=round(N/4)+0.01');ylabel('Tension[V]','Interpreter','latex');xlabel('Tiempo[s]','Interpreter','latex');
    subplot(212);
    stem(f_di01,abs(signal_di01_dft));title('Espectro senoidal con fn=round(N/4)+0.01');ylabel('Aplitud[V/$$\sqrt{Hz}$$]','Interpreter','latex');xlabel('Frecuencia[Hz]','Interpreter','latex');
    
    
    
    [signal_di25,t_di25]=fsenoidal_ejexy(A,f(2),0,0,N,fs);
    
    [signal_di25_dft, f_di25]=myDFT_ejexy(signal_di25',fs);

    figure('Name','Leackage con fn=round(N/4)+0.25','NumberTitle','off');
    subplot(211);
    plot(t_di25,signal_di25);title('Senoidal con fn=round(N/4)+0.25');ylabel('Tension[V]','Interpreter','latex');xlabel('Tiempo[s]','Interpreter','latex');
    subplot(212);
    stem(f_di25,abs(signal_di25_dft));title('Espectro senoidal con fn=round(N/4)+0.25');ylabel('Aplitud[V/$$\sqrt{Hz}$$]','Interpreter','latex');xlabel('Frecuencia[Hz]','Interpreter','latex');
    
    
    
    [signal_di5,t_di5]=fsenoidal_ejexy(A,f(3),0,0,N,fs);
    
    [signal_di5_dft,f_di5]=myDFT_ejexy(signal_di5',fs);

    figure('Name','Leackage con fn=round(N/4)+0.5','NumberTitle','off');
    subplot(211);
    plot(t_di5,signal_di5);title('Senoidal con fn=round(N/4)+0.5');ylabel('Tension[V]','Interpreter','latex');xlabel('Tiempo[s]','Interpreter','latex');
    subplot(212);
    stem(f_di5,abs(signal_di5_dft));title('Espectro senoidal con fn=round(N/4)+0.5');ylabel('Aplitud[V/$$\sqrt{Hz}$$]','Interpreter','latex');xlabel('Frecuencia[Hz]','Interpreter','latex');

%% Agregado de ceros a las señales
    
    M = [N/10 N 10*N];

%% Para M=N/10    
    
    cero_M1=zeros(1,M(1));


    signal_di01_ceros1 = [signal_di01' cero_M1];

    t_di01_ceros1=0:1/fs:(1/fs*(N+N/10)-1/fs);              %Eje de tiempo
    
    [signal_di01_ceros1_dft, f_di01_ceros1]=myDFT_ejexy(signal_di01_ceros1,fs);

    figure('Name','Leackage con fn=round(N/4)+0.01 y agregado de N/10 muestas en cero','NumberTitle','off');
    subplot(211);
    plot(t_di01_ceros1,signal_di01_ceros1);title('Senoidal con fn=round(N/4)+0.01 y agregado de N/10 muestas en cero');ylabel('Tension[V]','Interpreter','latex');xlabel('Tiempo[s]','Interpreter','latex');
    subplot(212);
    stem(f_di01_ceros1,abs(signal_di01_ceros1_dft));title('Espectro senoidal con fn=round(N/4)+0.01 y agregado de N/10 muestas en cero');ylabel('Aplitud[V/$$\sqrt{Hz}$$]','Interpreter','latex');xlabel('Frecuencia[Hz]','Interpreter','latex');
    
    
    
    signal_di25_ceros1 = [signal_di25' cero_M1];
    
    t_di25_ceros1=0:1/fs:(1/fs*(N+N/10)-1/fs);              %Eje de tiempo
    
    [signal_di25_ceros1_dft, f_di25_ceros1]=myDFT_ejexy(signal_di25_ceros1,fs);

    figure('Name','Leackage con fn=round(N/4)+0.25 y agregado de N/10 muestas en cero','NumberTitle','off');
    subplot(211);
    plot(t_di25_ceros1,signal_di25_ceros1);title('Senoidal con fn=round(N/4)+0.25 y agregado de N/10 muestas en cero');ylabel('Tension[V]','Interpreter','latex');xlabel('Tiempo[s]','Interpreter','latex');
    subplot(212);
    stem(f_di25_ceros1,abs(signal_di25_ceros1_dft));title('Espectro senoidal con fn=round(N/4)+0.25 y agregado de N/10 muestas en cero');ylabel('Aplitud[V/$$\sqrt{Hz}$$]','Interpreter','latex');xlabel('Frecuencia[Hz]','Interpreter','latex');

    
    
    signal_di5_ceros1 = [signal_di5' cero_M1];
    
    t_di5_ceros1=0:1/fs:(1/fs*(N+N/10)-1/fs);              %Eje de tiempo
    
    [signal_di5_ceros1_dft, f_di5_ceros1]=myDFT_ejexy(signal_di5_ceros1,fs);

    figure('Name','Leackage con fn=round(N/4)+0.5 y agregado de N/10 muestas en cero','NumberTitle','off');
    subplot(211);
    plot(t_di5_ceros1,signal_di5_ceros1);title('Senoidal con fn=round(N/4)+0.5 y agregado de N/10 muestas en cero');ylabel('Tension[V]','Interpreter','latex');xlabel('Tiempo[s]','Interpreter','latex');
    subplot(212);
    stem(f_di5_ceros1,abs(signal_di5_ceros1_dft));title('Espectro senoidal con fn=round(N/4)+0.5 y agregado de N/10 muestas en cero');ylabel('Aplitud[V/$$\sqrt{Hz}$$]','Interpreter','latex');xlabel('Frecuencia[Hz]','Interpreter','latex');
    
    
%% Para M=N    
    
    
    cero_M2=zeros(1,M(2));
    
    signal_di01_ceros2 = [signal_di01' cero_M2];

    t_di01_ceros2=0:1/fs:(1/fs*(N+N)-1/fs);              %Eje de tiempo    
    
    [signal_di01_ceros2_dft, f_di01_ceros2]=myDFT_ejexy(signal_di01_ceros2,fs);

    figure('Name','Leackage con fn=round(N/4)+0.01 y agregado de N muestas en cero','NumberTitle','off');
    subplot(211);
    plot(t_di01_ceros2,signal_di01_ceros2);title('Senoidal con fn=round(N/4)+0.01 y agregado de N muestas en cero');ylabel('Tension[V]','Interpreter','latex');xlabel('Tiempo[s]','Interpreter','latex');
    subplot(212);
    stem(f_di01_ceros2,abs(signal_di01_ceros2_dft));title('Espectro senoidal con fn=round(N/4)+0.01 y agregado de N muestas en cero');ylabel('Aplitud[V/$$\sqrt{Hz}$$]','Interpreter','latex');xlabel('Frecuencia[Hz]','Interpreter','latex');
    
    
    
    signal_di25_ceros2 = [signal_di25' cero_M2];
    
    t_di25_ceros2=0:1/fs:(1/fs*(N+N)-1/fs);              %Eje de tiempo    
    
    [signal_di25_ceros2_dft, f_di25_ceros2]=myDFT_ejexy(signal_di25_ceros2,fs);

    figure('Name','Leackage con fn=round(N/4)+0.25 y agregado de N muestas en cero','NumberTitle','off');
    subplot(211);
    plot(t_di25_ceros2,signal_di25_ceros2);title('Senoidal con fn=round(N/4)+0.25 y agregado de N muestas en cero');ylabel('Tension[V]','Interpreter','latex');xlabel('Tiempo[s]','Interpreter','latex');
    subplot(212);
    stem(f_di25_ceros2,abs(signal_di25_ceros2_dft));title('Espectro senoidal con fn=round(N/4)+0.25 y agregado de N muestas en cero');ylabel('Aplitud[V/$$\sqrt{Hz}$$]','Interpreter','latex');xlabel('Frecuencia[Hz]','Interpreter','latex');

    
    
    signal_di5_ceros2 = [signal_di5' cero_M2];
    
    t_di5_ceros2=0:1/fs:(1/fs*(N+N)-1/fs);              %Eje de tiempo    
    
    [signal_di5_ceros2_dft, f_di5_ceros2]=myDFT_ejexy(signal_di5_ceros2,fs);

    figure('Name','Leackage con fn=round(N/4)+0.5 y agregado de N muestas en cero','NumberTitle','off');
    subplot(211);
    plot(t_di5_ceros2,signal_di5_ceros2);title('Senoidal con fn=round(N/4)+0.5 y agregado de N muestas en cero');ylabel('Tension[V]','Interpreter','latex');xlabel('Tiempo[s]','Interpreter','latex');
    subplot(212);
    stem(f_di5_ceros2,abs(signal_di5_ceros2_dft));title('Espectro senoidal con fn=round(N/4)+0.5 y agregado de N muestas en cero');ylabel('Aplitud[V/$$\sqrt{Hz}$$]','Interpreter','latex');xlabel('Frecuencia[Hz]','Interpreter','latex');
    
    
%% Para M=10*N
    
    cero_M3=zeros(1,M(3));
    
    signal_di01_ceros3 = [signal_di01' cero_M3];

    t_di01_ceros3=0:1/fs:(1/fs*(N+10*N)-1/fs);              %Eje de tiempo    
    
    [signal_di01_ceros3_dft, f_di01_ceros3]=myDFT_ejexy(signal_di01_ceros3,fs);

    figure('Name','Leackage con fn=round(N/4)+0.01 y agregado de 10*N muestas en cero','NumberTitle','off');
    subplot(211);
    plot(t_di01_ceros3,signal_di01_ceros3);title('Senoidal con fn=round(N/4)+0.01 y agregado de 10*N muestas en cero');ylabel('Tension[V]','Interpreter','latex');xlabel('Tiempo[s]','Interpreter','latex');
    subplot(212);
    stem(f_di01_ceros3,abs(signal_di01_ceros3_dft));title('Espectro senoidal con fn=round(N/4)+0.01 y agregado de 10*N muestas en cero');ylabel('Aplitud[V/$$\sqrt{Hz}$$]','Interpreter','latex');xlabel('Frecuencia[Hz]','Interpreter','latex');
    
    
    
    signal_di25_ceros3 = [signal_di25' cero_M3];
    
    t_di25_ceros3=0:1/fs:(1/fs*(N+10*N)-1/fs);              %Eje de tiempo    
    
    [signal_di25_ceros3_dft, f_di25_ceros3]=myDFT_ejexy(signal_di25_ceros3,fs);

    figure('Name','Leackage con fn=round(N/4)+0.25 y agregado de 10*N muestas en cero','NumberTitle','off');
    subplot(211);
    plot(t_di25_ceros3,signal_di25_ceros3);title('Senoidal con fn=round(N/4)+0.25 y agregado de 10*N muestas en cero');ylabel('Tension[V]','Interpreter','latex');xlabel('Tiempo[s]','Interpreter','latex');
    subplot(212);
    stem(f_di25_ceros3,abs(signal_di25_ceros3_dft));title('Espectro senoidal con fn=round(N/4)+0.25 y agregado de 10*N muestas en cero');ylabel('Aplitud[V/$$\sqrt{Hz}$$]','Interpreter','latex');xlabel('Frecuencia[Hz]','Interpreter','latex');

    
    
    signal_di5_ceros3 = [signal_di5' cero_M3];
    
    t_di5_ceros3=0:1/fs:(1/fs*(N+10*N)-1/fs);              %Eje de tiempo    
    
    [signal_di5_ceros3_dft, f_di5_ceros3]=myDFT_ejexy(signal_di5_ceros3,fs);

    figure('Name','Leackage con fn=round(N/4)+0.5 y agregado de 10*N muestas en cero','NumberTitle','off');
    subplot(211);
    plot(t_di5_ceros3,signal_di5_ceros3);title('Senoidal con fn=round(N/4)+0.5 y agregado de 10*N muestas en cero');ylabel('Tension[V]','Interpreter','latex');xlabel('Tiempo[s]','Interpreter','latex');
    subplot(212);
    stem(f_di5_ceros3,abs(signal_di5_ceros3_dft));title('Espectro senoidal con fn=round(N/4)+0.5 y agregado de 10*N muestas en cero');ylabel('Aplitud[V/$$\sqrt{Hz}$$]','Interpreter','latex');xlabel('Frecuencia[Hz]','Interpreter','latex');

end

