function delta_phase = compute_delta_phase(xs,dt,is_plot);
% si is_plot= 1 hace los plots
    phase(1,:) = unwrap(angle(hilbert(xs(1,:))));
    phase(2,:) = unwrap(angle(hilbert(xs(2,:))));
   fs = 1/dt;
    inst_freq(1,:) = diff(phase(1,:))/(2*pi)*fs ;
    inst_freq(2,:) =  diff(phase(2,:))/(2*pi)*fs ;
    delta_phase(:)=(phase(2,:)-phase(1,:))*180/3.1415;
    if is_plot==1
        figure; subplot(3,1,1);plot(xs(:,:)');subplot(3,1,2);plot(delta_phase(:));
        subplot(3,1,3);plot(inst_freq(:,:)');axis([0 700 0 5])
    end
    diff_delta_phase(:)=diff(delta_phase(400:700));
    desviacion=std(delta_phase(400:700));
    mean_phase=mean(delta_phase(400:700));
    if desviacion <5
        if mean_phase <0.1
            delta_phase = mean_phase+360;
        else
            delta_phase = mean_phase;
        end
    else
        delta_phase = 500;
    end


end
