% May 29, 2017
% Edited by Yuanbo Han

% Calculates the correlation coefficients between original_tweet_count and
% follower_count, and between tweet_count and follower_count. Then compare
% the two coefficients.

A = origtweetcount(data);
B = [data.tweet_count];
C = [data.follower_count];
r_AC = corrcoef(A,C);
r_BC = corrcoef(B,C);
fprintf('The correlation coefficient between original_tweet_count and follower_count is %.2f.\n',r_AC(1,2));
fprintf('The correlation coefficient between tweet_count and follower_count is %.2f.\n',r_BC(1,2));
fprintf('Thus, follower_count is more related with original_tweet_count.\n');

clear A B C r_AC r_BC;