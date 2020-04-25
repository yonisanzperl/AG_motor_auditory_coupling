function delta_phase_sim_fit=plot_optimum(sol,C_ini,phi_ini, troncho, delta_phase_emp,alpha, Tmax, omega);

nn = size(troncho,2);


C = C_ini + sol(1:2);
phi = phi_ini +sol(3:4);

for i =1:nn
    [xs]=simulHopf_flor2(alpha,troncho(i)*C,phi,Tmax,omega);
    delta_phase(i) = compute_delta_phase(xs,0.001);
end

delta_phase_sim_fit = delta_phase;
figure;stem(delta_phase);hold on; stem(delta_phase_emp)