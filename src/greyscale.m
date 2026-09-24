function greyscale(inarray)

% displays every channel of array as a small grayscale image

D = size(inarray, 3);

% square the grid as possible
ncol = ceil(sqrt(D));
nrow = ceil(D / ncol);

figure;

for d = 1: D
    subplot(nrow, ncol, d);
    imagesc(inarray(:,:,d));        % each channel is scaled to its own range
    axis image;
    axis off;
    title(sprintf('channel %d', d), 'FontSize', 8);
end

colormap(gray);

set(gcf, 'Name', sprintf('%d x %d feature maps', size(inarray,1), size(inarray,2)), 'NumberTitle', 'off', 'Color', 'w');

end
