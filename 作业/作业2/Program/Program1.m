load imdemos saturn2;
I0 = saturn2;
%I0 = imread('Lena.tiff');

figure;
subplot(2,4,1);
imshow(I0); title('ԭʼͼ��');

I0_FFT = fft2(I0);
I0_FFT = fftshift(I0_FFT);
subplot(2,4,5);
%figure;
imshow(log(abs(I0_FFT)), []); title('FFT�任Ƶ��ͼ��');


% ͼ��ƽ��
se = translate(strel(1), [50 50]);
I1 = imdilate(I0, se);
subplot(2,4,2);
%figure;
imshow(I1); title('ƽ�ƺ�ͼ��');

I1_FFT = fft2(I1);
I1_FFT = fftshift(I1_FFT);
subplot(2,4,6);
%figure;
imshow(log(abs(I1_FFT)), []); title('FFT�任Ƶ��ͼ��');


% ͼ����ת
I2 = imrotate(I0, 90, 'bicubic', 'crop');
subplot(2,4,3);
%figure;
imshow(I2);  title('��ת��ͼ��');

I2_FFT = fft2(I2);
I2_FFT = fftshift(I2_FFT);
subplot(2,4,7); 
%figure;
imshow(log(abs(I2_FFT)), []); title('FFT�任Ƶ��ͼ��');


% ͼ��Ŵ�
I3 = imresize(I0, 2, 'bicubic');
I3 = imcrop(I3, [512/4 512/4 256 256]);
subplot(2,4,4);
%figure;
imshow(I3);  title('�Ŵ��ͼ��');

I3_FFT = fft2(I3);
I3_FFT = fftshift(I3_FFT);
subplot(2,4,8);
%figure;
imshow(log(abs(I3_FFT)), []); title('FFT�任Ƶ��ͼ��');

