function [t] = AverageIntervalOfTweets(data)
% AVERAGEINTERVALOFTWEETS(data) returns the average time of tweets'
% interval. The value is NaN means that his/her tweets count is 1.

% May 14, 2017
% Edited by Jingbo Gao

    t = zeros(1, size(data, 2));
    for i = 1 : size(data, 2)
        time = [data(i).tweet.time];
        t(i) = mean(-1 * diff(datenum([time.year], [time.month],...
            [time.day], [time.hour], [time.minute], 0)));
    end
end