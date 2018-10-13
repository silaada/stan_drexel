data{
  int N;
}

generated quantities  {
  // simulate model configuration from prior model
  // prior is half-normal
  // with standard deviation = 6.44787 
  // such that only 1% of the prior probability mass is above lambda = 15
  real<lower=0> lambda = fabs(normal_rng(0, 6.44787));
  
  // simulate data from observational model
  int y[N];
  for (n in 1:N) y[n] = poisson_rng(lambda);
}