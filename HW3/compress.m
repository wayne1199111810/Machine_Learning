function image = compress(m, im)
    [rows, cols, dim] = size(im);
    image = zeros(rows, cols, dim);
    kgroup = zeros(rows, cols);
    kgroup = findClosestCenterOf(kgroup, im, m);
    for i = 1:rows
        for j = 1:cols
            idx = kgroup(i, j);
            image(i, j, :) = reshape(m(:, idx), [1, 1, dim]);
        end
    end
    image = uint8(image);
end

