function riskRatioTestMain

ratio = 0.5;
num_iterations = 20;
num_trials = 10000;
diceMax = 6;
attackDiceLim = 3;
defenseDiceLim = 2;
numConsideredLim = 2;

disp('Running Simulations');
tic;
[probabilities winOrLose A D] = riskRatioTest(ratio, num_iterations, num_trials, diceMax, attackDiceLim, defenseDiceLim, numConsideredLim);
elapsedTime = toc;

save(['Ratio Data ' num2str(ratio) '.mat']);

disp('Finished Running Simulations');