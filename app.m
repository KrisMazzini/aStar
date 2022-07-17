clear; close all; clc;

lines = 8;
cols = 8;

map = ones(lines, cols);
plotMap(lines, cols);

map = addObstacles(map);
[xInit, yInit, map] = addInitialPosition(map);
[xGoal, yGoal, map] = addFinalPosition(map);

xCurr = xInit;
yCurr = yInit;

xNeigh = xInit;
yNeigh = yInit;

init2currCost = cost(xInit, yInit, xCurr, yCurr);
curr2neighCost = cost(xCurr, yCurr, xNeigh, yNeigh);

gCost = init2currCost + curr2neighCost;
hCost = cost(xGoal, yGoal, xNeigh, yNeigh);

minFunction = gCost + hCost;

hold on;
if lines < 11 && cols < 11
    text(xNeigh - 0.25, yNeigh - 0.25, sprintf("%.2f", minFunction))
end
hold off;

openCells = [0, xCurr, yCurr, xNeigh, yNeigh, init2currCost, minFunction];

[yObstacles, xObstacles] = find(map == -1);
closeCells = [xObstacles, yObstacles];
closeCells = [closeCells; [xCurr, yCurr]];