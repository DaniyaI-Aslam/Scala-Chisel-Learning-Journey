circuit mux_onehot_4to1 :
  module mux_onehot_4to1 :
    input clock : Clock
    input reset : UInt<1>
    input io_in0 : UInt<32>
    input io_in1 : UInt<32>
    input io_in2 : UInt<32>
    input io_in3 : UInt<32>
    input io_sel : UInt<4>
    output io_out1 : UInt<16>
    output io_out2 : UInt<16>
    output io_a : UInt<32>

    node _io_a_T = bits(io_sel, 0, 0) @[Mux.scala 29:36]
    node _io_a_T_1 = bits(io_sel, 1, 1) @[Mux.scala 29:36]
    node _io_a_T_2 = bits(io_sel, 2, 2) @[Mux.scala 29:36]
    node _io_a_T_3 = bits(io_sel, 3, 3) @[Mux.scala 29:36]
    node _io_a_T_4 = mux(_io_a_T, io_in0, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_a_T_5 = mux(_io_a_T_1, io_in1, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_a_T_6 = mux(_io_a_T_2, io_in2, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_a_T_7 = mux(_io_a_T_3, io_in3, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_a_T_8 = or(_io_a_T_4, _io_a_T_5) @[Mux.scala 27:72]
    node _io_a_T_9 = or(_io_a_T_8, _io_a_T_6) @[Mux.scala 27:72]
    node _io_a_T_10 = or(_io_a_T_9, _io_a_T_7) @[Mux.scala 27:72]
    node _io_out1_T = bits(io_a, 15, 0) @[ex3.scala 16:16]
    node _io_out2_T = bits(io_a, 31, 16) @[ex3.scala 17:16]
    node _io_a_WIRE = _io_a_T_10 @[Mux.scala 27:72 Mux.scala 27:72]
    io_out1 <= _io_out1_T @[ex3.scala 16:9]
    io_out2 <= _io_out2_T @[ex3.scala 17:9]
    io_a <= _io_a_WIRE @[ex3.scala 15:6]
