clear all
close all
clc

fontsize = 25;

% Calculating Chebyshev approximation to the true solution
% --------------------------------------------------------
    x = chebfun('x');
    p_true = atan(20*x);
    
% Setting up basics for RBF method
% --------------------------------
    epsilon = 20;
    phi = @(x1,x2) sqrt(1 + (epsilon.*abs(x1-x2)).^2);
    xfine = linspace(-1,1,1000);
    f = @(x) atan(20.*x);
    p = p_true(xfine);
    
% RBF method from n points
% ----------------------------------
    xpts = [-0.9; -0.2; -0.1; -0.5; -0.02];
    xpts = [xpts; -xpts];

    s = RBF_method(xpts,phi,xfine,f);
    s_points = RBF_method(xpts,phi,xpts,f);
    fig = figure;
    plot(xfine,s, 'LineWidth', 2)
    hold on
    plot(xpts,s_points,'o', 'LineWidth', 2)
    set(gca,'FontSize',fontsize)
    filename = sprintf('Images/Atan_MQinterp.jpg');
    saveas(fig,filename)
    
    p = p_true(xfine);
    error_RBF = p-s;
    fig = figure;
    plot(xfine, error_RBF,'r', 'LineWidth', 2)
    set(gca,'FontSize',fontsize)
    filename = sprintf('Images/Atan_MQerror.jpg');
    saveas(fig,filename)

% Calculating Chebyshev approximation for n points
% -------------------------------------------
nvals = 2:80;

for n = nvals
    p_cheb = chebfun(p_true,n+1);
    error_cheb(n) = norm(p_true-p_cheb,inf);
end
fig = figure;
semilogy(nvals, error_cheb(nvals), 'LineWidth', 2)
hold on
error_MQ = norm(p-s,inf)*ones(1,length(nvals));
semilogy(nvals,error_MQ, 'r', 'LineWidth', 2)
set(gca,'FontSize',fontsize)
filename = sprintf('Images/Atan_comparison.jpg');
saveas(fig,filename)
    