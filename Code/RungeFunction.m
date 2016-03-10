clear all
close all
clc

nvals = 2:20;

for n = nvals

    % Calculating Chebyshev approximation to the true solution
    % --------------------------------------------------------
      x = chebfun('x');
      p_true = 1./(1 + 25.*(x.^2));

    % Calculating Chebyshev approximation for n points
    % -------------------------------------------
      p_cheb = chebfun(p_true,n);
      
    % Setting up basics for RBF method
    % --------------------------------
      epsilon = 0.8;
      phi = @(x1,x2) sqrt(1 + (epsilon.*abs(x1-x2)).^2);
      f = @(x) 1./(1 + 25.*(x.^2));
      xfine = linspace(-1,1,1000);
    
    % RBF method from n Chebyshev points
    % ----------------------------------
      xpts = chebpts(n);
      s = RBF_method(xpts,phi,xfine,f);
      
    % RBF method from equispaced points
    % ---------------------------------
      xpts_equi = linspace(-1,1,n)';
      s_equi = RBF_method(xpts_equi,phi,xfine,f);

    % Calculating the errors
    % ----------------------
      % Error for Chebyshev approximation for n points
      error_cheb(n) = norm(p_cheb - p_true,inf);
      
      % Error for RBF method from n Chebyshev points
      p = p_true(xfine);
      error_RBF(n) = norm(p-s, inf);
      
      % Error for RBF method from n equi-spaced points
      error_RBF_equi(n) = norm(p-s_equi, inf);

    % Plotting the calculated functions
    % ---------------------------------
      if (n == 5 || n == 11 || n == 17)
          fig = figure;
          plot(p_true,'k--', 'LineWidth', 2)
          hold on
          plot(p_cheb, 'r', 'LineWidth', 2)
          hold on
          plot(xfine,s,'b', 'LineWidth', 2)
          hold on
          plot(xfine,s_equi,'g', 'LineWidth', 2)
          axis([-1 1 -0.2 1.2])
          set(gca,'FontSize',25)
          
          filename = sprintf('Images/Runge_n%d.jpg',n);
          saveas(fig,filename)
      end
  
end

% Plotting errors
% ---------------
fig = figure;
semilogy(nvals, error_cheb(nvals),'r', 'LineWidth', 2)
hold on
semilogy(nvals, error_RBF(nvals),'b', 'LineWidth', 2)
hold on
semilogy(nvals, error_RBF_equi(nvals),'g', 'LineWidth', 2)
set(gca,'FontSize',25)

filename = 'Images/Runge_error.jpg';
saveas(fig,filename)