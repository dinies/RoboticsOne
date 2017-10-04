function R=ElementaryRotationMatrix(alpha,index)
    zero=sym('0');
    one=sym('1');
switch index
		case 1
            R = [one zero zero;zero cos(alpha) -sin(alpha);zero sin(alpha) cos(alpha)]
		case 3
            R=[cos(alpha) -sin(alpha) zero; sin(alpha) cos(alpha) zero;zero zero one]
		case 2
            R=[cos(alpha) zero sin(alpha) ; zero one zero;-sin(alpha) zero cos(alpha)]
        otherwise
            fprintf('Index for the rotation must be 1 (x axis), 2 (y axis), 3 (z axis)');
end

 return


