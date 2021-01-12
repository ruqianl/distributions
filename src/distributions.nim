import distributions/rmath

type Distribution = ref object of RootObj
  ## Base distribution type.

type UnivariateDistribution = ref object of Distribution
  ## Univariate distribution type.

type ContinuousUnivariateDistribution = ref object of UnivariateDistribution
  ## Continuous univariate distribution type.

type DiscreteUnivariateDistribution = ref object of UnivariateDistribution
  ## Discrete univariate distribution type.

type Normal* = ref object of ContinuousUnivariateDistribution
  ## Normal distribution.
  mu*: float64 ## `mu` is the mean.
  sig*: float64 ## `sigma` is the standard deviation.

var normal_distribution = Normal(mu: 0.0, sig: 1.0)

proc normal*(mu: float64 = 0.0; sig: float64 = 1.0): Normal =
  normal_distribution.mu = mu
  normal_distribution.sig = sig
  result = normal_distribution

proc pdf*(d: Normal; x: float64): float64 =
  ## Probability density of Normal distribution at `x`.
  result = dnorm(x, d.mu, d.sig, false)

proc logpdf*(d: Normal; x: float64): float64 =
  ## Log probability density of Normal distribution at `x`.
  result = dnorm(x, d.mu, d.sig, true)

proc cdf*(d: Normal; q: float64): float64 =
  ## Cumulative density of Normal distribution at `q`.
  result = pnorm(q, d.mu, d.sig, true, false)

proc quantile*(d: Normal; p: float64): float64 =
  ## Quantile of Normal distribution at `p`.
  result = qnorm(p, d.mu, d.sig, true)

proc rand*(d: Normal): float64 =
  ## Random number from a normal distribution.
  result = rnorm(d.mu, d.sig)

type Uniform* = ref object of ContinuousUnivariateDistribution
  ## Uniform distribution.
  a*: float64 ## `a` is the lower bound.
  b*: float64 ## `b` is the upper bound.

var uniform_distribution = Uniform(a: 0.0, b: 1.0)

proc uniform*(a: float64 = 0.0; b: float64 = 1.0): Uniform =
  uniform_distribution.a = a
  uniform_distribution.b = b
  return uniform_distribution

proc pdf*(d: Uniform; x: float64): float64 =
  ## Probability density of uniform distribution over [a, b] at x.
  result = dunif(x, d.a, d.b, false)

proc logpdf*(d: Uniform; x: float64): float64 =
  ## Log probability density of uniform distribution over [a, b] at x.
  result = dunif(x, d.a, d.b, true)

proc cdf*(d: Uniform; q: float64): float64 =
  ## Cumulative density of uniform distribution over [a, b] at q.
  result = punif(q, d.a, d.b, true, false)

proc quantile*(d: Uniform; p: float64): float64 =
  ## Quantile of uniform distribution over [a, b] at `p`.
  result = qnorm(p, d.a, d.b, true)

proc rand*(d: Uniform): float64 =
  ## Random number from a normal distribution.
  result = runif(d.a, d.b)

type Gamma* = ref object of ContinuousUnivariateDistribution
  ## Normal distribution.
  shape*: float64 ## `shape` is the shape parameter.
  rate*: float64 ## `rate` is the rate parameter.

var gamma_distribution = Gamma(shape: 1.0, rate: 1.0)

proc gamma*(shape: float64; rate: float64 = 1.0): Gamma =
  gamma_distribution.shape = shape
  gamma_distribution.rate = rate
  result = gamma_distribution

proc pdf*(d: Gamma; x: float64): float64 =
  ## Probability density of Gamma distribution at `x`.
  result = dgamma(x, d.shape, d.rate, false)

proc logpdf*(d: Gamma; x: float64): float64 =
  ## Log probability density of Gamma distribution at `x`.
  result = dgamma(x, d.shape, d.rate, true)

proc cdf*(d: Gamma; q: float64): float64 =
  ## Cumulative density of Gamma distribution at `q`.
  result = pgamma(q, d.shape, d.rate, true, false)

proc quantile*(d: Gamma; p: float64): float64 =
  ## Quantile of Gamma distribution at `p`.
  result = qgamma(p, d.shape, d.rate, true)

proc rand*(d: Gamma): float64 =
  ## Random number from a Gamma distribution.
  result = rgamma(d.shape, d.rate)

type Exponential* = ref object of ContinuousUnivariateDistribution
  ## Exponential distribution.
  rate*: float64 ## `rate` is the rate.

var exponential_distribution = Exponential(rate: 1.0)

proc exponential*(rate: float64 = 1.0): Exponential =
  exponential_distribution.rate = rate
  return exponential_distribution

proc pdf*(d: Exponential; x: float64): float64 =
  ## Probability density of exponential distribution at `x`.
  result = dexp(x, d.rate, false)

proc logpdf*(d: Exponential; x: float64): float64 =
  ## Log probability density of exponential distribution at `x`.
  result = dexp(x, d.rate, true)

proc cdf*(d: Exponential; q: float64): float64 =
  ## Cumulative density of exponential distribution at `q`.
  result = pexp(q, d.rate, true, false)

proc quantile*(d: Exponential; p: float64): float64 =
  ## Quantile of exponential distribution at `p`.
  result = qexp(p, d.rate, true)

proc rand*(d: Exponential): float64 =
  ## Random number from an exponential distribution.
  result = rexp(d.rate)

type Chisq* = ref object of ContinuousUnivariateDistribution
  ## Chi squared distribution.
  v*: int ## `v` is the degrees of freedom.

var chisq_distribution = Chisq(v: 1)

proc pdf*(d: Chisq; x: float64): float64 =
  ## Probability density of Chi squared distribution at `x`.
  result = dchisq(x, d.v, false)

proc logpdf*(d: Chisq; x: float64): float64 =
  ## Log probability density of Chi squared distribution at `x`.
  result = dchisq(x, d.v, true)

proc cdf*(d: Chisq; q: float64): float64 =
  ## Cumulative density of Chi squared distribution at `q`.
  result = pchisq(q, d.v, true, false)

proc quantile*(d: Chisq; p: float64): float64 =
  ## Quantile of Chi squared distribution at `p`.
  result = qchisq(p, d.v, true)

proc rand*(d: Chisq): float64 =
  ## Random number from a Chi squared distribution.
  result = rchisq(d.v)
