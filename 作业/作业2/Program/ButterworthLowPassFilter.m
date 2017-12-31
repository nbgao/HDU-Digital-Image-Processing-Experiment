function ButterworthLowPassFilter(I0, D0)
figure;
subplot(2,2,1);
imshow(I0); title('原始图像');

I1 = imnoise(I0, 'salt & pepper');
subplot(2,2,2);
imshow(I1); title('噪声污染图像');

f = double(I1);
g = fft2(f);
g = fftshift(g);
[N1, N2] = size(g);
n = 5;

n1 = fix(N1/2);
n2 = fix(N2/2);
for i = 1:N1
    for j = 1:N2
        D = sqrt((i-n1)^2 + (j-n2)^2);
        h = 1/(1+(D/D0)^(2*n));
        result(i,j) = h*g(i,j);
    end
end

result1 = ifftshift(result);
subplot(2,2,3);
imshow(log(abs(result1)), []); title('巴特沃斯低通滤波处理后频谱图像');

X2 = ifft2(result1); % 反FFT
X3 = uint8(real(X2));
subplot(2,2,4);
imshow(X3); title('反变换后图像');

