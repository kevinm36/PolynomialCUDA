function [r] = cra_incremental(rvect,mvect)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    k = length(rvect);

    M =mvect(1);
    r = rvect(1); % the residue
    
    for i = 2:k
        [~,M_inv,~] = EGCD(M,mvec(i));
        c = mod(M_inv,m(i));
        rprime = mod(r,m(i));
        s = mod(c*(r(i) - rprime),m(i));
        r = r+s*M;
        M = M*m(i);
        
    end
end

