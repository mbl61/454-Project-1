function [outarray] = apply_imnormalize(inarray)

%inarray is an NxMx3 uint8 image and outarray is NxMx3

% CIFAR-10 mean and std

mean_val = [0.4914, 0.4822, 0.4465];

std_val = [0.2470, 0.2435, 0.2616];

% Normalize the input image

outarray = (double(inarray) / 255.0 - mean_val) ./ std_val;

end
