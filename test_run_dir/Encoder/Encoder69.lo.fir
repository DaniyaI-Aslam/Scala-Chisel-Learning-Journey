circuit Encoder69 :
  module Encoder69 :
    input clock : Clock
    input reset : UInt<1>
    input io_in0 : UInt<32>
    input io_in1 : UInt<32>
    input io_in2 : UInt<32>
    input io_in3 : UInt<32>
    input io_sel1 : UInt<2>
    output io_out1 : UInt<32>
    output io_out2 : UInt<32>

    node _io_out1_T = bits(io_sel1, 0, 0) @[Mux.scala 29:36]
    node _io_out1_T_1 = bits(io_sel1, 1, 1) @[Mux.scala 29:36]
    node _io_out1_T_2 = mux(_io_out1_T, io_in0, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_out1_T_3 = mux(_io_out1_T_1, io_in1, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_out1_T_4 = or(_io_out1_T_2, _io_out1_T_3) @[Mux.scala 27:72]
    node _io_out2_T = bits(io_sel1, 0, 0) @[Mux.scala 29:36]
    node _io_out2_T_1 = bits(io_sel1, 1, 1) @[Mux.scala 29:36]
    node _io_out2_T_2 = mux(_io_out2_T, io_in2, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_out2_T_3 = mux(_io_out2_T_1, io_in3, UInt<1>("h0")) @[Mux.scala 27:72]
    node _io_out2_T_4 = or(_io_out2_T_2, _io_out2_T_3) @[Mux.scala 27:72]
    node _io_out1_WIRE = _io_out1_T_4 @[Mux.scala 27:72 Mux.scala 27:72]
    node _io_out2_WIRE = _io_out2_T_4 @[Mux.scala 27:72 Mux.scala 27:72]
    io_out1 <= _io_out1_WIRE @[4-to-2encoder.scala 14:9]
    io_out2 <= _io_out2_WIRE @[4-to-2encoder.scala 15:9]
