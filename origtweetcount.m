function A = origtweetcount( data )
    % ORIGTWEETCOUNT(data) returns an array of the numbers of each user's
    % original tweets in data.
    %
    % May 22, 2017
    % Edited by Yuanbo Han
    
    n = size(data,2);
    A = zeros(1,n);
    for i = 1:n
        B = data(i).tweet;
        A(i) = sum( [B.isForwarded]==0 );
    end
end