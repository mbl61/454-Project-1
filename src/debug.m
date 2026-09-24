function debug()

%loading this file defines imrgb and layerResults
load '../Project1DataFiles/debuggingTest.mat'


outarray = layers(imrgb, true);

err = max(abs(double(outarray(:)) - double(layerResults{18}(:))));

if err <= 1e-6
    fprintf('debug() passed: max error %.2e\n', err);
else
    fprintf('debug() FAILED: max error %.2e\n', err);
end

end
