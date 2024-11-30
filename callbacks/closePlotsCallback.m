function closePlotsCallback(figs)
    fields = fieldnames(figs);
    for i = 1:numel(fields)
        if isvalid(figs.(fields{i}))
            close(figs.(fields{i}));
        end
    end
end
