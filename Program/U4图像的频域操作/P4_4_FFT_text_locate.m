% ����ͼ��
bw = rgb2gray(imread('../IMAGE/text.jpg'));
figure;
subplot(2,2,1); imshow(bw);

% ����ʶ��Ŀ���ͼ�����и����
a = bw(37:115, 20:98);
subplot(2,2,2); imshow(a);


% ����ĸa�ʹ�ʶ��ͼ����п��ٸ���Ҷ�任��������
a(256,256) = 0;
C = real(ifft2(fft2(bw) .* fft2(rot90(a,2),256,256)));
C = 256 * (C-min(min(C)))/(max(max(C))-min(min(C)));
subplot(2,2,3); imshow(C,[]);

% ѡȡ��ֵ����Ŀ�궨λ
thresh = 160;
subplot(2,2,4); imshow(C>thresh);

