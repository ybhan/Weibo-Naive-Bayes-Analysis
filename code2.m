%
sum_male = sum([data.gender]);
sum_female = size(data, 2) - sum_male;
figure;
subplot(1, 2, 1);
pie([sum_male, sum_female],{'Male','Female'});
title('The Proportion of Male and Female Users');
%
sum_isVerified = sum([data.isVerified]);
sum_notVerified = size(data, 2) - sum_isVerified;
subplot(1, 2, 2);
pie([sum_isVerified, sum_notVerified], {'Verified', 'Not Verified'});
title('The Proportion of Verified and Unverified Users');
