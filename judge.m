function P = judge(Tr_data, data)
    % JUDGE(Tr_data, data) calculate the probability that the
    % user in data is an active user, by the method of Naive Bayes
    % Algorithm, according to Tr_data. Then returns the matrix of
    % probabilities.
    
    % May 14, 2017
    % Edited by Jingbo Gao
    % May 21, 2017
    % Edited by Yuanbo Han

    Tr_data_A = Tr_data([Tr_data.isActive] == 1);
    Tr_data_NA = Tr_data([Tr_data.isActive] == 0);

    P_A = sum([Tr_data.isActive]) / size(Tr_data, 2);
    P_NA = 1 - P_A;
    tc = [data.tweet_count];
    interval = AverageIntervalOfTweets(data);
    A_interval = AverageIntervalOfTweets(Tr_data_A);
    NA_interval = AverageIntervalOfTweets(Tr_data_NA);
    sizeofTr_data = size(Tr_data, 2);
    sizeofTr_data_A = size(Tr_data_A, 2);
    sizeofTr_data_NA = size(Tr_data_NA, 2);
    
    n = size(data,2);
    P = zeros(1,n);
    for i = 1 : n
        tmp = ( [Tr_data_A.tweet_count] >= tc(i) & A_interval <= interval(i) );
        P_1 = sum(tmp) / sizeofTr_data;
        P_2 = sum(tmp) / sizeofTr_data_A;

        tmp = ( [Tr_data_NA.tweet_count] >= tc(i) & NA_interval <= interval(i) );
        P_3 = sum(tmp) / sizeofTr_data_NA;

        P(i) = P_1 / ((P_2 * P_A) + (P_3 * P_NA));
    end
end