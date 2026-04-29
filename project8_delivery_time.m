clear;
clc;
close all;

%% Step 1: Define model parameters

% Label: average delivery speed (miles per minute)
% Example: 30 mph = 0.5 miles per minute
speed = 0.5;

% Label: slope m = time per mile
m = 1 / speed;

% Label: fixed handling time (minutes)
b = 10;

%% Step 2: Distance values

d = 0:1:40;

% Label: time model T(d) = m*d + b
T = m .* d + b;

%% Step 3: Create interpretation labels

labels = strings(size(d));

for i = 1:length(d)
    if T(i) < 30
        labels(i) = "short";
    elseif T(i) < 60
        labels(i) = "medium";
    else
        labels(i) = "long";
    end
end

%% Step 4: Create table

deliveryTable = table(d', T', labels', ...
    'VariableNames', {'Distance_miles', 'Time_minutes', 'Category'});

disp(deliveryTable);

%% Step 5: Plot

figure;
plot(d, T, 'LineWidth', 2);
grid on;

xlabel('Distance (miles)');
ylabel('Time (minutes)');
title('Delivery Time vs Distance');

%% Interpretation

disp("Interpretation:");
disp("The slope m represents time added per mile traveled.");
disp("The intercept b represents fixed handling time.");
disp("Longer distances increase delivery time linearly.");

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
