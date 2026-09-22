function outarray = apply_fullconnect(inarray, filterbank, biasvals)

%inarray is NxMxD1, filterbank is NxMxD1xD2,

%biasvals is a length D2 vector, and outarray is 1x1xD2

D2 = size(filterbank,4);
outarray = zeros(1,1,D2); % initialize output array

for i = 1: D2
    filter = filterbank(:,:,:,i);
    outarray(:,:,i) = dot(inarray(:), filter(:)) + biasvals(i);
end

end
