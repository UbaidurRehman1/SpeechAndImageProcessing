%-----------------------------Task # 1------------------------------%
img = imread('smile.png');
subplot(2, 2, 1)
s1 = imshow(img);
%waitfor(s1);
double_img = im2double(img);
s2 = imshow(double_img);
%waitfor(s2);
gray_image = rgb2gray(double_img);
subplot(2, 2, 2)
gray_show = imshow(gray_image);
%waitfor(gray_show);

%----------------------------Task # 2-------------------------------%
sub_image = gray_image(101:200, 101:200);
subplot(2, 2, 3)
sub_image_show = imshow(sub_image);
%waitfor(sub_image_show);

%---------------------------Task # 3--------------------------------%
%subtracing mean%
mean_1 = mean(gray_image(:));
mean_2 = mean(sub_image(:));
gray_image = gray_image - mean_1;
sub_image = sub_image - mean_2;
C = zeros(375, 500);
%letting formula%
for i = 1:374
    for j = 1:499
        value = 0;
        for u = 1:99
            for v = 1:95
                if or(((i + u) > 374), ((j + v) > 499))
                    break
                else  
                    value = value + (gray_image(i + u, j + v) * sub_image(u, v));
                end
            end
        end
        C(i, j) = value;
    end
end
subplot(2, 2, 4)
C = surf(C)
shading flat;
imshow(C)
