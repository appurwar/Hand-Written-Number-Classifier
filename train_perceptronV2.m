function classifications = train_perceptronV2(training_data,training_labels,label, T, test_data, test_labels)
    [m_X,n_X] = size(training_data);
    [m_Y,n_Y] = size(training_labels);
   
    weight = [zeros(size(training_data,2),1)];
    new_labels = transform_labels(training_labels, label);
   
    k = 1;
    c = [0];
    
    for t = 1:T
        i = mod(t,m_X) + 1;
        if(new_labels(i) * (training_data(i,:) * weight) <= 0)
            w_k = weight(:,k) + new_labels(i) * training_data(i,:)';
            weight = [weight w_k];
            c = [c;1];
            k = k + 1;
        else
            c(k) = c(k) + 1;
        end
    end

    classifications = c' .* (sign(test_data * weight));
    classifications = sign(sum(classifications,2));
  
    
end