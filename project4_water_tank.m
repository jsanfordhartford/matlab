clear;
clc;
close all;

% Time values from 0 to 25 minutes
t = 0:1:25;

% Create volume array
V = zeros(size(t));

% Logical indexing for filling phase: 0 to 10 minutes
filling = t >= 0 & t <= 10;
V(filling) = 5 .* t(filling) + 20;

% Logical indexing for draining phase: 10 to 25 minutes
draining = t > 10 & t <= 25;
V(draining) = -3 .* (t(draining) - 10) + 70;

% Plot volume vs time
figure;
plot(t, V, 'LineWidth', 2);
grid on;
xlabel('Time (minutes)');
ylabel('Volume (liters)');
title('Water Tank Volume vs Time');

% Find when tank reaches 50 liters
targetVolume = 50;
timeAt50 = t(V == targetVolume);

% Display time(s) when V = 50
disp("Time(s) when tank reaches 50 liters:");
disp(timeAt50);

% Create table of time and volume
tankTable = table(t', V', 'VariableNames', {'Time_minutes', 'Volume_liters'});

% Display table
disp(tankTable);

% Interpret slopes
disp("Interpretation:");
disp("During the filling phase, the slope is +5, meaning the tank gains 5 liters per minute.");
disp("During the draining phase, the slope is -3, meaning the tank loses 3 liters per minute.");

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
