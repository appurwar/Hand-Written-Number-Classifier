function computeKernel(data, filename)
    [m_X,n_X] = size(data);
    kernel_matrix = zeros(m_X, m_X);
     for i=1:m_X
        for j=1:m_X
            kernel_matrix(i,j) = data(i,:) * data(j,:)';
        end
     end
    
     save(filename,'kernel_matrix');
end