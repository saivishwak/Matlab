%Decay Simulation with randomness
clear
clc
close all
%Inputs
lambda = 0.005;              %Decay Rate
max = 250;                   %Initial Number of Radiaoactice Particles
time_max = 500;              %Time
nloop = max;
number = nloop;
%Main Loop
for i = 1:time_max
    for j = 2:nloop
        decay = rand;
        if decay < lambda
         nloop = nloop -1;
        end
    end
number = nloop;
plot(i,number,'ob')
title('Random Decay Simulation')
xlabel('Time')
ylabel('Number of Radioactive Particles')
axis([0 time_max 0 max+20]);
drawnow
end
%Results
disp('Final Remaining Nucleii')
disp(number)