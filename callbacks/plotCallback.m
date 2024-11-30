function plotCallback(sys, figs)
    try
        updatePlotsOnly(sys, figs);
    catch ME
        disp(['Error in plotting: ', ME.message]);
    end
end
