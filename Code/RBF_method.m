function s = RBF_method(xpts,phi,xfine,f)

    % Defining the matrix A
    for i = 1:length(xpts)
        for j = 1:length(xpts)
            A(i,j) = phi(xpts(i), xpts(j));
        end
    end

    % Solving for the coefficients
    f_vec = f(xpts);
    Lam = A\f_vec;

    % Calculating s
    for j = 1:length(xfine)
        s(j) = 0;
        for k = 1:length(xpts)
            s(j) = s(j) + Lam(k)*phi(xfine(j), xpts(k));
        end
    end
    
end