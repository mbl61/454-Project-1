function show_confusion(conf_matrix, imageset, trueclass, classlabels)

n = size(conf_matrix, 1);
cellsize = size(imageset, 1);

%one representative image per class
classimg = zeros(cellsize, cellsize, 3, n);
for c = 1: n
    inds = find(trueclass == c);
    classimg(:,:,:,c) = double(imageset(:,:,:,inds(1))) / 255;
end

maxval = max(conf_matrix(:));
if maxval == 0
    maxval = 1;
end
t = conf_matrix / maxval;
color = [0.10, 0.70, 0.10]; % change this to [0.10, 0.70, 0.10] for green, [0.70, 0.10, 0.10] for red

block = zeros(n * cellsize, n * cellsize, 3);
for ch = 1: 3
    block(:,:,ch) = repelem(1 - t * (1 - color(ch)), cellsize, cellsize); % fill each cell with the appropriate color
end

% strips holding the class images
topstrip = zeros(cellsize, n * cellsize, 3);
leftstrip = zeros(n * cellsize, cellsize, 3);
for c = 1: n
    topstrip(:, (c - 1) * cellsize + (1:cellsize), :) = classimg(:,:,:,c);
    leftstrip((c - 1) * cellsize + (1:cellsize), :, :) = classimg(:,:,:,c);
end

%assemble the whole figure
composite = [ones(cellsize, cellsize, 3), topstrip; leftstrip, block];
total = cellsize + n * cellsize;

figure;
image(composite);
axis image;
set(gca, 'YDir', 'reverse');% row 1 of the matrix on top
hold on;

% grid lines between cells
for k = 0: n
    x = cellsize + k * cellsize + 0.5;
    line([x x], [0.5 total + 0.5], 'Color', 'k');
    y = cellsize + k * cellsize + 0.5;
    line([0.5 total + 0.5], [y y], 'Color', 'k');
end

% value of each cell
for r = 1: n
    for c = 1: n
        text(cellsize + (c - 0.5) * cellsize, cellsize + (r - 0.5) * cellsize, num2str(conf_matrix(r,c)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'FontWeight', 'bold');
    end
end

% class names along the two axes
set(gca, 'XTick', cellsize + (0.5:n - 0.5) * cellsize, 'XTickLabel', classlabels, 'XTickLabelRotation', 45, 'XAxisLocation', 'top', 'YTick', cellsize + (0.5:n - 0.5) * cellsize, 'YTickLabel', classlabels, 'FontSize', 8);
title('predicted class');
ylabel('true class');
set(gcf, 'Color', 'w');

hold off;

end
