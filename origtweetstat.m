function [Like_average,Forward_average,Review_average,J] = origtweetstat(data)
    % ORIGTWEETSTAT(data) Statistics of original tweets of users in data.
    % [Like_average,Forward_average,Review_average,j]=ORIGTWEETSTAT(data),
    % where
    % Like_average is a matrix that for each i, Like_average(i) is the
    % average like_count per tweet of data(i);
    % Forward_average is a matrix that for each i, Forward_average(i) is 
    % the average forward_count per tweet of data(i);
    % Review_average is a matrix that for each i, Review_average(i) is the
    % average review_count per tweet of data(i);
    % J is the number of users in data who never tweeted.
    %
    % Specially, if data(j) never tweeted, the result will have
    % like_average(j)=forward_average(j)=review_average(j)=0.
    %
    % May 24, 2017
    % Edited by Yuanbo Han

    n = size( data, 2);
    Like_average = zeros(1,n);
    Forward_average = zeros(1,n);
    Review_average = zeros(1,n);
    J = 0;
    for i = 1 : n
        A = [data(i).tweet];
        A = A([A.isForwarded]==0);
        m = size(A,2);
        if( m == 0 )
            J = J + 1;
            continue;
        end
        Like_average(i) = sum([A.like_count]) / m;
        Forward_average(i) = sum([A.forward_count]) / m;
        Review_average(i) = sum([A.review_count]) / m;
    end
end