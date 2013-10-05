classdef Trial < handle
    
    properties
        rolls;
        num_players = 2;
        num_diceA;
        num_diceD;
    end
    
    
    methods
        function obj = Trial (num_diceA, num_diceD, diceMax)
            % all dice are rolled and sorted
            
            obj.num_diceA = num_diceA;
            obj.num_diceD = num_diceD;
            
            for j = 1 : num_diceA
                obj.rolls(1,j) = floor(rand()*diceMax) + 1;
            end
            obj.rolls(1,:) = sort(obj.rolls(1,:), 'descend');
            

            for j = 1 : num_diceD
                obj.rolls(2,j) = floor(rand()*diceMax) + 1;
            end
            obj.rolls(2,:) = sort(obj.rolls(2,:), 'descend');
            
        end
        
    end
    
end