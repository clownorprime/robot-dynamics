function C_IE = jointToRotMat(q)
  % Input: joint angles
  % Output: rotation matrix which projects a vector defined in the
  % end-effector frame E to the inertial frame I, C_IE.
  
  % PLACEHOLDER FOR OUTPUT -> REPLACE WITH SOLUTION
  C_IE = zeros(3);
  T = jointToTransform01(q) * jointToTransform12(q) * jointToTransform23(q) * jointToTransform34(q) * jointToTransform45(q) * jointToTransform56(q);
  C_IE = T(1:3,1:3);
end