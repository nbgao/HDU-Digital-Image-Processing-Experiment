load imdemos saturn2
figure;
I = saturn2;
subplot(2,2,1); imshow(I); title('ԭʼͼ��');
A = fft2(I);
subplot(2,2,2); imshow(log(abs(A)), []); title('��ά����Ҷ�任ͼ��');

B = fftshift(A);
subplot(2,2,3); imshow(log(abs(B)), [ ]); title('Ƶ���ƶ���ͼ��')

C = ifft2(B);
subplot(2,2,4); imshow(C); title('��ά����Ҷ���任����');
