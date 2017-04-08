function [ m, kgroup] = myKmeans(filename, k, nIters)
    %%
    color_scale = 256;
    im = double(imread(filename));
    [rows, cols, dim] = size(im);
    m = floor(color_scale * rand(dim, k));
    kgroup = zeros(rows, cols);
    for h = 1:nIters
        kgroup = findClosestCenterOf(kgroup, im, m);
        m = findMeans(kgroup, im, m, k);
        format long
        disp(['percentage: ', num2str(round(h / nIters * 100)) , '%']);
    end
    %%
    function m = findMeans(kgroup, im, m, k)
        for l = 1:k
            [row, col] = find(kgroup == l);
            if ~isempty(row)
                count = 0;
                for i = 1:length(row)
                    count = count + 1;
                    m(:, l) = m(:, l) + squeeze(im(row(i), col(i),:));
                end
                m(:, l) = m(:, l)/ count;
            end
        end
    end
end

