clear, clc;
xl=0;
xu=2;

i=1;
e(i)=10;

while(e(i)> 0.001)
    xr=(xl-xu)/2;
    
    g_xl= (xl)^4-(3*e^(xl))-1;
    g_xu= (xu)^4-(3*e^(xu))-1;
    g_xr= (xr)^4-(3*e^(xr))-1;
    
    if(g_xl*g_xu<0)
        xu=xr;
        e(i+1)=abs(xr-xl);
    end
    i=i+1;
    
    if(g_xu*g_xr<0)
        xl=xr;
        e(i+1)=abs(xr-xu);
    end
    i=i+1;
    
    if(g_xu*g_xr == 0)
        xr=xr;
        e(i)=i+1;
    end
    
end

tamanio = size(e);
ite = 1:1:tamanio(2);

figure('DefaultAxesFontSize',14)
set(gcf,'color','white')
plot(ite,e,'color',[1  0  0],'linewidth',2)

grid on
hold on
plot(ite,e,'color',[0  0  1], 'LineWidth',2)
xlabel('iterations')
ylabel('error')
legend('error','x')