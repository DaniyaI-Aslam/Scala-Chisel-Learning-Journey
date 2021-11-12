circuit ALU :
  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_in_A : UInt<32>
    input io_in_B : UInt<32>
    input io_alu_Op : UInt<4>
    output io_out : UInt<32>
    output io_sum : UInt<32>
    input io_mem_write : UInt<1>
    input io_mem_to_reg : UInt<1>
    input io_branch : UInt<1>

    node _sum_T = bits(io_alu_Op, 3, 3) @[ex1.scala 25:36]
    node _sum_T_1 = sub(UInt<1>("h0"), io_in_B) @[ex1.scala 25:42]
    node _sum_T_2 = tail(_sum_T_1, 1) @[ex1.scala 25:42]
    node _sum_T_3 = mux(_sum_T, _sum_T_2, io_in_B) @[ex1.scala 25:24]
    node _sum_T_4 = add(io_in_A, _sum_T_3) @[ex1.scala 25:19]
    node sum = tail(_sum_T_4, 1) @[ex1.scala 25:19]
    node andd = and(io_in_A, io_in_B) @[ex1.scala 27:20]
    node orr = or(io_in_A, io_in_B) @[ex1.scala 28:19]
    node xorr = xor(io_in_A, io_in_B) @[ex1.scala 29:20]
    node _slll_T = bits(io_in_B, 4, 0) @[ex1.scala 30:30]
    node slll = dshl(io_in_A, _slll_T) @[ex1.scala 30:20]
    node sltt = lt(io_in_A, io_in_B) @[ex1.scala 31:20]
    node _sr_T = bits(io_in_B, 4, 0) @[ex1.scala 32:28]
    node sr = dshr(io_in_A, _sr_T) @[ex1.scala 32:18]
    node BEQ = eq(io_in_A, io_in_B) @[ex1.scala 35:19]
    node b_bGE = gt(io_in_A, io_in_B) @[ex1.scala 36:21]
    node BGE = or(b_bGE, BEQ) @[ex1.scala 37:17]
    node BNE = not(BEQ) @[ex1.scala 38:11]
    node _io_out_T = mux(io_branch, BGE, andd) @[ex1.scala 41:14]
    node _T = bits(io_alu_Op, 2, 0) @[ex1.scala 42:19]
    node _T_1 = eq(UInt<1>("h0"), _T) @[Conditional.scala 37:30]
    node _io_out_T_1 = mux(io_branch, BEQ, io_sum) @[ex1.scala 44:22]
    node _T_2 = eq(UInt<1>("h1"), _T) @[Conditional.scala 37:30]
    node _io_out_T_2 = mux(io_branch, BNE, slll) @[ex1.scala 48:22]
    node _T_3 = eq(UInt<2>("h2"), _T) @[Conditional.scala 37:30]
    node _io_out_T_3 = add(io_in_A, io_in_B) @[ex1.scala 53:42]
    node _io_out_T_4 = tail(_io_out_T_3, 1) @[ex1.scala 53:42]
    node _io_out_T_5 = add(io_in_A, io_in_B) @[ex1.scala 53:76]
    node _io_out_T_6 = tail(_io_out_T_5, 1) @[ex1.scala 53:76]
    node _io_out_T_7 = mux(io_mem_to_reg, _io_out_T_6, sltt) @[ex1.scala 53:55]
    node _io_out_T_8 = mux(io_mem_write, _io_out_T_4, _io_out_T_7) @[ex1.scala 53:22]
    node _T_4 = eq(UInt<2>("h3"), _T) @[Conditional.scala 37:30]
    node _T_5 = eq(UInt<3>("h4"), _T) @[Conditional.scala 37:30]
    node _io_out_T_9 = mux(io_branch, sltt, xorr) @[ex1.scala 60:22]
    node _T_6 = eq(UInt<3>("h5"), _T) @[Conditional.scala 37:30]
    node _io_out_T_10 = mux(io_branch, BGE, sr) @[ex1.scala 63:22]
    node _T_7 = eq(UInt<3>("h6"), _T) @[Conditional.scala 37:30]
    node _io_out_T_11 = mux(io_branch, sltt, orr) @[ex1.scala 68:22]
    node _GEN_0 = mux(_T_7, _io_out_T_11, _io_out_T) @[Conditional.scala 39:67 ex1.scala 68:16 ex1.scala 41:8]
    node _GEN_1 = mux(_T_6, _io_out_T_10, _GEN_0) @[Conditional.scala 39:67 ex1.scala 63:16]
    node _GEN_2 = mux(_T_5, _io_out_T_9, _GEN_1) @[Conditional.scala 39:67 ex1.scala 60:16]
    node _GEN_3 = mux(_T_4, sltt, _GEN_2) @[Conditional.scala 39:67 ex1.scala 56:16]
    node _GEN_4 = mux(_T_3, _io_out_T_8, _GEN_3) @[Conditional.scala 39:67 ex1.scala 53:16]
    node _GEN_5 = mux(_T_2, _io_out_T_2, _GEN_4) @[Conditional.scala 39:67 ex1.scala 48:16]
    node _GEN_6 = mux(_T_1, _io_out_T_1, _GEN_5) @[Conditional.scala 40:58 ex1.scala 44:16]
    io_out <= bits(_GEN_6, 31, 0)
    io_sum <= sum @[ex1.scala 40:8]
