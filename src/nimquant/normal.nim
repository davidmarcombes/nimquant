import std/math
import ./constants

type
  CumNormApprox* = enum
    cnErf
    cnWest
    cnSimple
    cnFast


proc normalCumulative*(x: float, approx: CumNormApprox = cnSimple): float {.noSideEffect.} =
  case approx
    of cnErf:
      # Change of variable and error function c 
      result =  0.5 * erfc(-x * sInvSqrt2);
      # todo add a version with correction for very negatie z

    of cnWest:
      # Better Approximation to cumulative normal functions
      # Graeme West
      let xabs = abs(x)
      if xabs > 37.0:
        result = 0
      else:
        let exponential = exp(-xabs * xabs * 0.5)
        if xabs < 7.07106781186547:
          var build = 3.52624965998911E-02 * xabs + 0.700383064443688
          build = build * xabs + 6.37396220353165
          build = build * xabs + 33.912866078383
          build = build * xabs + 112.079291497871
          build = build * xabs + 221.213596169931
          build = build * xabs + 220.206867912376
          result = exponential * build
          build = 8.83883476483184E-02 * xabs + 1.75566716318264
          build = build * xabs + 16.064177579207
          build = build * xabs + 86.7807322029461
          build = build * xabs + 296.564248779674
          build = build * xabs + 637.333633378831
          build = build * xabs + 793.826512519948
          build = build * xabs + 440.413735824752
          result = result / build
        else:
          var build = xabs + 0.65
          build = xabs + 4 / build
          build = xabs + 3 / build
          build = xabs + 2 / build
          build = xabs + 1 / build
          result = exponential / build / 2.506628274631
      if x > 0: result = 1 - result
    of cnSimple:
      const 
        a0   = 0.00249367200053503304
        a1   =  0.0390976845588484035  
        a2   =  0.0161315329733252248  
        a3   = -0.0133823644533460069  
        a4   = -0.0127223813782122755
        a5   =  0.00383335126264887303 
        a6   =  0.00773672528313526668
        a7   = -8.70779635317295828e-4
        a8   = -0.003963850973605135
        a9   =  1.19314022838340944e-4 
        a10  =  0.00127109764952614092
        b0   =  0.275374741597376782
        b1   =  0.490165080585318424 
        b2   =  0.774368199119538609
        b3   =  1.07925515155856677  
        b4   =  1.31314653831023098
        b5   =  1.37040217682338167  
        b6   =  1.18902982909273333
        b7   =  0.805276408752910567 
        b8   =  0.357524274449531043
        b9   =  0.0166207924969367356
        b10  = -0.119463959964325415
        b11  =  -0.0838864557023001992
        c0   = 3.97886080735226

      let xs = x * sInvSqrt2
      let xsquare = xs * xs
      if xsquare < 700:
        let t = if (xs < 0.0) : c0 / (c0 - xs) else:  c0 / (c0 + xs)
        let u = t - 0.5;
        var y = (((((((((a10 * u + a9) * u + a8) * u + a7) * u + a6) * u + a5) * u + a4) * u + a3) * u + a2) * u + a1) * u + a0
        y = (((((((((((y * u + b11) * u + b10) * u + b9) * u + b8) * u + b7) * u + b6) * u + b5) * u + b4) * u + b3) * u + b2) * u + b1) * u + b0

        y *= 0.5 * t * exp(-xsquare)
        result = if x > 0.0 : 1.0 - y else: y
      else:
        result = if x > 0.0 : 1.0 else: 0.0
    of cnFast:
      result = 1