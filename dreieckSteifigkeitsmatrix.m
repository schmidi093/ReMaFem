function K = dreieckSteifigkeitsmatrix(E,nu,x)
%DREIECKSTEIFIGKEITSMATRIX
%    K = DREIECKSTEIFIGKEITSMATRIX(E,NU,X_I,X_J,X_K,Y_I,Y_J,Y_K)

%    This function was generated by the Symbolic Math Toolbox version 6.2.
%    03-May-2016 16:37:56
x_i=x(1,1);
x_j=x(2,1);
x_k=x(3,1);
y_i=x(1,2);
y_j=x(2,2);
y_k=x(3,2);

t2 = x_j.^2;
t3 = x_k.^2;
t4 = x_i.*y_j;
t5 = x_k.*y_i;
t6 = x_j.*y_k;
t15 = x_j.*y_i;
t16 = x_i.*y_k;
t17 = x_k.*y_j;
t7 = t4+t5+t6-t15-t16-t17;
t8 = 1.0./t7;
t9 = nu.^2;
t10 = t9-1.0;
t11 = 1.0./t10;
t12 = y_k.^2;
t13 = t12.*2.0;
t14 = x_i.*x_j;
t18 = y_i.*y_j.*2.0;
t19 = y_j.^2;
t20 = t19.*2.0;
t21 = x_i.*x_k;
t22 = x_i.*y_j.*2.0;
t23 = x_j.*y_j;
t24 = x_j-x_k;
t25 = y_j-y_k;
t26 = nu-1.0;
t27 = 1.0./t26;
t28 = E.*t8.*t24.*t25.*t27.*(1.0./4.0);
t29 = x_k.*y_k;
t30 = t3.*2.0;
t31 = y_i.*y_j;
t32 = x_j.*y_i.*2.0;
t33 = x_i.*x_j.*2.0;
t34 = t2.*2.0;
t35 = y_i.*y_k;
t36 = y_i.*y_k.*2.0;
t37 = t4-t16-t17+t29;
t38 = E.*t37.*(1.0./8.0);
t39 = x_k.*y_i.*2.0;
t40 = x_i.*x_k.*2.0;
t41 = x_i.^2;
t42 = y_i.^2;
t43 = t42.*2.0;
t44 = x_i.*y_k.*2.0;
t45 = x_i-x_k;
t46 = y_i-y_k;
t47 = E.*t8.*t27.*t45.*t46.*(1.0./4.0);
t48 = x_i.*y_i;
t49 = t41.*2.0;
t52 = x_j.*x_k;
t56 = y_j.*y_k.*2.0;
t50 = t2-t14-t18+t20+t21+t36-t52-t56;
t51 = E.*t50.*(1.0./4.0);
t53 = t4+t6-t16-t23;
t54 = E.*t53.*(1.0./4.0);
t55 = x_k.*y_j.*2.0;
t57 = t6-t15-t16+t48;
t58 = E.*t57.*(1.0./4.0);
t59 = -t6+t15+t16-t22-t39+t48+t55;
t60 = E.*nu.*t59.*(1.0./4.0);
t61 = t58+t60;
t62 = t5-t15-t17+t23;
t63 = E.*t62.*(1.0./4.0);
t64 = x_j.*y_k.*2.0;
t67 = y_j.*y_k;
t69 = x_j.*x_k.*2.0;
t65 = t19-t31-t33+t34+t35+t40-t67-t69;
t66 = E.*t65.*(1.0./4.0);
t68 = t4+t5-t17-t32-t44+t48+t64;
t70 = x_i-x_j;
t71 = y_i-y_j;
t72 = E.*t8.*t27.*t70.*t71.*(1.0./4.0);
K = reshape([t8.*t11.*(E.*(t2+t3+t13+t20-x_j.*x_k.*2.0-y_j.*y_k.*4.0).*(1.0./8.0)-E.*nu.*(t2+t3-x_j.*x_k.*2.0).*(1.0./8.0)).*-2.0,t28,t8.*t11.*(E.*(t3+t13+t14+t18-t21-t36-x_j.*x_k-y_j.*y_k.*2.0).*(1.0./4.0)-E.*nu.*(t3+t14-t21-x_j.*x_k).*(1.0./4.0)),t8.*t11.*(E.*(t5+t6-t15-t29).*(1.0./8.0)-E.*nu.*(t5+t6-t15+t22+t29-t44-x_k.*y_j.*2.0).*(1.0./8.0)).*2.0,t8.*t11.*(t51-E.*nu.*(t2-t14+t21-t52).*(1.0./4.0)),-t8.*t11.*(t63+E.*nu.*(-t5+t15+t17-t22+t23+t44-t64).*(1.0./4.0)),t28,t8.*t11.*(E.*(t12+t19+t30+t34-x_j.*x_k.*4.0-y_j.*y_k.*2.0).*(1.0./8.0)-E.*nu.*(t12+t19-y_j.*y_k.*2.0).*(1.0./8.0)).*-2.0,t8.*t11.*(t38+E.*nu.*(-t4+t16+t17+t29+t32-t39-x_j.*y_k.*2.0).*(1.0./8.0)).*-2.0,t8.*t11.*(E.*(t12+t30+t31+t33-t35-t40-x_j.*x_k.*2.0-y_j.*y_k).*(1.0./4.0)-E.*nu.*(t12+t31-t35-y_j.*y_k).*(1.0./4.0)),t8.*t11.*(t54-E.*nu.*(t4+t6-t16+t23-t32+t39-t55).*(1.0./4.0)),t8.*t11.*(t66-E.*nu.*(t19-t31+t35-t67).*(1.0./4.0)),t8.*t11.*(E.*(t3+t13+t14+t18-x_i.*x_k-x_j.*x_k-y_i.*y_k.*2.0-y_j.*y_k.*2.0).*(1.0./4.0)-E.*nu.*(t3+t14-x_i.*x_k-x_j.*x_k).*(1.0./4.0)),t8.*t11.*(t38+E.*nu.*(-t4+t16+t17+t29+t32-x_k.*y_i.*2.0-x_j.*y_k.*2.0).*(1.0./8.0)).*-2.0,t8.*t11.*(E.*(t3+t13-t40+t41+t43-y_i.*y_k.*4.0).*(1.0./8.0)-E.*nu.*(t3-t40+t41).*(1.0./8.0)).*-2.0,t47,-t8.*t11.*(E.*(t14+t18+t21+t36-t41-t43-t52-t56).*(1.0./4.0)-E.*nu.*(t14+t21-t41-t52).*(1.0./4.0)),t8.*t11.*(E.*(t4+t5-t17-t48).*(1.0./4.0)-E.*nu.*t68.*(1.0./4.0)),t8.*t11.*(E.*(t5+t6-t15-x_k.*y_k).*(1.0./8.0)-E.*nu.*(t5+t6-t15+t22+t29-x_i.*y_k.*2.0-x_k.*y_j.*2.0).*(1.0./8.0)).*2.0,t8.*t11.*(E.*(t12+t30+t31+t33-x_i.*x_k.*2.0-x_j.*x_k.*2.0-y_i.*y_k-y_j.*y_k).*(1.0./4.0)-E.*nu.*(t12+t31-y_i.*y_k-y_j.*y_k).*(1.0./4.0)),t47,t8.*t11.*(E.*(t12+t30-t36+t42+t49-x_i.*x_k.*4.0).*(1.0./8.0)-E.*nu.*(t12-t36+t42).*(1.0./8.0)).*-2.0,-t8.*t11.*t61,-t8.*t11.*(E.*(t31+t33+t35+t40-t42-t49-t67-t69).*(1.0./4.0)-E.*nu.*(t31+t35-t42-t67).*(1.0./4.0)),t8.*t11.*(t51-E.*nu.*(t2-t14+t21-x_j.*x_k).*(1.0./4.0)),t8.*t11.*(t54-E.*nu.*(t4+t6-t16+t23-t32+t39-x_k.*y_j.*2.0).*(1.0./4.0)),-t8.*t11.*(E.*(t14+t18+t21+t36-t41-t43-x_j.*x_k-y_j.*y_k.*2.0).*(1.0./4.0)-E.*nu.*(t14+t21-t41-x_j.*x_k).*(1.0./4.0)),-t8.*t11.*t61,t8.*t11.*(E.*(t2+t20-t33+t41+t43-y_i.*y_j.*4.0).*(1.0./8.0)-E.*nu.*(t2-t33+t41).*(1.0./8.0)).*-2.0,t72,-t8.*t11.*(t63+E.*nu.*(-t5+t15+t17-t22+t23+t44-x_j.*y_k.*2.0).*(1.0./4.0)),t8.*t11.*(t66-E.*nu.*(t19-t31+t35-y_j.*y_k).*(1.0./4.0)),t8.*t11.*(E.*(t4+t5-t17-x_i.*y_i).*(1.0./4.0)-E.*nu.*t68.*(1.0./4.0)),-t8.*t11.*(E.*(t31+t33+t35+t40-t42-t49-x_j.*x_k.*2.0-y_j.*y_k).*(1.0./4.0)-E.*nu.*(t31+t35-t42-y_j.*y_k).*(1.0./4.0)),t72,t8.*t11.*(E.*(-t18+t19+t34+t42+t49-x_i.*x_j.*4.0).*(1.0./8.0)-E.*nu.*(-t18+t19+t42).*(1.0./8.0)).*-2.0],[6, 6]);
