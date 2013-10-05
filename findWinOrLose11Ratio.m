function findWinOrLose11Ratio
% written to play with ratio percentages and such

[FileName,PathName,FilterIndex] = uigetfile;
load([PathName FileName]);

ratioOneOne = size(winOrLose,1);
for i = 1 : size(winOrLose,1)
    ratioOneOne(i) = winOrLose(i,i);
end

winOrLose = [winOrLose; ratioOneOne];

save('1-1 WinOrLose Ratio Data');