function [win_A win_D] = winRule_RiskSingle(num_trials, trialObjs)

win_A = 0;
win_D = 0;

for k = 1 : num_trials
    if trialObjs(k).rolls(1,1) > trialObjs(k).rolls(2,1)
        win_A = win_A + 1;
    else
        win_D = win_D + 1;
    end
end

win_A = win_A / num_trials * 100;
win_D = win_D / num_trials * 100;