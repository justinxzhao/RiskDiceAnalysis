function probabilities = riskSimulationSingleBattle...
    (num_attack, num_defense, num_trials, diceMax)

ATTACK = num_attack;
DEFENSE = num_defense;
probabilities = zeros(num_attack, 1);

for k = 1 : num_trials

    num_attack = ATTACK;
    num_defense = DEFENSE;
    
    while num_attack > 1 && num_defense > 0
        % figuring out the number of dice
        if num_attack > 3
            num_diceA = 3;
        elseif num_attack > 2
            num_diceA = 2;
        else
            num_diceA = 1;
        end

        if num_defense >= 2
            num_diceD = 2;
            num_considered = 2;
        else
            num_diceD = 1;
            num_considered = 1;
        end
        
        if num_attack == 2
            num_considered = 1;
        end

        % roll and sort dice
        for j = 1 : num_diceA
            rollsA(j) = floor(rand()*diceMax) + 1;
        end
        sort(rollsA, 'descend');

        for j = 1 : num_diceD
            rollsD(j) = floor(rand()*diceMax) + 1;
        end
        sort(rollsD, 'descend');


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

    probabilities(num_attack) = probabilities(num_attack) + 1;

end

probabilities = probabilities / num_trials * 100;