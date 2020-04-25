% prueba simple

C = [1,14.6];  % con 14.6
phi = [0.1,-2.9]; % con -2.1   levanta perfecto los is high y demas
Tmax = 10
alpha = [2.3, 2.3+(rand(1,nn)-0.5)/10];
omega = [2, 4]*2*pi;
troncho = exp1.troncho(exp1.isHigh==1) ;
troncho = exp1.troncho;
nn = size(troncho,2);
troncho = troncho+(rand(1,nn)-0.5)/10;

for i=1:nn
    %phi2 = -1.2+0.1*i;
    %phi = [0,phi2];
    [xs]=simulHopf_flor2(alpha,troncho(i)*C,troncho(i)*phi,Tmax,omega);
    delta_phase(i) = compute_delta_phase(xs,0.001,0);
    if delta_phase(i) == 500
    isHigh_sim(i) = 0;
    else isHigh_sim(i)=1;
    end
end

%delta_phase
figure; polarhistogram(delta_phase*(pi)/180,24)
figure; stem(isHigh_sim-0.2) ;hold on;stem(exp1.isHigh)