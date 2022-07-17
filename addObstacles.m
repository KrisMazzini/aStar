function map = addObstacles(map)
    
    xlabel( ...
        "Choose obstacles position with left mouse button." + ...
        "Select the last one using right mouse button" ...
    );

    uiwait(msgbox( ...
        "Choose obstacles position with left mouse button." + ...
        "Select the last one using right mouse button" ...
    ), 10);

    clickValue = 1;

    while clickValue == 1
        [xObstacle, yObstacle, clickValue] = ginput(1);
        xObstacle = round(xObstacle);
        yObstacle = round(yObstacle);
        map(yObstacle, xObstacle) = -1;
        plot(xObstacle, yObstacle, 'sk', 'MarkerSize', 20, 'LineWidth', 4);
        plot(xObstacle, yObstacle, '*k', 'MarkerSize', 20, 'LineWidth', 4);
    end

end

