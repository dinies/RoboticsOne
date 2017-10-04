function mat = rotationMatrixOz(theta)
%return a 3x3 rotation matrix around z-axis

ct = cos(theta);
st = sin(theta);

mat=[ ct -st 0;...
      st  ct 0;...
       0  0  1];

