function layoutTemplate()
    % Create the main figure and tab group
    hFig = figure('Name', 'ControlCraft GUI', 'NumberTitle', 'off', 'Position', [100, 100, 800, 600], 'Tag', 'MainGUI');
    tgroup = uitabgroup('Parent', hFig);

    % Create tabs
    tab1 = uitab('Parent', tgroup, 'Title', 'Model Input');
    tab2 = uitab('Parent', tgroup, 'Title', 'Controller Design');

    % Initialize tabs
    setupModelInputTab(tab1);
    setupControllerDesignTab(tab2);
end
