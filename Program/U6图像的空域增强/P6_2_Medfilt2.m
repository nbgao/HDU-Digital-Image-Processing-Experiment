I = imread('../IMAGE/Boat.tiff');
K1 = medfilt2(I, [3 3]);
K2 = medfilt2(I, [5 5]);
K3 = medfilt2(I, [7 7]);

figure;
subplot(2,2,1); imshow(I); title('ԭʼͼ��');
subplot(2,2,2); imshow(K1); title('3*3��ֵ�˲�');
subplot(2,2,3); imshow(K2); title('5*5��ֵ�˲�');
subplot(2,2,4); imshow(K3); title('7*7��ֵ�˲�');