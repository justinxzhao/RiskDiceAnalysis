% simulates risk over multiple trials AND over multiple combinations of
% troops in RATIOS

function [probabilities winOrLose A D] = riskRatioTest...
(ratio, num_iterations, num_trials, diceMax, attackDiceLim, ...
    defenseDiceLim, numConsideredLim)

% ratio is num_attack : num_defense

% Attack and defense always roll as many dice as they can, but bounded by
% the number of dice that are specified for both sides.
% For the attack, the greatest number of dice it can roll is one less than
% the total number of remaining troops. The greatest number of dice the
% defense can roll, however, is the number of defending troops.

% We are always considering the greatest number of troops possible,
% bounded by the specified number considered parameter. The number of
% troops is the smallest of either the parameter itself, one less than the
% number of attack dice, or the number of defense dice. 

probabilities = cell(num_iterations,1);
winOrLose = zeros(num_iterations,1);

for i = 1 : num_iterations
    if ratio >= 1
        A(i) = floor(i*ratio + 1);
        D(i) = i;
    else
        A(i) = i;
        D(i) = floor(i/ratio + 1);
    end

    probabilities{i,1} = zeros(A(i),1);

    ATTACK = A(i);    % number of attacking troops
    DEFENSE = D(i);  % number of defending troops

    for k = 1 : num_trials
        
        num_attack = ATTACK;
        num_defense = DEFENSE;

        while num_attack > 1 && num_defense > 0
            % figuring out the number of dice

            if attackDiceLim == 0
                num_diceAttack = num_attack - 1;
            elseif num_attack - 1 > attackDiceLim
                num_diceAttack = attackDiceLim;
            else
                num_diceAttack = num_attack - 1;
            end

            if defenseDiceLim == 0
                num_diceDefense = num_defense;
            elseif num_defense > defenseDiceLim
                num_diceDefense = defenseDiceLim;
            else
                num_diceDefense = num_defense;
            end

            % figuring out number of considered:
            if num_diceAttack >= numConsideredLim && num_diceDefense >= numConsideredLim
                num_considered = numConsideredLim;
            elseif num_diceAttack <= num_diceDefense
                num_considered = num_diceAttack;
            else
                num_considered = num_diceDefense;
            end


            rollsA = [];
            % roll and sort dice
            for j = 1 : num_diceAttack
                rollsA(j) = floor(rand()*diceMax) + 1;
            end
            rollsA = sort(rollsA, 'descend');

            rollsD = [];
            for j = 1 : num_diceDefense
                rollsD(j) = floor(rand()*diceMax) + 1;
            end
            rollsD = sort(rollsD, 'descend');


            % decide number of lost troops
            countA = 0;  % this counts how many dice the attack loses
            countD = 0;  % this counts how many dice the defense loses
            for j = 1 : num_considered
                if rollsD(j) >= rollsA(j)
                    countA = countA + 1;
                else
                    countD = countD + 1;
                end
            end

            num_attack = num_attack - countA;
            num_defense = num_defense - countD;

        end

        probabilities{i,1}(num_attack) = probabilities{i,1}(num_attack) + 1;

        if num_attack ~= 1
            winOrLose(i,1) = winOrLose(i,1) + 1;
        end

    end

    probabilities{i,1} = probabilities{i,1} / num_trials * 100;
        
end

winOrLose = winOrLose / num_trials;