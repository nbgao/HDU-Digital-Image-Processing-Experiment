I0 = saturn2;
figure;
subplot(2,3,1); imshow(I0);

I1 = imnoise(I0, 'salt & pepper');
subplot(2,3,4); imshow(I1);

f = double(I1);
g = fft2(f);
g = fftshift(g);
[N1, N2] = size(g);
n = 5;
D0 = 50;
n1 = fix(N1/2);
n2 = fix(N2/2);
for i = 1:N1
    for j = 1:N2
        D = sqrt((i-n1)^2 + (j-n2)^2);
        h = 1/(1+(D/D0)^(2*n));
        result(i,j) = h*g(i,j);
    end
end

subplot(2,3,2); imshow(result);

result1 = ifftshift(result);
subplot(2,3,5); imshow(result1); title('反移相');

X2 = ifft2(result1); % 反FFT
X3 = uint8(real(X2));
subplot(2,3,3); imshow(X3); title('巴特沃斯滤波器图像');

result2 = log(0.000001+abs(result1));
subplot(2,3,6); imshow(result2, []); colorbar;

