import nimquant/normal

assert normalCumulative(0.0, CumNormApprox.cnErf) == 0.5
assert normalCumulative(0.0, CumNormApprox.cnWest) == 0.5
assert normalCumulative(0.0, CumNormApprox.cnSimple) == 0.5