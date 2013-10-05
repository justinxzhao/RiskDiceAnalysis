function mainFunction

diceMax = 6;
num_diceA = 1;
num_diceD = 1;
num_trials = 10000;
num_considered = 1;

win_A = 0;
win_D = 0;

% loop that plays the trials
for k = 1 : num_trials
    trialObjs(k) = Trial(num_diceA, num_diceD, diceMax);
end

winTrends = winRule_RiskMultiple(num_considered, num_trials, trialObjs);

disp(winTrends);


% [win_A win_D] = winRule_RiskSingle(num_trials, trialObjs);
% 
% disp(['Attack rolled ' num2str(num_diceA) ' dice.']);
% disp(['Defense rolled ' num2str(num_diceD) ' dice.']);
% disp(['Attack won ' num2str(win_A) '% of the time']);
% disp(['Defense won ' num2str(win_D) '% of the time']);
% disp('Done!');
% disp(' ');