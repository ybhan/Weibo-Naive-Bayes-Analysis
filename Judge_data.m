% May 21, 2017
% Edited by Yuanbo Han

% Distinguish active users in data by JUDGE, and save them as Active_users.

P = judge(Tr_data,data);
Active_users = data(P>=0.75);

save Active_users Active_users;