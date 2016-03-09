function [r] = cra_incremental(rvect,mvect)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    k = length(rvect);

    M =mvect(1);
    r = rvect(1); % the residue
    
    for i = 2:k
        [~,M_inv,~] = EGCD(M,mvect(i));
        c = mod(M_inv,mvect(i));
        rprime = mod(r,mvect(i));
        s = mod(c*(rvect(i) - rprime),mvect(i));
        r = r+s*M;
        M = M*mvect(i);
        
    end
end

