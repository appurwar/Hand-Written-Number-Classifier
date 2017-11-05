function classifications = train_perceptronK(training_data, training_labels, label, test_data, test_labels, degree)
    [m_X,n_X] = size(training_data);
    [m_Y,n_Y] = size(training_labels);
   
    new_labels = transform_labels(training_labels, label);
    alpha = zeros(size(training_labels));

    
    kernel_matrix = bsxfun(@(x,y) x * y', training_data, training_data);
    kernel_matrix = 1 + kernel_matrix;
    kernel_matrix = kernel_matrix .^ degree;
    
    for t = 1:10
        current_classifications = new_labels .* (kernel_matrix * (alpha .* new_labels));
        mc = find(current_classifications <= 0);
        alpha(mc) = alpha(mc) + 1;
    end
    
    weight = sum((alpha .* new_labels) .* training_data)';
    classifications = test_data * weight;
end