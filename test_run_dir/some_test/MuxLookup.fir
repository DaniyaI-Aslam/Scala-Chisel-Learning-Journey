;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit MuxLookup : 
  module MuxLookup : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in0 : UInt<1>, flip in1 : UInt<1>, flip in2 : UInt<1>, flip in3 : UInt<1>, flip in4 : UInt<1>, flip in5 : UInt<1>, flip in6 : UInt<1>, flip in7 : UInt<1>, flip sel : UInt<3>, out : UInt<1>, out1 : UInt<1>, out2 : UInt<1>}
    
    node _io_out_T = bits(io.sel, 2, 2) @[ex2.scala 20:29]
    node _io_out_T_1 = eq(UInt<1>("h01"), _io_out_T) @[Mux.scala 80:60]
    node _io_out_T_2 = mux(_io_out_T_1, io.out2, io.out1) @[Mux.scala 80:57]
    io.out <= _io_out_T_2 @[ex2.scala 20:8]
    node _io_out1_T = bits(io.sel, 1, 0) @[ex2.scala 23:29]
    node _io_out1_T_1 = eq(UInt<1>("h01"), _io_out1_T) @[Mux.scala 80:60]
    node _io_out1_T_2 = mux(_io_out1_T_1, io.in1, io.in0) @[Mux.scala 80:57]
    node _io_out1_T_3 = eq(UInt<2>("h02"), _io_out1_T) @[Mux.scala 80:60]
    node _io_out1_T_4 = mux(_io_out1_T_3, io.in2, _io_out1_T_2) @[Mux.scala 80:57]
    node _io_out1_T_5 = eq(UInt<2>("h03"), _io_out1_T) @[Mux.scala 80:60]
    node _io_out1_T_6 = mux(_io_out1_T_5, io.in3, _io_out1_T_4) @[Mux.scala 80:57]
    io.out1 <= _io_out1_T_6 @[ex2.scala 23:9]
    node _io_out2_T = bits(io.sel, 1, 0) @[ex2.scala 30:30]
    node _io_out2_T_1 = eq(UInt<1>("h01"), _io_out2_T) @[Mux.scala 80:60]
    node _io_out2_T_2 = mux(_io_out2_T_1, io.in5, io.in4) @[Mux.scala 80:57]
    node _io_out2_T_3 = eq(UInt<2>("h02"), _io_out2_T) @[Mux.scala 80:60]
    node _io_out2_T_4 = mux(_io_out2_T_3, io.in6, _io_out2_T_2) @[Mux.scala 80:57]
    node _io_out2_T_5 = eq(UInt<2>("h03"), _io_out2_T) @[Mux.scala 80:60]
    node _io_out2_T_6 = mux(_io_out2_T_5, io.in7, _io_out2_T_4) @[Mux.scala 80:57]
    io.out2 <= _io_out2_T_6 @[ex2.scala 30:9]
    
