function p = Peak(one)
    % PEAK(user) return the peak number of a user.

    % May 16, 2017
    % Edited by Jingbo Gao
    
    time = [one.tweet.time];
    date = datenum([time.year], [time.month],...
        [time.day], [time.hour], [time.minute], 0);
    f = ksdensity(date);
    p = size(findpeaks(f), 2);
end