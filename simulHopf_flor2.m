
function [xs]=simulHopf_flor2(a,C,phi,Tmax,omega)
    % a un vector de 2x1
    % pensado para dos osciladores de hopf
    % w es un vector de (2,1) 
    % C un vector de (2,1)
    % Tmax, tiempo de la simulacion
    
    %paso integracion
    dt = 0.001;
    
    % genera el ruido
    sig = 0.1; %was 0.04
    dsig = sqrt(dt)*sig; % to avoid sqrt(dt) at each time step
    
    %omega = 2*pi*omega;
 
    nNodes=length(a);
    
    % mapea en dos dim los parametros para ir a la forma compleja de la FN
    % de Hopf

  %  a=repmat(a,1,2);
   % F0 = repmat(F0,1,2);
 
    wC = C; % matrizde los acoples si cambias los lugares con los ceros te da que sincronizan o no 
    
  % condiciones iniciales

    xs=zeros(nNodes,Tmax);
    z = 0.1*ones(nNodes,2); % --> x = z(:,1), y = z(:,2)
 
    % para el acople 
    sumC = repmat(sum(wC,2),1,2);

    

     
          nn=1; % termaliza la cosa
        for t=1:dt:1000 %JVS is it really necessary to swing in for 3000secs?
           z(1,1) = z(1,1)+dt*((a(1)-z(1,1).*z(1,1)-z(1,2).*z(2,2)).*z(1,1)-omega(1).*z(1,2)+wC(1)*(z(2,1)*cos(phi(1))-z(2,2)*sin(phi(1))) );
           z(1,2) = z(1,2)+dt*((a(1)-z(1,1).*z(1,1)-z(1,2).*z(2,2)).*z(1,2)+omega(1).*z(1,1)+wC(1)*(z(2,2)*cos(phi(1))+z(2,1)*sin(phi(1))));
           z(2,1) = z(2,1)+dt*((a(2)-z(2,1).*z(2,1)-z(2,2).*z(2,2)).*z(2,1)-omega(2).*z(2,2)+wC(2)*(z(1,1)*cos(phi(2))-z(1,2)*sin(phi(2))));
           z(2,2) = z(2,2)+dt*((a(2)-z(2,1).*z(2,1)-z(2,2).*z(2,2)).*z(2,2)+omega(2).*z(2,1)+wC(2)*(z(1,2)*cos(phi(2))+z(1,1)*sin(phi(2))));
        end
 
        t=1:dt:Tmax;
        
        
          for i=1:length(t) %JVS: was 15000, now faster
           %  z(:,1) = z(:,1)+dt*((a(:,1)-z(:,1).*z(:,1)-z(:,2).*z(:,2)).*z(:,1)-omega(:,1).*z(:,2));
           % z(:,2) = z(:,2)+dt*((a(:,1)-z(:,1).*z(:,1)-z(:,2).*z(:,2)).*z(:,2)+omega(:,1).*z(:,1));
           z(1,1) = z(1,1)+dt*((a(1)-z(1,1).*z(1,1)-z(1,2).*z(2,2)).*z(1,1)-omega(1).*z(1,2)+wC(1)*(z(2,1)*cos(phi(1))-z(2,2)*sin(phi(1))) );
           z(1,2) = z(1,2)+dt*((a(1)-z(1,1).*z(1,1)-z(1,2).*z(2,2)).*z(1,2)+omega(1).*z(1,1)+wC(1)*(z(2,2)*cos(phi(1))+z(2,1)*sin(phi(1))));
           z(2,1) = z(2,1)+dt*((a(2)-z(2,1).*z(2,1)-z(2,2).*z(2,2)).*z(2,1)-omega(2).*z(2,2)+wC(2)*(z(1,1)*cos(phi(2))-z(1,2)*sin(phi(2))));
           z(2,2) = z(2,2)+dt*((a(2)-z(2,1).*z(2,1)-z(2,2).*z(2,2)).*z(2,2)+omega(2).*z(2,1)+wC(2)*(z(1,2)*cos(phi(2))+z(1,1)*sin(phi(2))));
             
             xs(1,i)=z(1,1);
             xs(2,i)=z(2,1);
        
        
        end
        
