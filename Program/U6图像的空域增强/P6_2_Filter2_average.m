I = imread('../IMAGE/Happy.jpg');
figure;
subplot(2,2,1); imshow(I, []); title('ԭʼͼ��');

K1 = filter2(fspecial('average',3), I);
subplot(2,2,2); imshow(K1, []); title('3*3��С�ľ�ֵ�˲���');

K2 = filter2(fspecial('average',5), I);
subplot(2,2,3); imshow(K2, []); title('5*5��С�ľ�ֵ�˲���');

K3 = filter2(fspecial('average',7), I);
subplot(2,2,4); imshow(K3, []); title('7*7��С�ľ�ֵ�˲���');