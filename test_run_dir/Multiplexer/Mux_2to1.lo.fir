circuit Mux_2to1 :
  module Mux_2to1 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_A : UInt<32>
    input io_in_B : UInt<32>
    input io_select : UInt<1>
    output io_out : UInt<32>

    node _io_out_T = not(io_select) @[ex1.scala 14:24]
    node _io_out_T_1 = and(io_in_A, _io_out_T) @[ex1.scala 14:21]
    node _io_out_T_2 = and(io_in_B, io_select) @[ex1.scala 14:46]
    node _io_out_T_3 = or(_io_out_T_1, _io_out_T_2) @[ex1.scala 14:36]
    io_out <= _io_out_T_3 @[ex1.scala 14:10]
