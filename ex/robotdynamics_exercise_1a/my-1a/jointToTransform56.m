function T56 = jointToTransform56(q)
  % Input: joint angles
  % Output: homogeneous transformation Matrix from frame 6 to frame 5. T_56
  
  % PLACEHOLDER FOR OUTPUT -> REPLACE WITH SOLUTION
  T56 = [
            1,      0,          0,          0.072;
            0,      cos(q(6,1)),  -sin(q(6,1)), 0;
            0,      sin(q(6,1)),  cos(q(6,1)),  0; 
            0,      0,              0,      1;
        ];
end
