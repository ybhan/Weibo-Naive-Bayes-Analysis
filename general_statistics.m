% May 11, 2017
% Edited by Jingbo Gao

% plot the PIE graph of the proportion of MALE and FEMALE users

sum_male = sum([data.gender]);
sum_female = size(data, 2) - sum_male;
figure;
subplot(1, 2, 1);
pie([sum_male, sum_female],{'Male','Female'});
title('The Proportion of Male and Female Users');

% plot the PIE graph of the proportion of VERIFIED and UNVERIFIED users

sum_isVerified = sum([data.isVerified]);
sum_notVerified = size(data, 2) - sum_isVerified;
subplot(1, 2, 2);
pie([sum_isVerified, sum_notVerified], {'Verified', 'Not Verified'});
title('The Proportion of Verified and Unverified Users');

% plot the HIST graph of the TIME users sign up
% plot the trend lines
% put some text on the peak and valley values

sum_time = zeros(1, max([tmp.year]) - min([tmp.year]) + 1);
tmp = [data.time];
for year = min([tmp.year]) : max([tmp.year])
    sum_time(year - min([tmp.year]) + 1) = sum([tmp.year] == year);
end
figure;
bar(min([tmp.year]) : max([tmp.year]), sum_time);

% plot the PIE graph of the distribution of PROVINCE

% code here

% plot the BOXPLOT graph of FOLLOW_COUNT, FOLLOWER_COUNT and TWEET_COUNT

% code here

