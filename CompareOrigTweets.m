% May 24, 2017
% Edited by Yuanbo Han

% Compare the differences between original tweets of Active_users and those
% of NotActive_users:
% 1. Print a table of statistics of original tweets.
% 2. Plot 6 graphs of frequency distribution histograms of 'Like per
%    Tweet', 'Forward per Tweet' and 'Review per Tweet' of users. The 3
%    histograms in Figure 1 are for Acitve_users, and the 3 histograms in
%    Figure 2 are for NotActive_users.

tbl = zeros(3,2);

% Active_users
n = size( Active_users, 2);
[like_average,forward_average,review_average,j] = origtweetstat(Active_users);
tbl(1,1) = sum(like_average) / (n - j);
tbl(2,1) = sum(forward_average) / (n - j);
tbl(3,1) = sum(review_average) / (n - j);

figure;
subplot(2,2,1);
hist(like_average(like_average<=1),10);
axis([0,1,0,n-j]);
title('Active Users'' "Like per Tweet"');
xlabel('Like per Tweet','Fontsize',9);
ylabel('Users','Fontsize',9);
set(gca,'YTick',[0,0.25*(n-j),0.5*(n-j),0.75*(n-j),n-j]);
set(gca,'YTickLabel',[0,0.25,0.5,0.75,1]);

subplot(2,2,2);
hist(forward_average(forward_average<=2),10);
axis([0,2,0,n-j])
title('Active Users'' "Forward per Tweet"');
xlabel('Forward per Tweet','Fontsize',9);
ylabel('Users','Fontsize',9);
set(gca,'YTick',[0,0.25*(n-j),0.5*(n-j),0.75*(n-j),n-j]);
set(gca,'YTickLabel',[0,0.25,0.5,0.75,1]);

subplot(2,2,3);
hist(review_average(review_average<=3),10);
axis([0,3,0,n-j])
title('Active Users'' "Review per Tweet"');
xlabel('Review per Tweet','Fontsize',9);
ylabel('Users','Fontsize',9);
set(gca,'YTick',[0,0.25*(n-j),0.5*(n-j),0.75*(n-j),n-j]);
set(gca,'YTickLabel',[0,0.25,0.5,0.75,1]);

% NotActive_users
n = size( NotActive_users, 2);
[like_average,forward_average,review_average,j] = origtweetstat(NotActive_users);
tbl(1,2) = sum(like_average) / (n - j);
tbl(2,2) = sum(forward_average) / (n - j);
tbl(3,2) = sum(review_average) / (n - j);

figure;
subplot(2,2,1);
hist(like_average(like_average<=1),10);
axis([0,1,0,n-j])
title('NotActive Users'' "Like per Tweet"');
xlabel('Like per Tweet','Fontsize',9);
ylabel('Users','Fontsize',9);
set(gca,'YTick',[0,0.25*(n-j),0.5*(n-j),0.75*(n-j),n-j]);
set(gca,'YTickLabel',[0,0.25,0.5,0.75,1]);

subplot(2,2,2);
hist(forward_average(forward_average<=2),10);
axis([0,2,0,n-j])
title('NotActive Users'' "Forward per Tweet"');
xlabel('Forward per Tweet','Fontsize',9);
ylabel('Users','Fontsize',9);
set(gca,'YTick',[0,0.25*(n-j),0.5*(n-j),0.75*(n-j),n-j]);
set(gca,'YTickLabel',[0,0.25,0.5,0.75,1]);

subplot(2,2,3);
hist(review_average(review_average<=3),10);
axis([0,3,0,n-j])
title('NotActive Users'' "Review per Tweet"');
xlabel('Review per Tweet','Fontsize',9);
ylabel('Users','Fontsize',9);
set(gca,'YTick',[0,0.25*(n-j),0.5*(n-j),0.75*(n-j),n-j]);
set(gca,'YTickLabel',[0,0.25,0.5,0.75,1]);


fprintf('%20s%-10s%-10s\n','','Active','NotActive');
fprintf('%-20s%-10.2f%-10.2f\n','Like per Tweet',tbl(1,1),tbl(1,2));
fprintf('%-20s%-10.2f%-10.2f\n','Forward per Tweet',tbl(2,1),tbl(2,2));
fprintf('%-20s%-10.2f%-10.2f\n','Review per Tweet',tbl(3,1),tbl(3,2));