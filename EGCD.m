function [ c,c1,c2 ] = EGCD( a,b )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

c = a;
d = b;
c1 = 1;
c2 = 0;
d1 = 0;
d2 = 1;

while d ~= 0
    q = floor(c/d);
    
    r = c - q*d;
    c = d;
    d = r;
    
    r1 = c1 - q*d1;
    c1 = d1;
    d1=r1;
    
    r2 = c2 - q*d2;
    c2 = d2;
    d2 = r2;
    
    
   
    
end


end

