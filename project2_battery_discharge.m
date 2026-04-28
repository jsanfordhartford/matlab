clear;
clc;
close all;

% Time values in hours
t = 0:0.1:10;

% Starting battery energy percentage
startingEnergy = 100;

% Different discharge rates in percent per hour
dischargeRates = [5 8 12];

% Create figure
figure;
hold on;
grid on;

% Store final battery percentages
finalEnergy = zeros(size(dischargeRates));

for i = 1:length(dischargeRates)

    % Energy decreases over time
    energy = startingEnergy - dischargeRates(i) .* t;

    % Battery energy cannot go below 0
    energy(energy < 0) = 0;

    % Save final energy value
    finalEnergy(i) = energy(end);

    % Plot energy vs time
    plot(t, energy, 'LineWidth', 2);
end

xlabel('Time (hours)');
ylabel('Battery Energy (%)');
title('Battery Discharge Model');
legend('5% per hour', '8% per hour', '12% per hour');

% Create results table
resultsTable = table(dischargeRates', finalEnergy', ...
    'VariableNames', {'Discharge_Rate_percent_per_hour', 'Final_Energy_percent'});

disp(resultsTable);

disp("Interpretation:");
disp("A higher discharge rate causes the battery to lose energy faster.");
disp("The 12 percent per hour case reaches a lower battery level than the 5 percent per hour case.");
disp("This means heavier electrical load reduces battery life.");

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
