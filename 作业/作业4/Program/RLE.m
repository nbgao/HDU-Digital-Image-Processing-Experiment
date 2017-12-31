function RLE()
clear;
close all;
I = imread('../IMAGE/Image4.jpg'); 

[r_, c_, d_] = size(I);
if d_ > 1
    I0=rgb2gray(I);
else
    I0=I;
end
I0=round(I0/20)*20;
[zipped,info]=RLEncode(I0);%%调用RLE进行编码
unzipped=RLEdecode(zipped,info); %%调用解码程序进行编码
figure;
subplot(121);imshow(I0); title('原图');
subplot(122);imshow(unzipped); title('行程编码压缩图');
%erms=compare(I(:),unzipped(:))
info
cr=info.ratio
whos I unzipped zipped
 
function[zipped,info]=RLEncode(vector)
[m,n]=size(vector);
vector=vector(:)';
L=length(vector);
c=vector(1);e(1,1)=c;e(1,2)=0;%e(:,1)存放灰度，e(:,2)存放行程
t1=1
for j=1:L
    if((vector(j)==c))
        e(t1,2)=double(e(t1,2))+1;
    else
        c=vector(j);
        t1=t1+1;
        e(t1,1)=c;
        e(t1,2)=1;
    end
end
zipped=e;
info.rows=m;
info.cols=n;
[m,n]=size(e);
info.ratio=m*n/(info.rows*info.cols);
 
function unzipped=RLEdecode(zip,info)
zip=uint8(zip);
[m,n]=size(zip);
unzipped=[];
for i=1:m
    section=repmat(zip(i,1),1,double(zip(i,2)));
    unzipped=[unzipped section];
end
unzipped=reshape(unzipped,info.rows,info.cols);%程序结束
