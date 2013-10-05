function riskWinOrLose
% calculates the percentage chance of the attack winning
% and a cell of probabilities of what the attack will lose
% for aI to aF
% collaborates with riskSimulationDifferentBattles

aI = 1;
aF = 101;
dI = 1;
dF = 101;
num_trials = 100000;
diceMax = 6;
attackDiceLim = 3;
defenseDiceLim = 2;
numConsideredLim = 2;

disp('Calculating Simulations');
tic;

[probabilities winOrLose] = riskSimulationDifferentBattles ...
    (aI, aF, dI, dF, num_trials, diceMax, ...
    attackDiceLim, defenseDiceLim, ...
    numConsideredLim);

elapsedTime = toc;
save([datestr(now, 'mmmm_dd_yyyy_HH_MM_SS.FFF_AM') '.mat']);

disp('Finished Calculating Simulations');