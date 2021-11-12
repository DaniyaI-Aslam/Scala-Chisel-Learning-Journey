circuit Signed_Counter :
  module Signed_Counter :
    input clock : Clock
    input reset : UInt<1>
    output io_result : UInt<1>

    node _max1_T = dshl(UInt<1>("h1"), UInt<2>("h3")) @[ex1.scala 7:21]
    node _max1_T_1 = sub(_max1_T, UInt<1>("h1")) @[ex1.scala 7:38]
    node max1 = tail(_max1_T_1, 1) @[ex1.scala 7:38]
    node max = asSInt(max1) @[ex1.scala 8:20]
    reg count : SInt<16>, clock with :
      reset => (UInt<1>("h0"), count) @[ex1.scala 9:25]
    node _T = eq(count, max) @[ex1.scala 11:18]
    node _count_T = add(count, asSInt(UInt<2>("h1"))) @[ex1.scala 14:20]
    node _count_T_1 = tail(_count_T, 1) @[ex1.scala 14:20]
    node _count_T_2 = asSInt(_count_T_1) @[ex1.scala 14:20]
    node _GEN_0 = mux(_T, asSInt(UInt<1>("h0")), _count_T_2) @[ex1.scala 11:28 ex1.scala 12:11 ex1.scala 14:11]
    node _io_result_T = dshr(count, UInt<1>("h0")) @[ex1.scala 16:26]
    node _io_result_T_1 = bits(_io_result_T, 0, 0) @[ex1.scala 16:26]
    io_result <= _io_result_T_1 @[ex1.scala 16:17]
    count <= mux(reset, asSInt(UInt<16>("h0")), _GEN_0) @[ex1.scala 9:25 ex1.scala 9:25]
