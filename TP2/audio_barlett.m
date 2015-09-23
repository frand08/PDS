function barlett = audio_barlett(in,R)
    barlett = 0;
    L=floor(length(in)/R);
    N=1;
    for i=1:R
        barlett = barlett + audio_periodograma(in(N:N+L-1))/R;
        N = N + L;
    end
end