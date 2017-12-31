load imdemos saturn2
figure;
I = saturn2;
subplot(2,2,1); imshow(I); title('原始图像');
A = fft2(I);
subplot(2,2,2); imshow(log(abs(A)), []); title('二维傅里叶变换图像');

B = fftshift(A);
subplot(2,2,3); imshow(log(abs(B)), [ ]); title('频谱移动后图像')

C = ifft2(B);
subplot(2,2,4); imshow(C); title('二维傅里叶反变换矩阵');
