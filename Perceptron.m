clear;
clc;
load('hw1data.mat');

[X, Y] = data_shuffle(X, Y);
iteration_vector = [];
predictionV0 = [];
predictionV1 = [];
predictionV2 = [];
% for iteration=8000:2000:20000
%     iteration_vector = [iteration_vector iteration];
%     training_data = X(1:7500,:);
%     training_labels = Y(1:7500,:);
% 
%     test_data = X(7501:10000,:);
%     test_labels = Y(7501:10000,:);
%     
%     %normalization of data
%     training_data = (training_data - mean(training_data));
%     test_data = (test_data - mean(test_data));
%     
% %     degrees = 1:10;
% %     accuracies = [];
% %     
% %     for degree=1:10
% %         new_labels_for_test = [];
% %         for label=0:9
% %             lbl = transform_labels(test_labels, label);
% %             new_labels_for_test = [new_labels_for_test lbl];
% %         end
% %         classifications = [];
% %         for label=0:9
% %             classification = train_perceptronK(training_data, training_labels, label, test_data, test_labels, degree);
% %             classifications = [classifications classification];
% %         end
% % 
% %         [max_vals, predicted_labels] = max(classifications, [], 2);
% % 
% %         predicted_labels = predicted_labels - 1;
% % 
% %         predicted_labels = typecast(predicted_labels, 'int8');
% %         test_labels = typecast(test_labels, 'int8');
% %         num_cc = sum(predicted_labels == test_labels);
% % 
% %         num_samples = size(test_labels, 1);
% %         accuracy = (num_cc * 100) / num_samples;
% %         accuracies = [accuracies accuracy];
% %         fprintf("Accuracy of Kernelized P: %f\n", accuracy);
% %      end
% %     
% %     save('degreevsaccuracy.mat', accuracies);
% %     plot(degrees, accuracies);
% 
%     % ========================================================== %
% %         T = iteration;
% %         weights_for_all_p = [];
% %         for label=0:9
% %             weight = train_perceptronV0(training_data, training_labels, label, T);
% %             weights_for_all_p = [weights_for_all_p weight];
% %         end
% %         new_labels_for_test = [];
% %         for label=0:9
% %             lbl = transform_labels(test_labels, label);
% %             new_labels_for_test = [new_labels_for_test lbl];
% %         end
% % 
% %         classifications = new_labels_for_test .* (test_data * weights_for_all_p);
% % 
% %         [max_vals, predicted_labels] = max(classifications, [], 2);
% % 
% %         predicted_labels = predicted_labels - 1;
% % 
% %         predicted_labels = typecast(predicted_labels, 'int8');
% %         test_labels = typecast(test_labels, 'int8');
% %         num_cc = sum(predicted_labels == test_labels);
% % 
% %         num_samples = size(test_labels, 1);
% %         accuracy = (num_cc * 100) / num_samples;
% %         predictionV0 = [predictionV0 accuracy];
% %         fprintf("Accuracy of V0: %f\n", accuracy);
% % 
% %     % ===============================================================% 
% %     % ========================================================== %
% %         T = iteration;
% %         weights_for_all_p = [];
% %         for label=0:9
% %             weight = train_perceptronV1(training_data, training_labels, label, T);
% %             weights_for_all_p = [weights_for_all_p weight];
% %         end
% %         classifications = new_labels_for_test .* (test_data * weights_for_all_p);
% % 
% %         [max_vals, predicted_labels] = max(classifications, [], 2);
% % 
% %         predicted_labels = predicted_labels - 1;
% % 
% %         predicted_labels = typecast(predicted_labels, 'int8');
% %         test_labels = typecast(test_labels, 'int8');
% %         num_cc = sum(predicted_labels == test_labels);
% % 
% %         num_samples = size(test_labels, 1);
% %         accuracy = (num_cc * 100) / num_samples;
% %         predictionV1 = [predictionV1 accuracy];
% %         fprintf("Accuracy of V1: %f\n", accuracy);
% % 
% %     % ===============================================================% 
% %     % ===============================================================% 
% 
%     T = iteration;
%     classifications = [];
%     for label=0:9
%         classification = train_perceptronV2(training_data, training_labels, label, T, test_data, test_labels);
%         classifications = [classifications classification];
%     end
% 
%     [max_vals, predicted_labels] = max(classifications, [], 2);
% 
%     predicted_labels = predicted_labels - 1;
%     predicted_labels = typecast(predicted_labels, 'int8');
%     test_labels = typecast(test_labels, 'int8');
% 
%     num_cc = sum(predicted_labels == test_labels);
% 
%     num_samples = size(test_labels, 1);
%     accuracy = (num_cc * 100) / num_samples;
%     predictionV2 = [predictionV2 accuracy];
%     fprintf("Accuracy of V2: %f\n", accuracy);
% 
%     % ===============================================================% 
% end

load('predictionV0.mat');
load('predictionV1.mat');
load('predictionV2.mat');

iteration_vector= [8000:2000:20000];
plot(iteration_vector,predictionV0,'r-'); hold on;
plot(iteration_vector,predictionV1,'g-'); hold on;
plot(iteration_vector,predictionV2,'b-');
title('No. of Iterations vs Accuracy Plot');
xlabel('# of Iterations');
ylabel('Accuracy');
legend('PerceptronV0', 'PerceptronV1', 'PerceptronV2');
ylim([70 100]);

