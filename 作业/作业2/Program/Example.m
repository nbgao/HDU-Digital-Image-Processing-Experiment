clear;
I1=imread('eight.tif');
figure;
subplot(1,2,1); imshow(I1); title('原始图像');
I2=imnoise(I1,'salt & pepper');
subplot(1,2,2); imshow(I2); title('噪声图像');

f=double(I2);
g=fft2(f);     %执行fft变换
g=fftshift(g);  %移相
[N1,N2]=size(g);
n=5;
d0=50;       %截至频率
n1=fix(N1/2);
n2=fix(N2/2);
for i=1:N1
    for j=1:N2
        d=sqrt((i-n1)^2+(j-n2)^2);
        h=1/(1+(d/d0)^(2*n));   % d0即为截至频率
        result(i,j)=h*g(i,j);      %相乘
    end
end
result1=ifftshift(result);    %反移相
X2=ifft2(result1);        %反变换
X3=uint8(real(X2));      

figure();
subplot(1,2,1); imshow(X3); title('巴特沃斯滤波器图像');
subplot(1,2,2);
result=log(0.000001+abs(result));
imshow(result,[]),colorbar;
title('巴特沃斯滤波函数');


figure();
subplot(1,2,1);
g=log(0.000001+abs(g));
imshow(g,[]),colorbar;
title('原始图像的傅利叶变换');
