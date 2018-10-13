transformed data{
  
  int<lower=0> M=3; // number of covariates
  int<lower=0> N=500; // number of observations
  vector[M] beta = [5, -3, 2]'; // true slopes
  real alpha = 10; // true intercept
  real sigma = 1; // true measurement variability
  
}

generated quantities{
  
  matrix[M, N] X; // simulated covariate design matrix
  real y[N]; // simulates variates
  
  for (n in 1:N) {
    real x = uniform_rng(-1,1); // sample a single covariate
    
    // construct covariates
    X[1, n] = x;
    X[2, n] = x*x;
    X[3, n] = x*x*x;
    
    y[n] = normal_rng(X[1:M,n]' * beta + alpha, sigma);
  }
  
}