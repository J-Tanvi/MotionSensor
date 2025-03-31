%% Tests of detect function
clear;

%for this test, since the program will run until terminated, it will count
%as passing as long as the system doesn't determine an error to catch 
try  
   detect();
   fprintf('PASSED TEST 1\n');
catch exception
   fprintf('FAILED TEST D:\n');
end 