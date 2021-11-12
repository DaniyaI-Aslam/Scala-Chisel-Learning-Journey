;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Mux_5to1 : 
  module Mux_5to1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inp : UInt<32>, flip s0 : UInt<3>, out : UInt<32>}
    
    node _T = bits(io.s0, 2, 2) @[task1.scala 13:21]
    node _T_1 = eq(UInt<1>("h01"), _T) @[task1.scala 13:12]
    when _T_1 : @[task1.scala 13:25]
      io.out <= UInt<6>("h020") @[task1.scala 15:12]
      skip @[task1.scala 13:25]
    else : @[task1.scala 17:29]
      node _T_2 = eq(UInt<1>("h01"), io.s0) @[task1.scala 17:19]
      when _T_2 : @[task1.scala 17:29]
        io.out <= UInt<4>("h08") @[task1.scala 18:12]
        skip @[task1.scala 17:29]
      else : @[task1.scala 20:29]
        node _T_3 = eq(UInt<2>("h02"), io.s0) @[task1.scala 20:19]
        when _T_3 : @[task1.scala 20:29]
          io.out <= UInt<5>("h010") @[task1.scala 21:12]
          skip @[task1.scala 20:29]
        else : @[task1.scala 23:29]
          node _T_4 = eq(UInt<2>("h03"), io.s0) @[task1.scala 23:19]
          when _T_4 : @[task1.scala 23:29]
            io.out <= UInt<5>("h018") @[task1.scala 24:12]
            skip @[task1.scala 23:29]
          else : @[task1.scala 27:11]
            io.out <= UInt<1>("h00") @[task1.scala 28:8]
            skip @[task1.scala 27:11]
    
