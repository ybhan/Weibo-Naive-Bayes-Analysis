% May 8, 2017
% Edited by Jingbo Gao

% Format WeiboProfile.csv and WeiboTweets.csv and Save as WeiboData.mat.

% data
%     - id
%     - gender(1->male, 0->female)
%     - isVerified
%     - time
%           - year
%           - month
%           - day
%     - province
%     - follow_count
%     - follower_count
%     - tweet_count
%     - tweet
%            - tweet_no
%            - tweet_time
%                        - year
%                        - month
%                        - day
%                        - hour
%                        - minute
%            - tweet_from
%            - isForwarded
%            - like_count
%            - forward_count
%            - review_count

data_1 = csvread('WeiboProfile.csv');
for i = 1 : size(data_1,1)
    data(i).id = data_1(i,1);
    data(i).gender = data_1(i, 2);
    data(i).isVerified = data_1(i, 3);
    data(i).time.year = data_1(i, 4);
    data(i).time.month = data_1(i, 5);
    data(i).time.day = data_1(i, 6);
    data(i).province = data_1(i, 7);
    data(i).follow_count = data_1(i, 8);
    data(i).follower_count = data_1(i, 9);
    data(i).tweet_count = data_1(i ,10);
end
clear data_1;
data_2 = csvread('WeiboTweets.csv');
k = 1;
j = 1;
for i = 1 : size(data_2, 1)
    while(data(k).id ~= data_2(i ,1))
        k = k + 1;
        j = 1;
        if k > size(data_2, 1)
            error('wrong');
        end
    end
    data(k).tweet(j).tweet_no = data_2(i ,2);
    data(k).tweet(j).time.year = data_2(i ,3);
    data(k).tweet(j).time.month = data_2(i ,4);
    data(k).tweet(j).time.day = data_2(i ,5);
    data(k).tweet(j).time.hour = data_2(i ,6);
    data(k).tweet(j).time.minute = data_2(i ,7);
    data(k).tweet(j).tweet_from = data_2(i ,8);
    data(k).tweet(j).isForwarded = data_2(i ,9);
    data(k).tweet(j).like_count = data_2(i ,10);
    data(k).tweet(j).forward_count = data_2(i ,11);
    data(k).tweet(j).review_count = data_2(i ,12);
    j = j + 1;
end
clear data_2 i j k;
save WeiboData data;
