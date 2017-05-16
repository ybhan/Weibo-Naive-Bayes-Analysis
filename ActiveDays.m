function Days = ActiveDays(one)
% ACTIVEDAYS(user, rate) returns the days the user is active.

% May 16, 2017
% Edited by Jingbo Gao
    
    Days = 0;
    time = [one.tweet.time];
    date = datenum([time.year], [time.month],...
            [time.day], [time.hour], [time.minute], 0);
    for i = min(date) : max(date)
        i_b = i + 1;
        i_s = i - 1;
        for j = 1 : size(date, 2)
            if date(j) <= i_b && date(j) >= i_s
                Days = Days + 1;
            end
        end
    end
end