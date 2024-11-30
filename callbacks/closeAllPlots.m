function closeAllPlots()
    % This function closes all open plot figures except the main GUI
    % Get handles to all figures
    figs = findall(0, 'Type', 'figure');
    % Close all figures except those with Tag 'MainGUI' (you can set this tag)
    for i = 1:length(figs)
        fig = figs(i);
        if ~strcmp(get(fig, 'Tag'), 'MainGUI')
            close(fig);
        end
    end
end
