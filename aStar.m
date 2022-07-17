clear; close all; clc;

lines = 8;
cols = 8;

map = ones(lines, cols);
plotMap(lines, cols);

map = addObstacles(map);
map = addInitialPosition(map);
map = addFinalPosition(map);