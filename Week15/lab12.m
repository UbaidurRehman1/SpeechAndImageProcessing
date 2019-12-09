close all; %close all figures
x = imread('test.png');
x = double(x);
[r, c] = size(x);
figure, imshow(x, []);
x2(:,:,1)=x;
x2(:,:,2)=x;
x2(:,:,3)=x;
i = 1;
imwrite(x2(50:100,:,:)/256, strcat(int2str(i), '.jpg'));