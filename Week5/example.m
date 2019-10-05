X = [1, 2, 3, 4, 5];
Y = fft2(X);

ifft2(floor(abs(Y)))