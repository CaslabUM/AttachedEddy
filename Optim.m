
% Main file to run optimization for square hairpin packets
% Optimizes circulation strength of each hairpin
% Written by Karthik Duraisamy

options = optimoptions('fminunc','Display','iter','PlotFcns',@optimplotfval);

x0=[1 0 0 0 0 0] % inital strength of each hairpin
x=fminunc('AttachedEddy',x0,options)
