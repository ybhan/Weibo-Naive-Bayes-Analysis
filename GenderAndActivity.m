% May 22, 2017
% Edited by Yuanbo Han

% Plot 4 graphs which show the relationship of gender and being active or
% not. Then analyze the probability of "being active or not has a strong
% relation to gender", by Chi-Square Test.

X = [data.gender];
figure;
subplot(2,2,1);
male = sum(X) / size(X,2);
pie([male,1-male],[1,0],{num2str(male*100,'%.2f%%'),num2str((1-male)*100,'%.2f%%')});
title('Gender Ratio in data');
legend('Male','Female','Location','NorthEastOutside');

Y = [Active_users.gender];
subplot(2,2,2);
male = sum(Y) / size(Y,2);
pie([male,1-male],[1,0],{num2str(male*100,'%.2f%%'),num2str((1-male)*100,'%.2f%%')});
title('Gender Ratio in Active\_users');
legend('Male','Female','Location','NorthEastOutside');

subplot(2,2,3);
active = sum(Y) / sum(X);
pie([active,1-active],[1,0],{num2str(active*100,'%.2f%%'),num2str((1-active)*100,'%.2f%%')});
title('Activity Ratio in Male Users');
legend('Active','NotActive','Location','NorthEastOutside');

subplot(2,2,4);
active = sum(Y==0) / sum(X==0);
pie([active,1-active],[1,0],{num2str(active*100,'%.2f%%'),num2str((1-active)*100,'%.2f%%')});
title('Activity Ratio in Female Users');
legend('Active','NotActive','Location','NorthEastOutside');

[tbl,chi2,p] = crosstab([data.gender],[data.isActive]);
fprintf('%6s%-10s%-10s\n','','NotActive','Active');
fprintf('%-8s%-10d%-10d\n','Female',tbl(1,1),tbl(1,2));
fprintf('%-8s%-10d%-10d\n','Male',tbl(2,1),tbl(2,2));
fprintf('\nchi2 = %.3f ---> \nThe probability of "being active or not has a strong relation to gender" is %.3f%%.\nGenerally, female users are more likely to be active.\n',[chi2,(1-p)*100]);

clear X Y male active tbl chi2 p;
