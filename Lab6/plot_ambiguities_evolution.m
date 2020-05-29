function [fig_nb] = plot_ambiguities_evolution(int_ambiguity_matrix, WL_IF_ambiguity_matrix, all_sats_nb, base_sat_nb, fig_nb)
%% Load parameters
Lab6Params;

%{
figure(fig_nb);
plot(reshape(int_ambiguity_matrix(:,1,:), [7,137])');
legend(string(all_sats_nb(find(all_sats_nb~=base_sat_nb))))
title("Integer ambiguity of double differenced over time for E1 frequency")
xlabel("Epoch")
ylabel("Ambiguity")

fig_nb = fig_nb+1;
figure(fig_nb);
plot(reshape(int_ambiguity_matrix(:,2,:), [7,137])');
legend(string(all_sats_nb(find(all_sats_nb~=base_sat_nb))))
title("Integer ambiguity of double differenced over time for E2 frequency")
xlabel("Epoch")
ylabel("Ambiguity")

fig_nb = fig_nb+1;
%}
figure(fig_nb);
reshaped_matrix(:,1,1) = (reshape(WL_IF_ambiguity_matrix(6,1,:), [1,137])');%.*(F2/c);
plot(reshaped_matrix, 'o');
%plot(reshape(WL_IF_ambiguity_matrix(6,1,:), [1,137])');
%legend(string(all_sats_nb(find(all_sats_nb~=base_sat_nb))))
title("Wide Lane ambiguity evolution")
xlabel("Epoch")
ylabel("Wide Lane ambiguity[m]") % [cycles]

fig_nb = fig_nb+1;

