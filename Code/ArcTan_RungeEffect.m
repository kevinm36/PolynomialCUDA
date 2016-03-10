clear all
close all
clc

fontsize = 30; 
% Calculating Chebyshev approximation to the true solution
% --------------------------------------------------------
    x = chebfun('x');
    p_true = atan(20*x);
    
% Setting up basics for RBF method
% --------------------------------
    epsilon = 2;
    phi = @(x1,x2) sqrt(1 + (epsilon.*abs(x1-x2)).^2);
    xfine = linspace(-1,1,1000);
    f = @(x) atan(20.*x);

% RBF method from n equispaced points
% ----------------------------------
    n = 14;
    xpts = linspace(-1,1,n)';
    s = RBF_method(xpts,phi,xfine,f);
    s_points = RBF_method(xpts,phi,xpts,f);

    fig = figure;
    plot(xfine,s, 'LineWidth', 2)
    hold on
    plot(xpts,s_points,'o', 'LineWidth', 2)
    plot(p_true,'k', 'LineWidth', 2)
    set(gca,'FontSize',fontsize)
    filename = sprintf('Images/Atan_equi14.jpg',n);
    saveas(fig,filename)

    % Adding two nodes near the middle
    mid = xpts(end/2)/2;
    xpts = [xpts(1:end/2); mid; -mid; xpts(end/2 + 1:end)];
    s = RBF_method(xpts,phi,xfine,f);
    s_points = RBF_method(xpts,phi,xpts,f);

    fig = figure;
    plot(xfine,s, 'LineWidth', 2)
    hold on
    plot(xpts,s_points,'o', 'LineWidth', 2)
    plot(p_true,'k', 'LineWidth', 2)
    set(gca,'FontSize',fontsize)
    filename = sprintf('Images/Atan_equi16.jpg',n);
    saveas(fig,filename)


% RBF method from n Chebyshev points points
% ----------------------------------
    xpts = chebpts(n);
    s = RBF_method(xpts,phi,xfine,f);
    s_points = RBF_method(xpts,phi,xpts,f);

    fig = figure;
    plot(xfine,s, 'LineWidth', 2)
    hold on
    plot(xpts,s_points,'o', 'LineWidth', 2)
    plot(p_true,'k', 'LineWidth', 2)
    set(gca,'FontSize',fontsize)
    filename = sprintf('Images/Atan_cheb14.jpg',n);
    saveas(fig,filename)
    
    % Adding two nodes near the middle
    mid = xpts((end)/2)/4;
    xpts = [xpts(1:(end)/2); mid; ...
               -mid; xpts((end)/2 + 1:end)];
    s = RBF_method(xpts,phi,xfine,f);
    s_points = RBF_method(xpts,phi,xpts,f);

    fig = figure;
    plot(xfine,s, 'LineWidth', 2)
    hold on
    plot(xpts,s_points,'o', 'LineWidth', 2)
    plot(p_true,'k', 'LineWidth', 2)
    set(gca,'FontSize',fontsize)
    filename = sprintf('Images/Atan_cheb16.jpg',n);
    saveas(fig,filename)
      