function topkacc = show_topk(scores, trueclass)

% compute top-k accuracy for all classes

nclass = size(scores, 2);
ntest  = size(scores, 1);
truelabel = trueclass(:);

% sort the top k scores
[~, ranked] = sort(scores, 2, 'descend');

topkacc = zeros(1, nclass);
for k = 1:nclass
    hit = ranked(:, 1:k) == repmat(truelabel, 1, k);
    topkacc(k) = 100 * sum(any(hit, 2)) / ntest;
end

figure;
plot(1:nclass, topkacc, '-o', 'LineWidth', 1.5, 'MarkerSize', 5);
xlim([1 nclass]);
ylim([0 100]);
grid on;
xlabel('k (number of top ranked classes allowed)');
ylabel('classification accuracy (%)');
title('Top-k classification accuracy');

for k = 1:nclass
    fprintf('Top-%d accuracy: %.2f%%\n', k, topkacc(k));
end

end
