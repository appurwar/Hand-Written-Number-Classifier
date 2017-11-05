function weight = train_perceptronV1(training_data,training_labels,label, T)
    [m_X,n_X] = size(training_data);
    [m_Y,n_Y] = size(training_labels);
   
    weight = zeros(size(training_data,2),1);
    new_labels = transform_labels(training_labels, label);
    
    for t = 1:T
        values = new_labels .* (training_data * weight);
        [min_val, i] = min(values);
        if(min_val <= 0)
            weight = weight + new_labels(i) * training_data(i,:)';
        else 
            break;
        end
    end
end