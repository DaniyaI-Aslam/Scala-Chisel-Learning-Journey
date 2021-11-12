;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit mux_onehot_4to1 : 
  module mux_onehot_4to1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in0 : UInt<32>, flip in1 : UInt<32>, flip in2 : UInt<32>, flip in3 : UInt<32>, flip sel : UInt<4>, out1 : UInt<16>, out2 : UInt<16>, a : UInt<32>}
    
    node _io_a_T = bits(io.sel, 0, 0) @[Mux.scala 29:36]
    node _io_a_T_1 = bits(io.sel, 1, 1) @[Mux.scala 29:36]
    node _io_a_T_2 = bits(io.sel, 2, 2) @[Mux.scala 29:36]
    node _io_a_T_3 = bits(io.sel, 3, 3) @[Mux.scala 29:36]
    node _io_a_T_4 = mux(_io_a_T, io.in0, UInt<1>("h00")) @[Mux.scala 27:72]
    node _io_a_T_5 = mux(_io_a_T_1, io.in1, UInt<1>("h00")) @[Mux.scala 27:72]
    node _io_a_T_6 = mux(_io_a_T_2, io.in2, UInt<1>("h00")) @[Mux.scala 27:72]
    node _io_a_T_7 = mux(_io_a_T_3, io.in3, UInt<1>("h00")) @[Mux.scala 27:72]
    node _io_a_T_8 = or(_io_a_T_4, _io_a_T_5) @[Mux.scala 27:72]
    node _io_a_T_9 = or(_io_a_T_8, _io_a_T_6) @[Mux.scala 27:72]
    node _io_a_T_10 = or(_io_a_T_9, _io_a_T_7) @[Mux.scala 27:72]
    wire _io_a_WIRE : UInt<32> @[Mux.scala 27:72]
    _io_a_WIRE <= _io_a_T_10 @[Mux.scala 27:72]
    io.a <= _io_a_WIRE @[ex3.scala 15:6]
    node _io_out1_T = bits(io.a, 15, 0) @[ex3.scala 16:16]
    io.out1 <= _io_out1_T @[ex3.scala 16:9]
    node _io_out2_T = bits(io.a, 31, 16) @[ex3.scala 17:16]
    io.out2 <= _io_out2_T @[ex3.scala 17:9]
    
