function expectedRetention = findExpectedRetention(expectedLoss)
% takes expected loss and finds expected retention

expectedRetention = zeros(size(expectedLoss));
for k = 1 : size(expectedLoss, 1)
    for j = 1 : size(expectedLoss, 2)
        expectedRetention(k,j) = (k - expectedLoss(k,j)) / k;
    end
end