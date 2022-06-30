function f = logistic(t, t0, L, k)
% The logistic function logistic(t, t0, L, k)
% t is time and t0 marks the midpoint
% L is the limiting maximum value of the sigmoidal curve,
% and k is the steepness.
f = L ./ (1 + exp(-k*(t-t0)));
end