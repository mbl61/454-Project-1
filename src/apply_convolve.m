function outarray = apply_convolve(inarray, filterbank, biasvals)

%inarray is NxMxD1, filterbank is RxCxD1xD2,

%biasvals is a length D2 vector, and outarray is NxMxD2

D1 = size(inarray,3);
D2 = size(filterbank,4);
outarray = zeros(size(inarray,1), size(inarray,2), D2); % initialize output array

for i = 1: D2
    for j = 1: D1
        outarray(:,:,i) = outarray(:,:,i) + imfilter(inarray(:,:,j), filterbank(:,:,j,i), 'conv', 0);
    end
    outarray(:,:,i) = outarray(:,:,i) + biasvals(i);
end

end
