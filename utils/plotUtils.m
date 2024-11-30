function updatePlotsOnly(sys_cl, figHandles)
    figNames = fieldnames(figHandles);
    for i = 1:numel(figNames)
        createOrUpdateFigure(figHandles.(figNames{i}), figNames{i}, ...
            @(~) eval([lower(figNames{i}), '(sys_cl)']));
    end
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
