data {
  int<lower=1> N;
  real<lower=0> sigma;
}

transformed data {
  real mu = 4.5;
  real<lower=0> tau = 3.5;
}

generated quantities {
  vector[N] y;
  
  for (n in 1:N) {
    real theta = normal_rng(mu, tau);
    y[n] = normal_rng(theta, sigma);
  } 
}
