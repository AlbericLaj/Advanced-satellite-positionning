function multipath_error = compute_multipath_error(settings,discr_total)
    % Locate the closest zero-crossing to the center in the 
    % Discriminator function
    zerocross = diff(sign(discr_total));
    zerocross_idx = find(zerocross~=0);

    N_samples = length(settings.dtau)-1;
    [~, min_pos] = min(abs(zerocross_idx - N_samples/2));
    delay_error = (zerocross_idx(min_pos) - N_samples/2)*settings.delay_step;

    Chip_distance = 3e8/1.023e6;
    multipath_error = delay_error*Chip_distance;

end