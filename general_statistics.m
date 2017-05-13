% May 12, 2017
% Edited by Jingbo Gao

% plot the PIE graph of the proportion of MALE and FEMALE users

sum_male = sum([data.gender]);
sum_female = size(data, 2) - sum_male;
figure;
subplot(1, 2, 1);
pie([sum_male, sum_female]);
legend({'Male', 'Female'});
title('the Proportion of Male and Female Users');
clear sum_female sum_male;

% plot the PIE graph of the proportion of VERIFIED and UNVERIFIED users

sum_isVerified = sum([data.isVerified]);
sum_notVerified = size(data, 2) - sum_isVerified;
subplot(1, 2, 2);
pie([sum_isVerified, sum_notVerified]);
legend({'Verified', 'Not Verified'},'Location','SouthEast');
title('the Proportion of Verified and Unverified Users');
clear sum_isVerified sum_notVerified;

% plot the HIST graph of the TIME users sign up
% plot the trend lines

tmp = [data.time];
figure;
h = histogram([tmp.year] + 1 / 12 * [tmp.month]);
hold on;
h_x = h.BinEdges(1 : end - 1) + 0.5 * h.BinWidth;
h_y = h.Values;
plot(h_x, h_y, 'LineWidth', 1.5);
xlabel('Year');
ylabel('Users');
title('the Distribution of the Time Users Sign Up');
h_x = h.BinEdges(1 : end - 1) + 0.1 * h.BinWidth;
h_y = h.Values + 5;
text(h_x, h_y, int2str(h.Values(:)));
hold off;
clear tmp h h_x h_y h_max;

% plot the ROSE graph of the distribution of PROVINCE

pro_size = max([data.province]) - min([data.province]) + 1;
pro_name = {...
    'Others', 'Zhejiang', 'Shanxi', 'Jiangxi', 'Shanghai', 'Tianjin',...
    'Fujian', 'Liaoning', 'Guangdong', 'Beijing', 'Shandong', 'Heilongjiang', ...
    'Hebei', 'Anhui', 'Jiangsu', 'Hainan', 'Taiwan', 'Hunan', 'Sichuan',...
    'Shannxi', 'Jilin', 'Henan', 'Xinjiang', 'Hubei', 'Guangxi', 'Overseas',...
    'Chongqing',  'Neimeng', 'Gansu', 'Hongkong', 'Macao', 'Guizhou', 'Yunnan',...
    'Tibet', 'Qinghai', 'Ningxia'};
[pro_t, pro_r] = rose([data.province] / pro_size * 2 * pi, pro_size);
figure;
pro_h = polarplot(pro_t, pro_r);
set(pro_h, 'LineWidth', 1.3);
set(gca, 'ThetaTick', 5 : 10 : 360);
set(gca, 'ThetaTickLabel', pro_name);
title('the Distribution of Province');
clear pro_r pro_size pro_t pro_name pro_h;

% tweet_from
tmp = [data.tweet];
tf = [tmp.tweet_from];
tf_y = [sum(tf == 2) 0;sum(tf == 1) sum(tf == 3)];
figure;
bar([1 2], tf_y, 0.5, 'stacked');
xlabel('Ways of Tweeting');
ylabel('Number of Tweets');
title('the Proportion of Tweeting Ways');
legend({'Official Ways', 'Third Party Ways'}, 'Location', 'NorthWest');
set(gca, 'XTickLabel', {'Website', 'Mobile'});
clear tf tf_y tmp;
