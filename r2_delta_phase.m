function y= r2_delta_phase(x,alpha, C_ini, phi_ini, Tmax, omega,delta_phase_emp, troncho)


C(1,1) = C_ini(1,1)+x(1,1);
C(1,2) = C_ini(1,2)+x(1,2);
phi(1,1) = phi_ini(1,2)+x(1,3);
phi(1,2) = phi_ini(1,2) +x(1,4);

nn = size(troncho,2);
parfor i =1:nn
    [xs]=simulHopf_flor2(alpha,troncho(i)*C,phi,Tmax,omega);
    delta_phase(i) = compute_delta_phase(xs,0.001);
end

y = sum((delta_phase_emp-delta_phase).^2);