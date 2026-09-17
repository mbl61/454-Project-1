function outarray = apply_maxpool(inarray)
%inarray is 2Nx2MxD and outarray is size NxMxD


subImg1 = inarray(1:2:end, 1:2:end, :);
subImg2 = inarray(1:2:end, 2:2:end, :);
subImg3 = inarray(2:2:end, 1:2:end, :);
subImg4 = inarray(2:2:end, 2:2:end, :);


outarray = max(max(subImg1,subImg2),max(subImg3,subImg4));

end
