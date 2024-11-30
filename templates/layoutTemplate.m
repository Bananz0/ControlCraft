function layoutTemplate()
    fig = figure('Name', 'ControlCraft', 'NumberTitle', 'off', ...
        'Position', [100, 100, 800, 600]);
    tgroup = uitabgroup('Parent', fig);
    tab1 = uitab('Parent', tgroup, 'Title', 'Model Input');
    tab2 = uitab('Parent', tgroup, 'Title', 'Controller Design');

    % Initialize tabs
    setupModelInputTab(tab1);
    setupControllerDesignTab(tab2);
end
