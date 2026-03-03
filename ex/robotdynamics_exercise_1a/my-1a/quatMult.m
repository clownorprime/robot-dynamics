function q_AC = quatMult(q_AB,q_BC)
  % Input: two quaternions to be multiplied
  % Output: output of the multiplication
  
  % PLACEHOLDER FOR OUTPUT -> REPLACE WITH SOLUTION
  q1 = q_AB;
  q2 = q_BC;
  q_AC = zeros(4,1);
  q_AC = [
            q1(1) * q2(1) - q1(2) * q2(2) - q1(3) * q2(3) - q1(4) * q2(4);
            q1(2) * q2(1) + q1(1) * q2(2) - q1(4) * q2(3) + q1(3) * q2(4);
            q1(3) * q2(1) + q1(4) * q2(2) + q1(1) * q2(3) - q1(2) * q2(4);
            q1(4) * q2(1) - q1(3) * q2(2) + q1(2) * q2(3) + q1(1) * q2(4);
        ];
end

