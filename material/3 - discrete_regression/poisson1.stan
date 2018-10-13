data {
  int<lower=0> M;
  int<lower=0> N;
  matrix[M,N] X;
  int y[N];
}

parameters {
  vector[M] beta; // slopes
  real alpha; // intercept
}

model {
  // prior model
  beta ~ normal(0, 10);
  alpha ~ normal(0, 10);
  y ~ poisson_log(X'*beta + alpha);
}

generated quantities {
    real y_ppc[N];
    for (n in 1:N){
      y_ppc[n] = poisson_log_rng(X[1:M, n]' * beta + alpha);
    }
}



