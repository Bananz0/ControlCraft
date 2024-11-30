function plotCallback(sys, figHandles)
    try
        updatePlotsOnly(sys, figHandles);
    catch ME
        disp(['Error in plotting: ', ME.message]);
    end
end
