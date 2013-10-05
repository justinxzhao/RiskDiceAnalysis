% the main risk calculating function that works with diceGUI

function winTrends = diceGUIMainFunction...
    (num_diceA, num_diceD, diceMax, num_considered, num_trials)

win_A = 0;
win_D = 0;

% loop that plays the trials
for k = 1 : num_trials
    trialObjs(k) = Trial(num_diceA, num_diceD, diceMax);
end

winTrends = winRule_RiskMultiple(num_considered, num_trials, trialObjs);

end