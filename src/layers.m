function outarray = layers(inarray)

% import the filterbank and biasvals for each layer

%loading this file defines filterbanks and biasvectors
load '../Project1DataFiles/CNNparameters.mat'

%sample code to verify which layers have filters and biases
for d = 1:length(layertypes)
    fprintf('layer %d is of type %s\n',d,layertypes{d});
    filterbank = filterbanks{d};

    if not(isempty(filterbank))
        fprintf(' filterbank size %d x %d x %d x %d\n', ...
            size(filterbank,1),size(filterbank,2), ...
            size(filterbank,3),size(filterbank,4));

    biasvec = biasvectors{d};
    fprintf(' number of biases is %d\n',length(biasvec));
    end
end

outarray = inarray; % initialize output array

outarray = apply_imnormalize(outarray); % normalize input image

for i = 1:3
    outarray = apply_conv(outarray, filterbanks{i}, biasvectors{i}); % input N*M*D1, filterbank N*M*D1*D2, biasvals length D2, output N*M*D2
    outarray = apply_relu(outarray); % apply ReLU
    outarray = apply_conv(outarray, filterbanks{i + 1}, biasvectors{i + 1}); % input N*M*D1, filterbank N*M*D1*D2, biasvals length D2, output N*M*D2
    outarray = apply_relu(outarray); % apply ReLU
    outarray = apply_maxpool(outarray); % halve the size of the image
end

outarray = apply_fullconnect(outarray, filterbanks{7}, biasvectors{7}); % fully connect layer

outarray = apply_softmax(outarray); % output 1*1*10

end
