function labels = transform_labels(training_labels, label)
    labels = -1 * ones(size(training_labels));
    indices_for_this_label = find(training_labels == label);
    labels(indices_for_this_label) = 1;
end 