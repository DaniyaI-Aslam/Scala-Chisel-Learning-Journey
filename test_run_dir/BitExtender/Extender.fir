;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Extender : 
  module Extender : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip opcode : UInt<7>, flip Instruction : SInt<32>, flip PC : SInt<32>, out : SInt<32>}
    
    node _T = eq(io.opcode, UInt<5>("h013")) @[extender.scala 16:20]
    when _T : @[extender.scala 16:29]
      node _io_out_T = bits(io.Instruction, 31, 20) @[extender.scala 17:33]
      node _io_out_T_1 = asSInt(_io_out_T) @[extender.scala 17:41]
      io.out <= _io_out_T_1 @[extender.scala 17:16]
      skip @[extender.scala 16:29]
    else : @[extender.scala 21:34]
      node _T_1 = eq(io.opcode, UInt<7>("h063")) @[extender.scala 21:25]
      when _T_1 : @[extender.scala 21:34]
        node io_out_hi_hi_hi = bits(io.Instruction, 31, 31) @[extender.scala 24:38]
        node io_out_hi_hi_lo = bits(io.Instruction, 7, 7) @[extender.scala 24:57]
        node io_out_hi_lo = bits(io.Instruction, 30, 25) @[extender.scala 24:75]
        node io_out_lo_hi = bits(io.Instruction, 11, 8) @[extender.scala 24:97]
        node io_out_lo = cat(io_out_lo_hi, UInt<1>("h00")) @[Cat.scala 30:58]
        node io_out_hi_hi = cat(io_out_hi_hi_hi, io_out_hi_hi_lo) @[Cat.scala 30:58]
        node io_out_hi = cat(io_out_hi_hi, io_out_hi_lo) @[Cat.scala 30:58]
        node _io_out_T_2 = cat(io_out_hi, io_out_lo) @[Cat.scala 30:58]
        node _io_out_T_3 = asSInt(_io_out_T_2) @[extender.scala 24:110]
        node _io_out_T_4 = add(_io_out_T_3, io.PC) @[extender.scala 24:117]
        node _io_out_T_5 = tail(_io_out_T_4, 1) @[extender.scala 24:117]
        node _io_out_T_6 = asSInt(_io_out_T_5) @[extender.scala 24:117]
        io.out <= _io_out_T_6 @[extender.scala 24:15]
        skip @[extender.scala 21:34]
      else : @[extender.scala 28:34]
        node _T_2 = eq(io.opcode, UInt<6>("h037")) @[extender.scala 28:25]
        when _T_2 : @[extender.scala 28:34]
          node _io_out_T_7 = bits(io.Instruction, 31, 12) @[extender.scala 30:33]
          node _io_out_T_8 = asSInt(_io_out_T_7) @[extender.scala 30:41]
          io.out <= _io_out_T_8 @[extender.scala 30:16]
          skip @[extender.scala 28:34]
        else : @[extender.scala 33:35]
          node _T_3 = eq(io.opcode, UInt<7>("h06f")) @[extender.scala 33:25]
          when _T_3 : @[extender.scala 33:35]
            node io_out_hi_hi_hi_1 = bits(io.Instruction, 31, 31) @[extender.scala 35:40]
            node io_out_hi_hi_lo_1 = bits(io.Instruction, 19, 12) @[extender.scala 35:59]
            node io_out_hi_lo_1 = bits(io.Instruction, 20, 20) @[extender.scala 35:81]
            node io_out_lo_hi_1 = bits(io.Instruction, 30, 21) @[extender.scala 35:100]
            node io_out_lo_1 = cat(io_out_lo_hi_1, UInt<1>("h00")) @[Cat.scala 30:58]
            node io_out_hi_hi_1 = cat(io_out_hi_hi_hi_1, io_out_hi_hi_lo_1) @[Cat.scala 30:58]
            node io_out_hi_1 = cat(io_out_hi_hi_1, io_out_hi_lo_1) @[Cat.scala 30:58]
            node _io_out_T_9 = cat(io_out_hi_1, io_out_lo_1) @[Cat.scala 30:58]
            node _io_out_T_10 = dshl(_io_out_T_9, UInt<4>("h0c")) @[extender.scala 35:114]
            node _io_out_T_11 = asSInt(_io_out_T_10) @[extender.scala 35:123]
            node _io_out_T_12 = add(_io_out_T_11, io.PC) @[extender.scala 35:129]
            node _io_out_T_13 = tail(_io_out_T_12, 1) @[extender.scala 35:129]
            node _io_out_T_14 = asSInt(_io_out_T_13) @[extender.scala 35:129]
            io.out <= _io_out_T_14 @[extender.scala 35:16]
            skip @[extender.scala 33:35]
          else : @[extender.scala 38:34]
            node _T_4 = eq(io.opcode, UInt<5>("h017")) @[extender.scala 38:25]
            when _T_4 : @[extender.scala 38:34]
              node _io_out_T_15 = bits(io.Instruction, 31, 12) @[extender.scala 39:34]
              node _io_out_T_16 = asSInt(_io_out_T_15) @[extender.scala 39:42]
              node _io_out_T_17 = add(_io_out_T_16, io.PC) @[extender.scala 39:49]
              node _io_out_T_18 = tail(_io_out_T_17, 1) @[extender.scala 39:49]
              node _io_out_T_19 = asSInt(_io_out_T_18) @[extender.scala 39:49]
              io.out <= _io_out_T_19 @[extender.scala 39:16]
              skip @[extender.scala 38:34]
            else : @[extender.scala 42:35]
              node _T_5 = eq(io.opcode, UInt<6>("h023")) @[extender.scala 42:25]
              when _T_5 : @[extender.scala 42:35]
                node io_out_hi_2 = bits(io.Instruction, 31, 25) @[extender.scala 44:36]
                node io_out_lo_2 = bits(io.Instruction, 11, 7) @[extender.scala 44:58]
                node _io_out_T_20 = cat(io_out_hi_2, io_out_lo_2) @[Cat.scala 30:58]
                node _io_out_T_21 = asSInt(_io_out_T_20) @[extender.scala 44:66]
                io.out <= _io_out_T_21 @[extender.scala 44:15]
                skip @[extender.scala 42:35]
              else : @[extender.scala 46:15]
                io.out <= asSInt(UInt<1>("h00")) @[extender.scala 47:17]
                skip @[extender.scala 46:15]
    
