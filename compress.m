function x=compress(A, y)
    % Add more preprocessing
    z = lasso(A, y);
    
    % Find sparsest row meeting some criteria
    temp = size(z);
    length = temp(2);
    
    C = mat2cell(z', ones(1, length));
    sparsities = arrayfun(@(x) nnz(~cell2mat(x)), C, 'un', 0);
    sparsities = cell2mat(sparsities);
    disp(sparsities);
    [argval, argmax] = max(sparsities);
    x = z(:, floor(1/2 * length));
end