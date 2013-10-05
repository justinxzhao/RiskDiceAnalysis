function findExpectedLoss11Ratio
% written to play with ratio percentages and such


[FileName,PathName,FilterIndex] = uigetfile;
load([PathName FileName]);

ratioOneOne = size(winOrLose,1);
for i = 1 : size(winOrLose,1)
    ratioOneOne(i) = expectedLoss(i,i);
end

expectedLoss = [expectedLoss, ratioOneOne'];

save('1-1 Expected Loss Ratio Data');