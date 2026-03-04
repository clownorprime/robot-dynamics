function J_R = jointToRotJac(q)
  % Input: vector of generalized coordinates (joint angles)
  % Output: Jacobian of the end-effector orientation which maps joint
  % velocities to end-effector angular velocities in I frame.

  % Compute the rotational jacobian.
  J_R = zeros(3, 6);
  n_k = [
            0 0 1;
            0 1 0;
            0 1 0;
            1 0 0;
            0 1 0;
            1 0 0;
        ]';
  I_T_k = zeros(6, 4, 4);
  I_T_k(1,:,:) = jointToTransform01(q);
  I_T_k(2,:,:) = squeeze(I_T_k(1,:,:)) * jointToTransform12(q);
  I_T_k(3,:,:) = squeeze(I_T_k(2,:,:)) * jointToTransform23(q);
  I_T_k(4,:,:) = squeeze(I_T_k(3,:,:)) * jointToTransform34(q);
  I_T_k(5,:,:) = squeeze(I_T_k(4,:,:)) * jointToTransform45(q);
  I_T_k(6,:,:) = squeeze(I_T_k(5,:,:)) * jointToTransform56(q);
  I_n_k = zeros(3, 6);
  for i = 1 : 6
      I_R_k = squeeze(I_T_k(i,1:3,1:3));
      J_R(:,i) = I_R_k * n_k(:,i);
  end

end
