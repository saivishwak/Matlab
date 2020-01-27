%Hybrid Particle Swarm Optimization for solving boundary value differential problems
clc;
clear;
close all;

% Problem Definition
nVar = 6;                  % No of Unkown variables
Varsize = [1 nVar];        % Matrix size of variables
Varmin = -10;              % Lower bound of unkown variables;
Varmax = 10;               % Upper bound of unkown variables;

% Problem Parameters
maxiter = 50;             % Maximum Number of Iterations
npop = 200;                 % Population Size (Swarm Size)
w = 1;                     % Intertia Coefficient
wdamp = 0.60;              % Damping Ratio of Inertial Coefficient
c1 = 1;                    % Personal Acceleration Coefficient
c2 = 2;                    % Social Acceleration Coefficient

tspan = linspace(0,1,100); %Time INterval
tspan = transpose(tspan);

% Initialization
empty_particle.position = [];
empty_particle.velocity = [];
empty_particle.cost = [];
empty_particle.best.position = [];
empty_particle.best.cost = [];

% Create a matrix of all the particles
particle = repmat(empty_particle,npop,1);


% Initialize the global best
globalbest.cost = inf;

for i = 1:npop

    % Initialize the postitions of the particles
    particle(i).position = unifrnd(Varmin,Varmax,Varsize);
    
    % Initialize Velocity of the particles
    particle(i).velocity = zeros(Varsize);
    
    [t,y] = ode45(@differential,tspan,[0 0 particle(i).position(3) particle(i).position(4) 1 particle(i).position(6)]);
    
    % Evaluate cost function
    particle(i).cost = sqrt((1-y(end,1)).^2+y(end,2).^2+y(end,5).^2);
    
    % Update Personal Best
    particle(i).best.position = particle(i).position;
    particle(i).best.cost = particle(i).cost;
    
    % Update the global best
    if particle(i).best.cost < globalbest.cost
    
        globalbest = particle(i).best;
    end
    
end

% Matrix to update the best cost for each iteration
bestcosts = zeros(maxiter,1);


% Main Loop
while globalbest.cost >= 0.0000000001 
    for i = 1:npop
        
    % Update Velocity
    particle(i).velocity = w*particle(i).velocity + c1*rand(Varsize).*(particle(i).best.position - particle(i).position)...
    + c2*rand(Varsize).*(globalbest.position - particle(i).position);
    
    % Update Position
    particle(i).position = particle(i).position + particle(i).velocity;
    
    %ODE45
    [t,y] = ode45(@differential,tspan,[0 0 particle(i).position(3) particle(i).position(4) 1 particle(i).position(6)]);
    
    
    % Evaluate cost
    particle(i).cost = sqrt((1-y(end,1)).^2+y(end,2).^2+y(end,5).^2);

    
    % Update personal and global best
    if particle(i).cost < particle(i).best.cost
       
        particle(i).best.position = particle(i).position;
        particle(i).best.cost = particle(i).cost;
        
        if particle(i).best.cost < globalbest.cost
    
        globalbest = particle(i).best;
    
        end 
    end
    end
   
    w = w*wdamp;
end

% Results
[t1,y1] = ode45(@differential,tspan,[0 0 globalbest.position(3) globalbest.position(4)...
    1 globalbest.position(6)]);

%Plot V vs Distance
figure(1);
plot(t(:,1),y(:,1),'-k');
xlabel('Distance(y)')
ylabel('Transverse Velocity v(y)')
title('Transverse Velocity Profile')

%plot Derivative of transver velocity
figure(2);
plot(t(:,1),y(:,2),'-k');
xlabel('Distance(y)')
ylabel('Derivative of Transverse Velocity v(y)')
title('Derivative of Transverse Velocity Profile')


disp('Optimum Position');
disp(globalbest.position(3));
disp(globalbest.position(4));
disp(globalbest.position(6));
