circuit Mux_5to1 :
  module Mux_5to1 :
    input clock : Clock
    input reset : UInt<1>
    input io_inp : UInt<32>
    input io_s0 : UInt<3>
    output io_out : UInt<32>

    node _T = bits(io_s0, 2, 2) @[task1.scala 13:21]
    node _T_1 = eq(UInt<1>("h1"), _T) @[task1.scala 13:12]
    node _T_2 = eq(UInt<1>("h1"), io_s0) @[task1.scala 17:19]
    node _T_3 = eq(UInt<2>("h2"), io_s0) @[task1.scala 20:19]
    node _T_4 = eq(UInt<2>("h3"), io_s0) @[task1.scala 23:19]
    node _GEN_0 = mux(_T_4, UInt<5>("h18"), UInt<1>("h0")) @[task1.scala 23:29 task1.scala 24:12 task1.scala 28:8]
    node _GEN_1 = mux(_T_3, UInt<5>("h10"), _GEN_0) @[task1.scala 20:29 task1.scala 21:12]
    node _GEN_2 = mux(_T_2, UInt<4>("h8"), _GEN_1) @[task1.scala 17:29 task1.scala 18:12]
    node _GEN_3 = mux(_T_1, UInt<6>("h20"), _GEN_2) @[task1.scala 13:25 task1.scala 15:12]
    io_out <= _GEN_3
