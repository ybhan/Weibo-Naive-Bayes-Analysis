function max_days = MaxActiveDays(one)
% ACTIVEDAYS(user, rate) returns the max days when the user is active.

% May 16, 2017
% Edited by Jingbo Gao
    
    time = [one.tweet.time];
    date = datenum([time.year], [time.month],...
            [time.day], [time.hour], [time.minute], 0);
    tmp = [];
    for i = min(date) : max(date)
        i_b = i;
        i_s = i - 14;
        for j = 1 : size(date, 2)
            if date(j) <= i_b && date(j) >= i_s
                tmp = [tmp 1];
                break;
            elseif j == size(date, 2)
                tmp = [tmp 0];
            end
        end
    end
    
    tmp_start = 1;
    max_days = 1;
    for i = 1 : size(tmp, 2)
        if tmp(i) == 0
            tmp_days = i - tmp_start;
            tmp_start = i;
            if tmp_days > max_days
                max_days = tmp_days;
            end
        end
    end
end