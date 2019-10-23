function [dy] = differential(t,y)
%Parameters
phi_ag = 0;
phi_m = 0.74;
delta = 2.5;
ha = 1;
re = 1;
phi = 0; 
rho_p = 6500;
rho_f = 1105.2;


%Function
dy = zeros(6,1);
dy(1)= y(2);
dy(2)=y(3);
dy(3)=y(4);
dy(4)= (ha^2.*y(3)+(re.*((y(2)*y(3))-(y(1)*y(4))).*(1-phi+phi*(rho_p/rho_f))))./(1-(phi_ag/phi_m))^(delta*phi_m);
dy(5)= y(6);
dy(6) = (ha^2.*y(5)+(re.*((y(5)*y(2))-(y(1)*y(6))).*(1-phi+phi*(rho_p/rho_f))))./(1-(phi_ag/phi_m))^(delta*phi_m);
end