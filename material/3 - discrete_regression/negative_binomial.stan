data {
  int<lower=0> M;
  int<lower=0> N;
  matrix[M,N] X;
  int y[N];
}

parameters {
  real<lower=0> phi;  
  real alpha;  
  vector[M] beta;  
}

model {
  phi ~ cauchy(0, 3);
  beta ~ normal(0, 10);
  alpha ~ normal(0, 10);

  y ~ neg_binomial_2_log(X'*beta + alpha, phi);
}

generated quantities {
    int y_ppc[N];
    for (n in 1:N){
      y_ppc[n] = neg_binomial_2_log_rng(X[1:M, n]' * beta + alpha, phi);
    }
}
