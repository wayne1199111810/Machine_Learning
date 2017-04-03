clear, close all;
k = 16; nIters = 15;
large = 'mandrill-large.tiff';
small = 'mandrill-small.tiff';
%% (1)
filename = large;
A = double(imread(filename));
imwrite(uint8(round(A)), 'p4_1.tiff');
%% (2)
filename = small;
[m, kgroup] = myKmeans(filename, k, nIters);
%% (3)
filename = large;
A = double(imread(filename));
image = compress(m, A);
figure,
subplot(1,2,1),
imshow(uint8(A));
title('original image');
subplot(1,2,2),
imshow(image);
title('compress image');

%% (5)
k = 16;
nIters = 100;
filename = small;
[m, sigma, prior] = gmm( filename, k, nIters);
filename = large;
A = double(imread(filename));
[rows, cols, dim] = size(A);

W = expectation(reshape(A, [rows * cols, dim]), m, k, sigma, prior);

image = zeros(rows, cols, dim);
for i = 1:rows
    for j = 1:cols
        idx = (i - 1) * cols + j;
        [~, I] = max(W(idx, :));
        image(j, i, :) = reshape(m(I, :), [1, 1, dim]);
    end
end
image = uint8(image);
figure,
subplot(1,2,1),
imshow(uint8(A));
title('original image');
subplot(1,2,2),
imshow(image);
title('compress image');