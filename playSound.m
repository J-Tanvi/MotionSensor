% Name: Tanvi Jain
% Student #: 220287975
% Date: 3/12/24
% Course: EECS 1011

% The purpose of this function is to play a small tune when someone comes
% into the field of vision
% The function does not return any values but does take two input
% parameters: a - the arduino, and farHow - the distance reading

function playSound(a, farHow)
    % write your code here!
    %define sound beats 
    allGood = [0.5 0.5 0.5 0];
    smallWarn = [0.2 0.3 0.2 0.3 0.2 0.5 0.2 0.5 1 0];
    bigWarn = [0.2 0.5 0.2 0.5 0.1 0.1 0.1 0.5 0.2 0.5 0.2 0.5 0.2 0.5 0.2 0];
    tooClose = [0.3 0.1 0.3 0.8 0.3 0.7 0.3 0.6 0.2 0.4 0.2 0.2 0.2 0.2 0.2 0.1 0.2 0.1 0.1 0.1 0.1 0];

    %used the distance from the ultrasonic sensor to set an appropriate
    %tune (i.e nothing detected in 100cm = play allGood
    type = [];
    if farHow >= 100
        type = allGood;
    elseif farHow >= 60
        type = smallWarn;
    elseif farHow >= 30
        type = bigWarn;
    elseif farHow <= 30
        type = tooClose;
    end

    %plays the allocated tune
    % type = [0.5 0];
    for i = 1:2:length(type)
        playTone(a, 'D5', 250, type(i));
        pause(type(i+1));
    end
end