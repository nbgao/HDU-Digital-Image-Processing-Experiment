function M = HistEqualize(Image)
n = 255;
C = zeros(1,n);
shape = size(Image);
H = shape(1);
L = shape(2);
for i = 1:H
    for j = 1:L
        C(Image(i,j)) = C(Image(i,j))+1;
    end
end
C = C/sum(C);
P = cumsum(C);
M = uint8(zeros(H,L));
for i = 1:H
    for j = 1:L
        M(i,j) = uint8(n * P(Image(i,j)));
    end
end