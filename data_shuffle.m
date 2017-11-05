function [data, labels] =  data_shuffle(data, labels)
    perm = randperm(size(labels, 1));
    data = data(perm, :);
    labels = labels(perm);
end