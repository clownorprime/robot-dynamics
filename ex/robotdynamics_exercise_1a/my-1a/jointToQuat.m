function quat = jointToQuat(q)
  % Input: joint angles
  % Output: quaternion representing the orientation of the end-effector
  % q_IE.
  
  % PLACEHOLDER FOR OUTPUT -> REPLACE WITH SOLUTION
  quat = zeros(4,1);
  T = jointToTransform01(q) * jointToTransform12(q) * jointToTransform23(q) * jointToTransform34(q) * jointToTransform45(q) * jointToTransform56(q);
  R = T(1:3,1:3);
  quat = rotMatToQuat(R);
end