function [ vec_pob,angulo ] = vector_poblacional( n1,n2,n3,n4,c,ras )
%UNTITLED Summary of this function goes here
%      Detailed explanation goes here
    vec_pob = zeros(4,1);
    vec_pob(1,:) =  ras(1)/ get_rmax(n1) * c(1);
    vec_pob(2,:) =    ras(2) /get_rmax(n2) * c(2);
    vec_pob(3,:) =  ras(3) /get_rmax(n3) * c(3);
    vec_pob(4,:) =  ras(4)  /get_rmax(n4)* c(4);
    variable = sum(abs(vec_pob));
    angulo = radtodeg(acos(variable));
end
 
