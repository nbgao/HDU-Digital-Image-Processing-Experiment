F0 = zeros(256,256);
F0(30:144, 78:102) = 1;

F1 = fft2(F0);
F2 = log(abs(F1));

figure;
subplot(1,2,1); imshow(F0);
subplot(1,2,2); imshow(F2, [-1,5]);