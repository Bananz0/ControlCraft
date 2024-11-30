function closePlots(figHandles)
    figFields = fieldnames(figHandles);
    for i = 1:numel(figFields)
        if isvalid(figHandles.(figFields{i}))
            close(figHandles.(figFields{i}));
        end
    end
end
