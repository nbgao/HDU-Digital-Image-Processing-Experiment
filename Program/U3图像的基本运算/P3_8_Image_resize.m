I = imread('../IMAGE/rice.png');
J1 = imresize(I, 0.5, 'lanczos2');
J2 = imresize(I, 0.5, 'box');
J3 = imresize(I, 0.5, 'nearest');
J4 = imresize(I, 0.5, 'bilinear');
J5 = imresize(I, 0.5, 'bicubic');

figure;
subplot(2,3,1); imshow(I); title('Origin Image ԭʼͼ��');
subplot(2,3,2); imshow(J1); title('Lanczos2');
subplot(2,3,3); imshow(J2); title('Box');
subplot(2,3,4); imshow(J3); title('Nearest ����ڲ�ֵ');
subplot(2,3,5); imshow(J4); title('Bilinear ˫���Բ�ֵ');
subplot(2,3,6); imshow(J5); title('Bicubic ˫���β�ֵ');
