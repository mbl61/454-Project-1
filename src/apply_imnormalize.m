function outarray = apply_imnormalize(inarray)

%inarray is an NxMx3 uint8 image and outarray is NxMx3

% CIFAR-10 mean and std

mean_val = reshape([0.4914, 0.4822, 0.4465], [1, 1, 3]);

std_val = reshape([0.2470, 0.2435, 0.2616], [1, 1, 3]);

% Normalize the input image

outarray = (double(inarray) / 255.0 - mean_val) ./ std_val;

end
