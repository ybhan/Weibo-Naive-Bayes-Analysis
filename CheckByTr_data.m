% May 29, 2017
% Edited by Yuanbo Han

% In order to check the effectiveness of function JUDGE, first apply JUDGE
% to Tr_data. The result shows that it works very well.

reality = [Tr_data.isActive];
judgement = judge(Tr_data,Tr_data);
judgement = [judgement >= 0.75];

accuracy = [reality == judgement];
accuracy_rate = sum(accuracy) / size(accuracy,2);

fprintf('In reality, there are %d active users in Tr_data.\n', sum(reality));
fprintf('By JUDGE, there are %d active users in Tr_data.\n', sum(reality));
fprintf('Upon examination, the accuracy rate of JUDGE is %.2f%%\n', accuracy_rate * 100);

clear reality judgement accuracy accuracy_rate;