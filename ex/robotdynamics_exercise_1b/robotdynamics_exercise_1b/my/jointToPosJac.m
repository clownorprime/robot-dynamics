function J_P = jointToPosJac(q)
  % Input: vector of generalized coordinates (joint angles)
  % Output: Jacobian of the end-effector translation which maps joint
  % velocities to end-effector linear velocities in I frame.

  % Compute the translational jacobian.
  J_P = zeros(3, 6);
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
      I_n_k(:,i) = I_R_k * n_k(:,i);
  end
  r_k_E = zeros(4, 6);
  T_k_E = zeros(6, 4, 4);
  T_k_E(6,:,:) = diag(ones(4,1));
  T_k_E(5,:,:) = jointToTransform56(q) * squeeze(T_k_E(6,:,:));
  T_k_E(4,:,:) = jointToTransform45(q) * squeeze(T_k_E(5,:,:));
  T_k_E(3,:,:) = jointToTransform34(q) * squeeze(T_k_E(4,:,:));
  T_k_E(2,:,:) = jointToTransform23(q) * squeeze(T_k_E(3,:,:));
  T_k_E(1,:,:) = jointToTransform12(q) * squeeze(T_k_E(2,:,:));

  for i = 1 : 6
      r_k_E(:, i) = squeeze(T_k_E(i, 1:4, 4));
      r_k_E(4, i) = 0;
  end

  I_r_k_E = zeros(3, 6);
  for i = 1 : 6
      vector = squeeze(I_T_k(i,:,:)) * r_k_E(:,i);
      I_r_k_E(:,i) = vector(1:3);
  end

  for i = 1 : 6
      J_P(:,i) = cross(I_n_k(:,i), I_r_k_E(:,i));
  end

end
