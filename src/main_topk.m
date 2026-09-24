function main()

% load dataset

%loading this file defines imageset, trueclass, and classlabels
load '../Project1DataFiles/cifar10testdata.mat'

% create model

predictedclass = zeros(size(imageset,4),1); % initialize predicted class array
scores = zeros(size(imageset,4), 10);      % probability score of each class

% run test

for i = 1: size(imageset,4)
    img = imageset(:,:,:,i);
    outarray = layers(img);
    scores(i,:) = outarray(:)';             % 1x10 probability vector of this image
    [~,predictedclass(i)] = max(outarray,[],3);
end

% evaluate result

conf_matrix = zeros(10, 10);

for i = 1:length(trueclass)
    actual = trueclass(i);
    predicted = predictedclass(i);
    conf_matrix(actual, predicted) = conf_matrix(actual, predicted) + 1;
end

disp("Confusion Matrix:");
disp(conf_matrix);

show_confusion(conf_matrix, imageset, trueclass, classlabels);

acc = sum(diag(conf_matrix)) / sum(conf_matrix(:));
fprintf("Classification Accuracy: %.2f%%\n", acc * 100);


show_topk(scores, trueclass);

end
