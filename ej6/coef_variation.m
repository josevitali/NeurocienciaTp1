function [ coef_var ] = coef_variation( datos )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    media = mean(mean(datos));
    dsv_std = sqrt(var(mean(datos)));
    coef_var = dsv_std/media;

end

