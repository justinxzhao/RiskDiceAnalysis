function findExpectedLoss
% uses probability cell matrix to calculate expected loss

% 1-30 vs. 1-30 Probability Data.mat
[FileName,PathName,FilterIndex] = uigetfile;
load([PathName FileName]);

for k = 1 : size(probabilities, 1)
    for j = 1 : size(probabilities, 2)
        
        expect = 0;
        for i = 2 : size(probabilities{k,j},1)
            expect = expect + probabilities{k,j}(i) * i;
        end
        
        expectedLoss(k,j) = expect / sum(probabilities{k,j});
        
    end
    
    % normalize by dividing over troops and 1 subtract everything
    expectedLoss(k,:) = 1 - (expectedLoss(k,:) / k);
end


save('Expected Loss Data.mat', 'expectedLoss');