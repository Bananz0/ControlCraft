% main.m - Entry point for the ControlCraft GUI
function main()
    addpath(genpath('utils'));
    addpath(genpath('callbacks'));

    % Initialize GUI
    createControlSystemGUI();
end
