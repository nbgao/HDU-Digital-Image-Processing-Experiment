function [Image, k] = jpeg(factor)
path1 = '../IMAGE/lena.png';
path2 = ['../IMAGE/lena_', num2str(factor), '.jpg'];

I0=imread(path1);
imwrite(I0,path2,'quality', factor); %������ĿҪ���޸���������
 
I1=imread(path2);
k = imfinfo(path2)

s = k.FileSize/1024;
e = I0(:) - I1(:); %��ȥԭͼ�õ����
[m, n] = size(e);
rmse = sqrt(sum(e(:)).^2/(m*n));%����������
i_size = k.Width*k.Height*k.BitDepth / 8;
i_compress = k.FileSize; %ѹ����ͼ���С
ratio = i_size/i_compress; %ѹ����

%imshow(I1);
fprintf('��������:%d\n',factor);
fprintf('���������:%f\n',rmse);
fprintf('ѹ���ȣ�%f\n',ratio);
fprintf('ѹ����ͼ���С��%f\n',i_compress);

Image = I1;