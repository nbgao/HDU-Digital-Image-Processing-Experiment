function [Image, k] = jpeg(factor)
path1 = '../IMAGE/lena.png';
path2 = ['../IMAGE/lena_', num2str(factor), '.jpg'];

I0=imread(path1);
imwrite(I0,path2,'quality', factor); %根据题目要求修改质量因子
 
I1=imread(path2);
k = imfinfo(path2)

s = k.FileSize/1024;
e = I0(:) - I1(:); %减去原图得到误差
[m, n] = size(e);
rmse = sqrt(sum(e(:)).^2/(m*n));%求均方根误差
i_size = k.Width*k.Height*k.BitDepth / 8;
i_compress = k.FileSize; %压缩后图像大小
ratio = i_size/i_compress; %压缩比

%imshow(I1);
fprintf('质量因子:%d\n',factor);
fprintf('均方根误差:%f\n',rmse);
fprintf('压缩比：%f\n',ratio);
fprintf('压缩后图像大小：%f\n',i_compress);

Image = I1;