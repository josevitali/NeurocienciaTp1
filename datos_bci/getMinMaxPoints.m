function [up,down] = getMinMaxPoints(data)

  diffData = diff(data);

  neg = diffData < 0;
  pos = diffData > 0;
  nil = diffData == 0;

  up = find(neg(2:end) & (pos(1:end-1) | nil(1:end-1))) + 1;
  down = find(pos(2:end) & (neg(1:end-1) | nil(1:end-1))) + 1 ;

  %up = neg(1:end-1) & (pos(2:end) | nil(2:end));
  %down =  (neg(2:end) | nil(2:end)) & (pos(1:end-1));

end
