;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Mux_2to1 : 
  module Mux_2to1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in_A : UInt<32>, flip in_B : UInt<32>, flip select : UInt<1>, out : UInt}
    
    node _io_out_T = not(io.select) @[ex1.scala 14:24]
    node _io_out_T_1 = and(io.in_A, _io_out_T) @[ex1.scala 14:21]
    node _io_out_T_2 = and(io.in_B, io.select) @[ex1.scala 14:46]
    node _io_out_T_3 = or(_io_out_T_1, _io_out_T_2) @[ex1.scala 14:36]
    io.out <= _io_out_T_3 @[ex1.scala 14:10]
    
