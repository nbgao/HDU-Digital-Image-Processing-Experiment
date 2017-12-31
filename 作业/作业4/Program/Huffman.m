function Huffman()
clear
close all;
X=imread('../IMAGE/Image4.jpg');
X = rgb2gray(X);
data=uint8(X);
[zipped,info]=huffencode(data); 
unzipped=huffdecode(zipped,info);   
figure;
subplot(121);imshow(data); title('Ô­Í¼');
subplot(122);imshow(unzipped); title('¹þ·òÂü±àÂëÑ¹ËõÍ¼');
erms=0
info
cr=info.ratio
whos data unzipped zipped

function [zipped,info]=huffencode(vector)
if ~isa(vector,'uint8')
    error('input argument must be a uint8 vector');
end
[m,n]=size(vector);    
vector=vector(:)';
f=frequency(vector);                
simbols=find(f~=0);
f=f(simbols);
[f,sortindex]=sort(f);           
simbols=simbols(sortindex);
len=length(simbols);
simbols_index=num2cell(1:len);
codeword_tmp=cell(len,1);
while length(f)>1                      
    index1=simbols_index{1};
    index2=simbols_index{2};
    codeword_tmp(index1)=addnode(codeword_tmp(index1),uint8(0));
    codeword_tmp(index2)=addnode(codeword_tmp(index2),uint8(1));
    f=[sum(f(1:2)) f(3:end)];
    simbols_index=[{[index1,index2]} simbols_index(3:end)];
    [f,sortindex]=sort(f);
    simbols_index=simbols_index(sortindex);
end
codeword=cell(256,1);
codeword(simbols)=codeword_tmp;
len=0;
for index=1:length(vector)                           
    len=len+length(codeword{double(vector(index))+1});
end
string=repmat(uint8(0),1,len);
pointer=1;
for index=1:length(vector)                            
    code=codeword{double(vector(index))+1};
    len=length(code);
    string(pointer+(0:len-1))=code;
    pointer=pointer+len;
end
len=length(string);
pad=8-mod(len,8);                                    
if pad>0
    string=[string uint8(zeros(1,pad))];
end
codeword=codeword(simbols);
codelen=zeros(size(codeword));
weights=2.^(0:23);
maxcodelen=0;
for index=1:length(codeword)
    len=length(codeword{index});
    if len>maxcodelen
        maxcodelen=len;
    end
    if len>0
        code=sum(weights(codeword{index}==1));
        code=bitset(code,len+1);
        codeword{index}=code;
        codelen(index)=len;
    end
end
codeword=[codeword{:}];
cols=length(string)/8;
string=reshape(string,8,cols);
weights=2.^(0:7);
zipped=uint8(weights*double(string));
huffcodes=sparse(1,1);
for index=1:nnz(codeword)  
    huffcodes(codeword(index),1)=simbols(index);
end
info.pad=pad;
info.huffcodes=huffcodes;
info.ratio=cols./length(vector);
info.length=length(vector);
info.maxcodelen=maxcodelen;
info.rows=m;
info.cols=n;
function vector=huffdecode(zipped,info,image)
if ~isa(zipped,'uint8')
    error('input argument must be a uint8 vector');
end
len=length(zipped);
string=repmat(uint8(0),1,len.*8);
bitindex=1:8;
for index=1:len
    string(bitindex+8.*(index-1))=uint8(bitget(zipped(index),bitindex));
end
string=logical(string(:)');
len=length(string);
string((len-info.pad+1):end)=[];               
len=length(string);
weights=2.^(0:51);
vector=repmat(uint8(0),1,info.length);
vectorindex=1;
codeindex=1;
code=0;
for index=1:len
    code=bitset(code,codeindex,string(index));
    codeindex=codeindex+1;
    byte=decode(bitset(code,codeindex),info);
    if byte>0
        vector(vectorindex)=byte-1;
        codeindex=1;
        code=0;
        vectorindex=vectorindex+1;
    end
end
vector=reshape(vector,info.rows,info.cols);      
function codeword_new=addnode(codeword_old,item)
codeword_new=cell(size(codeword_old));
for index=1:length(codeword_old)
    codeword_new{index}=[item codeword_old{index}];
end
function f=frequency(vector)
if ~isa(vector,'uint8')
    error('input argument must be a uint8 vector');
end
f=repmat(0,1,256);
len=length(vector);
for index=0:255
    f(index+1)=sum(vector==uint8(index));
end
f=f./len;
function byte=decode(code,info)
byte=info.huffcodes(code); %%³ÌÐò½áÊø
