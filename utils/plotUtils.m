function updatePlotsOnly(sys_cl, figs)
    % Plot Impulse Response
    createOrUpdateFigure(figs.impulse, 'Impulse Response', @() impulse(sys_cl));
    
    % Plot Step Response
    createOrUpdateFigure(figs.step, 'Step Response', @() step(sys_cl));
    
    % Plot Bode Plot
    createOrUpdateFigure(figs.bode, 'Bode Plot', @() bode(sys_cl));
    
    % Plot Root Locus
    createOrUpdateFigure(figs.rlocus, 'Root Locus', @() rlocus(sys_cl));
    
    % Plot Nyquist Plot
    createOrUpdateFigure(figs.nyquist, 'Nyquist Plot', @() nyquist(sys_cl));
    
    % Plot Pole-Zero Map
    createOrUpdateFigure(figs.pzmap, 'Pole-Zero Map', @() pzmap(sys_cl));
end

function createOrUpdateFigure(figHandle, figTitle, plotFunc)
    if isempty(figHandle) || ~isvalid(figHandle)
        figHandle = figure('Name', figTitle);
    else
        figure(figHandle);
    end
    clf(figHandle);
    plotFunc();
    title(figTitle);
    grid on;
end
