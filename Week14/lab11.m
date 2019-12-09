img = imread('scene.jpg');
img = double(img)/255;

%transformation matrix T
theta = 0.5;
T = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
figure;
%imshow(img, [])

img

% loop over all rows and columns
for ii=1:size(img,1)
    for jj=1:size(img,2)
        % get pixel value
        pixel=img(ii,jj)
        break
    end
    break
end