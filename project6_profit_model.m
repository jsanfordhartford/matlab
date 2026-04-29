clear;
clc;
close all;

%% Step 1: Define parameters

% Label: price per unit
p = 20;

% Label: cost parameters
a = 0.05;
b = 2;
c = 50;

%% Step 2: Define production values

x = 0:1:80;

% Label: Revenue function R(x) = p*x
R = p .* x;

% Label: Cost function C(x) = a*x^2 + b*x + c
C = a .* x.^2 + b .* x + c;

% Label: Profit function P(x) = R(x) - C(x)
P = R - C;

%% Step 3: Plot all three

figure;
plot(x, R, 'LineWidth', 2);
hold on;
plot(x, C, 'LineWidth', 2);
plot(x, P, 'LineWidth', 2);
grid on;

xlabel('Units Produced (x)');
ylabel('Dollars');
title('Revenue, Cost, and Profit');

legend('Revenue R(x)', 'Cost C(x)', 'Profit P(x)');

%% Step 4: Find maximum profit

[maxProfit, indexMax] = max(P);
xMaxProfit = x(indexMax);

%% Step 5: Find break-even points (P(x) ≈ 0)

tolerance = 1; % allows approximate zero
breakEvenIndices = find(abs(P) < tolerance);
breakEvenPoints = x(breakEvenIndices);

%% Display results

disp("Maximum profit:");
disp(maxProfit);

disp("Production level for max profit:");
disp(xMaxProfit);

disp("Break-even production levels (approx):");
disp(breakEvenPoints);

%% Interpretation

disp("Interpretation:");
disp("Profit is maximized at the production level where P(x) is highest.");
disp("Break-even points occur where revenue equals cost.");
disp("Producing too little or too much can reduce profit.");

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
