circuit MuxLookup1 :
  module MuxLookup1 :
    input clock : Clock
    input reset : UInt<1>
    input io_in0 : UInt<1>
    input io_in1 : UInt<1>
    input io_in2 : UInt<1>
    input io_in3 : UInt<1>
    input io_in4 : UInt<1>
    input io_in5 : UInt<1>
    input io_in6 : UInt<1>
    input io_in7 : UInt<1>
    input io_sel : UInt<3>
    output io_out : UInt<1>
    output io_out1 : UInt<1>
    output io_out2 : UInt<1>

    node _io_out_T = bits(io_sel, 2, 2) @[task2.scala 21:29]
    node _io_out_T_1 = eq(UInt<1>("h1"), _io_out_T) @[Mux.scala 80:60]
    node _io_out_T_2 = mux(_io_out_T_1, io_out2, io_out1) @[Mux.scala 80:57]
    node _io_out1_T = bits(io_sel, 1, 0) @[task2.scala 24:29]
    node _io_out1_T_1 = eq(UInt<1>("h1"), _io_out1_T) @[Mux.scala 80:60]
    node _io_out1_T_2 = mux(_io_out1_T_1, io_in1, io_in0) @[Mux.scala 80:57]
    node _io_out1_T_3 = eq(UInt<2>("h2"), _io_out1_T) @[Mux.scala 80:60]
    node _io_out1_T_4 = mux(_io_out1_T_3, io_in2, _io_out1_T_2) @[Mux.scala 80:57]
    node _io_out1_T_5 = eq(UInt<2>("h3"), _io_out1_T) @[Mux.scala 80:60]
    node _io_out1_T_6 = mux(_io_out1_T_5, io_in3, _io_out1_T_4) @[Mux.scala 80:57]
    node _io_out2_T = bits(io_sel, 1, 0) @[task2.scala 31:30]
    node _io_out2_T_1 = eq(UInt<1>("h1"), _io_out2_T) @[Mux.scala 80:60]
    node _io_out2_T_2 = mux(_io_out2_T_1, io_in5, io_in4) @[Mux.scala 80:57]
    node _io_out2_T_3 = eq(UInt<2>("h2"), _io_out2_T) @[Mux.scala 80:60]
    node _io_out2_T_4 = mux(_io_out2_T_3, io_in6, _io_out2_T_2) @[Mux.scala 80:57]
    node _io_out2_T_5 = eq(UInt<2>("h3"), _io_out2_T) @[Mux.scala 80:60]
    node _io_out2_T_6 = mux(_io_out2_T_5, io_in7, _io_out2_T_4) @[Mux.scala 80:57]
    io_out <= _io_out_T_2 @[task2.scala 21:8]
    io_out1 <= _io_out1_T_6 @[task2.scala 24:9]
    io_out2 <= _io_out2_T_6 @[task2.scala 31:9]
