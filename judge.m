function P = judge(Tr_data, one)
    % JUDGE(Traingdata, User) returns the probability that the user is a active
    % user using the method of Naive Bayes Algorithm.

    % May 14, 2017
    % Edited by Jingbo Gao

    Tr_data_A = Tr_data([Tr_data.isActive] == 1);
    Tr_data_NA = Tr_data([Tr_data.isActive] == 0);

    P_A = sum([Tr_data.isActive]) / size(Tr_data, 2);
    P_NA = 1 - P_A;
    tc = one.tweet_count;
    interval = AverageIntervalOfTweets(one);

    tmp = Tr_data_A([Tr_data_A.tweet_count] <= tc);
    tmp = tmp(AverageIntervalOfTweets(tmp) <= interval);
    P_1 = size(tmp, 2) / size(Tr_data, 2);
    P_2 = size(tmp, 2) / size(Tr_data_A, 2);

    tmp = Tr_data_NA([Tr_data_NA.tweet_count] <= tc);
    tmp = tmp(AverageIntervalOfTweets(tmp) <= interval);
    P_3 = size(tmp, 2) / size(Tr_data_NA, 2);

    P = P_1 / ((P_2 * P_A) + (P_3 * P_NA));
end