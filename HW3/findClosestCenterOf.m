function kgroup = findClosestCenterOf(kgroup, im, m)
    k = size(m, 2);
    for i = 1:size(im, 1)
        for j = 1:size(im, 2)
            tmp = zeros(1, k);
            for l = 1:k
                tmp(l) = norm(squeeze(im(i, j, :)) - m(:, l), 2); 
            end
            [~,I] = min(tmp);
            kgroup(i, j) = I;
        end
    end
end
