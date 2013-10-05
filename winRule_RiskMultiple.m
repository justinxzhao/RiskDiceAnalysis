function winTrends = winRule_RiskMultiple ...
    (num_considered, num_trials, trialObjs)

% win trends
winTrends = zeros(num_considered+1, 1);

for k = 1 : num_trials
    count = 0;  % this counts how many dice the attack loses
    for j = 1 : num_considered
        if trialObjs(k).rolls(2,j) >= trialObjs(k).rolls(1,j)
            count = count + 1;
        end
    end
    
    % whatever was lost, count that possibility in the index of winTrends
    winTrends(count+1) = winTrends(count+1) + 1;
    
end

winTrends = winTrends / num_trials * 100;