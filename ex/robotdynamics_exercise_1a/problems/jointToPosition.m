function I_r_IE = jointToPosition(q)
  % Input: joint angles
  % Output: position of end-effector w.r.t. inertial frame. I_r_IE
  
  % PLACEHOLDER FOR OUTPUT -> REPLACE WITH SOLUTION
  T = jointToTransform01(q) * jointToTransform12(q) * jointToTransform23(q) * jointToTransform34(q) * jointToTransform45(q) * jointToTransform56(q);
  I_r_IE = T(1:3,4);
end
