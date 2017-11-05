function weight = train_perceptronV0(training_data,training_labels,label, T)
    [m_X,n_X] = size(training_data);
    [m_Y,n_Y] = size(training_labels);
   
    weight = zeros(size(training_data,2),1);
    new_labels = transform_labels(training_labels, label);
    
    for t = 1:T
        i = mod(t,m_X) + 1;
        if(new_labels(i) * (training_data(i,:) * weight) <= 0)
            weight = weight + new_labels(i) * training_data(i,:)';
        end
    end
end