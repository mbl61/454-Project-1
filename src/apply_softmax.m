function outarray = apply_softmax(inarray)

%inarray is 1x1xD and outarray is the same size

% softmax: out = exp(A - max(A)) / sum(exp(A - max(A)))

maxval = max(inarray(:));

outarray = exp(inarray - maxval) ./ sum(exp(inarray - maxval));

end
