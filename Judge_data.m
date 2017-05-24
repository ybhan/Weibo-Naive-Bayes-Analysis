% May 21, 2017
% Edited by Yuanbo Han

% Distinguish active users in data by JUDGE, and save this property as
% 'isActive': 1 means 'active', 0 means 'not active'.
% Then save all active users in Active_users,
% and save all not active users in NotActive_users.

% During this process, we assume one is an active user if he/she has a
% probability of over 75% to be active.

% For example,
% 'data(5).isActive = 1' means the 5th user in data has a probability of
% over 75% to be an active user according to function JUDGE, which applies
% Naive Bayes Algorithm.

P = judge(Tr_data,data);
for i = 1:999
    if P(i) >= 0.75
        data(i).isActive = 1;
    else
        data(i).isActive = 0;
    end
end
Active_users = data([data.isActive]==1);
NotActive_users = data([data.isActive]==0);
clear P i;

save WeiboData data;
save Active_users Active_users;
save NotActive_users NotActive_users;