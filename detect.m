% Name: Tanvi Jain
% Student #: 220287975
% Date: 3/12/24
% Course: EECS 1011

% The purpose of this function is to see if there are any objects moving in
% the background. 

function intru = detect(~)
    % write your code here!
    % set up hardware connections: Arduino, ultrasonic sensor, and button
    a = arduino("COM6", "Nano3", "Libraries", "Ultrasonic");
    sonic = ultrasonic(a, 'D8', 'D9');
    configurePin(a, 'D6', 'DigitalInput');
    
    pressed = 0; %0 means it hasnt been pressed at all; 1 means its on
    % Make it such that the code will continue to run until the program is
    % terminated manually. 
    while 1
        %recieves input from the button
        buttonDoWhat = readDigitalPin(a, 'D6');

        %find the distance in centimeters
        dis = readDistance(sonic);
        dis = dis * 100;

        %when the button is pressed toggle the state
        while buttonDoWhat
            if pressed == 1
                pressed = 0;
            else
                pressed = 1;
            end
            %turn off the button to exit the loop
            buttonDoWhat = 0;
        end

        %if the state is on, show how far away an object is and play a
        %sound based on that distance
        if pressed == 1
            disp("There is an object " + dis + " cm away. Be advised");
            playSound(a, dis); %call the sound function
        end

        %display if the distance function is on or not
        disp("State = " + pressed);
        pause(1);
    end
end