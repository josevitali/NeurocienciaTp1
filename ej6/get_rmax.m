function [ rmax ] = get_rmax( datos )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    rmax = max(max(mean(datos)));
end

