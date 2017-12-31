bw = imread('../IMAGE/Boat.tiff');
% ���峤��Ϊ11,��ˮƽ����н�Ϊ90������Խṹ
se = strel('line',11,90);
bw2 = imdilate(bw,se);

figure;
subplot(1,3,1); imshow(bw); title('Original');
subplot(1,3,2); imshow(bw2); title('Dilated (line)');

se = strel('ball',5,5);
bw3 = imdilate(bw,se);
subplot(1,3,3); imshow(bw3); title('Dilated (ball)');