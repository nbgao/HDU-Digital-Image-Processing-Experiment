I = imread('../IMAGE/rice.png');
I2 = imbinarize(I);

% ����ṹԪ��
se = strel('disk', 3);
% ʩ�Ӹ�ʴ����
erodedBW = imerode(I2, se);
% ��ʾ���
figure;
subplot(1,2,1); imshow(I2);
subplot(1,2,2); imshow(erodedBW);


J = imread('../IMAGE/Elaine.tiff');
se = strel('ball',5,5);
erodedJ = imerode(J, se);
figure;
subplot(1,2,1); imshow(J);
subplot(1,2,2); imshow(erodedJ);