function A = origtweetcount( data )
    % ORIGTWEETCOUNT(data) returns an array of the numbers of each user's
    % original tweets in data.

    % May 22, 2017
    % Edited by Yuanbo Han
    
    B = [data.tweet];
    B = [B.isForwarded];
    j = 1;
    A = [];
    for i = 1:size(data,2)
        j = j + size( data(i).tweet, 2 );
        A(i) = sum( B( j-size(data(i).tweet,2):j-1 ) == 0 );
    end
end