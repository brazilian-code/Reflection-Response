% backwardsRepeatedDielectric.m - Reflection response of a multilayer dielectric structure
% 
% Rewrite of repeatedDielectric by using another method to derive
% equations
% 
% 
%          na | n1 | n2 | ... | nM | nb
% left medium | L1 | L2 | ... | LM | right medium 
%   interface 1    2    3     M   M+1
% 
% [Gamma, Z] = backwardsRepeatedDielectric(n,L,lambda);
% 
% 
% n      = array of refractive indices
% L      = vector of optical lengths of layers, in units of lambda_0
% lambda = vector of free-space wavelengths at which to evaluate the reflection response
% 
% n      = array of refractive indices
% L      = vector of optical lengths of layers, in units of lambda_0
% lambda = vector of free-space wavelengths at which to evaluate the reflection response
% 
% Gamma  = reflection response at interface-1 into left medium evaluated at lambda 
% Z      = transverse wave impedance at interface-1 in units of eta_a (left medium)
% 


function [Gamma,Z] = backwardsRepeatedDielectric(n,L,lambda)
if nargin == 0, help backwardsRepeatedDielectric; return; end

M = size(n)-2;

if M==0, L=[]; end

ratio = [];

%{
for i=M:-2:1,         % Loop to go backwards from 
    if i => 2,
        ratio(i) = n(i)/n(i-1);
    else,
       ratio(i) = n()  
    end
    
end
%}


