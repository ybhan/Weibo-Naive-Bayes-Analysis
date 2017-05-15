% May 15, 2017
% Edited by Yuanbo Han

% Distinguish active users in tr_data manully by common sense, and save the
% property as 'isActive': 1 means 'active', 0 means 'not active'.

% For example,
% 'tr_data(1).isActive = 1' means the first user in tr_data is active
% judged by common sense.

Active_Users = [2,5,9,13,15,16,17,18,21,26,29,30,34,39,40,46,51,53,55,58,62,63,65,68,69,70,71,72,75,76,78,84,90,92,94,99];
for i = 1:36
    tr_data(Active_Users(i)).isActive = 1;
    try
        for j = Active_Users(i)+1 : Active_Users(i+1)-1
            tr_data(j).isActive = 0;
        end
    catch
        continue
    end
end
save Tr_data tr_data;