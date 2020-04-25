% corre el AG para ajustar un delta_phase

%clear all
%close all
load('datitos.mat')
%load('delta_phase_emp.mat');
troncho= [];
for i = 1:size(exp1.troncho,2)
    troncho(i) = exp1.troncho(i);
end

alpha = [2.3, 2.3];
omega = [2, 4]*2*pi;
% defino cosas para el AG

Cfgpob = 10;
Cfggens = 100;
Tmax = 10;

C = [3,45];
phi = [0+rand(1), 0.6+rand(1)];

out=delta_phase_genetic(alpha, C, phi, omega, Tmax,delta_phase_emp, tronch_corto, Cfgpob, Cfggens);


delta_phase_sim_fit=plot_optimum(out.solution, C,phi, tronch_corto, delta_phase_emp, alpha, Tmax, omega)