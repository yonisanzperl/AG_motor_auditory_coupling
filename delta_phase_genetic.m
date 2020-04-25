% el que hace el algoritmo genetico
function [out] = delta_phase_genetic(alpha, C_ini, phi_ini, omega, Tmax,delta_phase_emp, troncho, Cfgpob, Cfggens)

nval = 4 ; % numeros de parametros que va a mover

%crea opciones para el algoritmo genético
%opts = optimoptions('ga','PlotFcn',{@gaplotbestf,@gaplotstopping,@gaplotbestindiv,@gaplotgenealogy},'Display','off');
opts = optimoptions('ga','PopulationSize',Cfgpob,'MaxGeneration',Cfggens,'Display','iter','UseParallel', true);
%opts = optimoptions('ga','PlotFcn',{@gaplotbestf,@gaplotstopping,@gaplotbestindiv,@gaplotgenealogy},'Display','off','UseParallel', true, 'UseVectorized', false);
opts.PopulationSize = Cfgpob;
opts.MaxGenerations = Cfggens;
    
    %limites para los parametros de comp_group para que el algoritmo optimice

lb=[-2,-20,-1.5,-1.5];
ub=[2,20,1.5,1.5];



%la parte del algoritmo genetico posta
 f = @(x)r2_delta_phase(x,alpha, C_ini, phi_ini, Tmax, omega,delta_phase_emp, troncho);                     
 [out.solution,out.fval,out.exitflag,out.output,out.population,out.scores] = ga(f,nval,[],[],[],[],lb,ub,[],opts);

 