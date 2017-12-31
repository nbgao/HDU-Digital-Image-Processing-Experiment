clear;
I1=imread('eight.tif');
figure;
subplot(1,2,1); imshow(I1); title('ԭʼͼ��');
I2=imnoise(I1,'salt & pepper');
subplot(1,2,2); imshow(I2); title('����ͼ��');

f=double(I2);
g=fft2(f);     %ִ��fft�任
g=fftshift(g);  %����
[N1,N2]=size(g);
n=5;
d0=50;       %����Ƶ��
n1=fix(N1/2);
n2=fix(N2/2);
for i=1:N1
    for j=1:N2
        d=sqrt((i-n1)^2+(j-n2)^2);
        h=1/(1+(d/d0)^(2*n));   % d0��Ϊ����Ƶ��
        result(i,j)=h*g(i,j);      %���
    end
end
result1=ifftshift(result);    %������
X2=ifft2(result1);        %���任
X3=uint8(real(X2));      

figure();
subplot(1,2,1); imshow(X3); title('������˹�˲���ͼ��');
subplot(1,2,2);
result=log(0.000001+abs(result));
imshow(result,[]),colorbar;
title('������˹�˲�����');


figure();
subplot(1,2,1);
g=log(0.000001+abs(g));
imshow(g,[]),colorbar;
title('ԭʼͼ��ĸ���Ҷ�任');
