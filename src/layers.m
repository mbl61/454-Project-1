function outarray = layers(inarray)

% import the filterbank and biasvals for each layer

%loading this file defines filterbanks and biasvectors
load '../Project1DataFiles/CNNparameters.mat'

outarray = inarray; % initialize output array

outarray = apply_imnormalize(outarray); % normalize input image

for i = 1:3
    outarray = apply_convolve(outarray, filterbanks{5 * i - 3}, biasvectors{5 * i - 3}); % input N*M*D1, filterbank N*M*D1*D2, biasvals length D2, output N*M*D2
    outarray = apply_relu(outarray); % apply ReLU
    outarray = apply_convolve(outarray, filterbanks{5 * i - 1}, biasvectors{5 * i - 1}); % input N*M*D1, filterbank N*M*D1*D2, biasvals length D2, output N*M*D2
    outarray = apply_relu(outarray); % apply ReLU
    outarray = apply_maxpool(outarray); % halve the size of the image
end

outarray = apply_fullconnect(outarray, filterbanks{17}, biasvectors{17}); % fully connect layer

outarray = apply_softmax(outarray); % output 1*1*10

end
