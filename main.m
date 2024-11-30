% main.m - Main entry point for the ControlCraft GUI
function main()
    addpath(genpath('utils'));
    addpath(genpath('callbacks'));
    addpath(genpath('templates'));

    % Launch the GUI
    layoutTemplate();
end
