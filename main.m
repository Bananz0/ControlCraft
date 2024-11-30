% main.m - Main entry point for the ControlCraft GUI
function main()
    % Add paths for utilities, callbacks, and templates
    addpath(genpath('utils'));
    addpath(genpath('callbacks'));
    addpath(genpath('templates'));

    % Launch GUI
    layoutTemplate();
end
