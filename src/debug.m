function debug()

%loading this file defines imrgb and layerResults
load '../Project1DataFiles/debuggingTest.mat'

%sample code to show image and access expected results
figure; 
imagesc(imrgb);
truesize(gcf,[64 64]);

for d = 1:length(layerResults)
    result = layerResults{d};
    fprintf('layer %d output is size %d x %d x %d\n',...
        d,size(result,1),size(result,2), size(result,3));
end

outarray = layers(imrgb);

err = max(abs(double(outarray(:)) - double(layerResults{18}(:))));

if err <= 1e-6
    fprintf('debug() passed: max error %.2e\n', err);
else
    fprintf('debug() FAILED: max error %.2e\n', err);
end

end
