function testbench1()
    N = 128;
    M = N*2048;
    
    f = 0:1/(M/2-1):1;
    
    v_triangular = vtriangular(N);
    v_triangular_fft = abs(fft(v_triangular,M))/N;
    v_triangular_fft = 2*v_triangular_fft(1:length(v_triangular_fft)/2);
    
    figure(1);
    subplot(211);
    plot(v_triangular); title('Triangular');
    subplot(212);
    plot(f,20*log10(v_triangular_fft)),axis tight,grid; title('Espectro');
    
    v_hann = vhann(N);
    v_hann_fft = abs(fft(v_hann,M))/N;
    v_hann_fft = 2*v_hann_fft(1:length(v_hann_fft)/2);
    
    figure(2);
    subplot(211);
    plot(v_hann); title('Hann');
    subplot(212);
    plot(f,20*log10(v_hann_fft)),axis tight,grid; title('Espectro');
    
    v_flattop = vflattop(N);
    v_flattop_fft = abs(fft(v_flattop,M))/N;
    v_flattop_fft = 2*v_flattop_fft(1:length(v_flattop_fft)/2);
    
    figure(3);
    subplot(211);
    plot(v_flattop); title('Flat-top');
    subplot(212);
    plot(f,20*log10(v_flattop_fft)),axis tight,grid; title('Espectro');
    
    v_blackmanharris = vblackmanharris(N);
    v_blackmanharris_fft = abs(fft(v_blackmanharris,M))/N;
    v_blackmanharris_fft = 2*v_blackmanharris_fft(1:length(v_blackmanharris_fft)/2);
    
    
    
    f = 0:1/(M/2-1):1;
    figure(4);
    subplot(211);
    plot(v_blackmanharris); title('Blackman Harris');
    subplot(212);
    %semilogx(f,v_blackmanharris_fft), axis tight,xlim([0.1 1]),grid;
    plot(f,20*log10(v_blackmanharris_fft)),axis tight,grid; title('Espectro');

end