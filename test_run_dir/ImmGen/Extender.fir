;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Extender : 
  module Extender : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip Instruction : SInt<32>, flip PC : SInt<32>, out : SInt<32>}
    
    node _T = bits(io.Instruction, 6, 0) @[ImmeUnit.scala 16:24]
    node _T_1 = eq(_T, UInt<5>("h013")) @[ImmeUnit.scala 16:30]
    when _T_1 : @[ImmeUnit.scala 16:39]
      node _io_out_T = bits(io.Instruction, 31, 20) @[ImmeUnit.scala 17:33]
      node _io_out_T_1 = asSInt(_io_out_T) @[ImmeUnit.scala 17:41]
      io.out <= _io_out_T_1 @[ImmeUnit.scala 17:16]
      skip @[ImmeUnit.scala 16:39]
    else : @[ImmeUnit.scala 21:44]
      node _T_2 = bits(io.Instruction, 6, 0) @[ImmeUnit.scala 21:29]
      node _T_3 = eq(_T_2, UInt<7>("h063")) @[ImmeUnit.scala 21:35]
      when _T_3 : @[ImmeUnit.scala 21:44]
        node io_out_hi_hi_hi = bits(io.Instruction, 31, 31) @[ImmeUnit.scala 24:38]
        node io_out_hi_hi_lo = bits(io.Instruction, 7, 7) @[ImmeUnit.scala 24:57]
        node io_out_hi_lo = bits(io.Instruction, 30, 25) @[ImmeUnit.scala 24:75]
        node io_out_lo_hi = bits(io.Instruction, 11, 8) @[ImmeUnit.scala 24:97]
        node io_out_lo = cat(io_out_lo_hi, UInt<1>("h00")) @[Cat.scala 30:58]
        node io_out_hi_hi = cat(io_out_hi_hi_hi, io_out_hi_hi_lo) @[Cat.scala 30:58]
        node io_out_hi = cat(io_out_hi_hi, io_out_hi_lo) @[Cat.scala 30:58]
        node _io_out_T_2 = cat(io_out_hi, io_out_lo) @[Cat.scala 30:58]
        node _io_out_T_3 = asSInt(_io_out_T_2) @[ImmeUnit.scala 24:110]
        node _io_out_T_4 = add(_io_out_T_3, io.PC) @[ImmeUnit.scala 24:117]
        node _io_out_T_5 = tail(_io_out_T_4, 1) @[ImmeUnit.scala 24:117]
        node _io_out_T_6 = asSInt(_io_out_T_5) @[ImmeUnit.scala 24:117]
        io.out <= _io_out_T_6 @[ImmeUnit.scala 24:15]
        skip @[ImmeUnit.scala 21:44]
      else : @[ImmeUnit.scala 28:44]
        node _T_4 = bits(io.Instruction, 6, 0) @[ImmeUnit.scala 28:29]
        node _T_5 = eq(_T_4, UInt<6>("h037")) @[ImmeUnit.scala 28:35]
        when _T_5 : @[ImmeUnit.scala 28:44]
          node _io_out_T_7 = bits(io.Instruction, 31, 12) @[ImmeUnit.scala 30:33]
          node _io_out_T_8 = asSInt(_io_out_T_7) @[ImmeUnit.scala 30:41]
          io.out <= _io_out_T_8 @[ImmeUnit.scala 30:16]
          skip @[ImmeUnit.scala 28:44]
        else : @[ImmeUnit.scala 33:45]
          node _T_6 = bits(io.Instruction, 6, 0) @[ImmeUnit.scala 33:29]
          node _T_7 = eq(_T_6, UInt<7>("h06f")) @[ImmeUnit.scala 33:35]
          when _T_7 : @[ImmeUnit.scala 33:45]
            node io_out_hi_hi_hi_1 = bits(io.Instruction, 31, 31) @[ImmeUnit.scala 35:40]
            node io_out_hi_hi_lo_1 = bits(io.Instruction, 19, 12) @[ImmeUnit.scala 35:59]
            node io_out_hi_lo_1 = bits(io.Instruction, 20, 20) @[ImmeUnit.scala 35:81]
            node io_out_lo_hi_1 = bits(io.Instruction, 30, 21) @[ImmeUnit.scala 35:100]
            node io_out_lo_1 = cat(io_out_lo_hi_1, UInt<1>("h00")) @[Cat.scala 30:58]
            node io_out_hi_hi_1 = cat(io_out_hi_hi_hi_1, io_out_hi_hi_lo_1) @[Cat.scala 30:58]
            node io_out_hi_1 = cat(io_out_hi_hi_1, io_out_hi_lo_1) @[Cat.scala 30:58]
            node _io_out_T_9 = cat(io_out_hi_1, io_out_lo_1) @[Cat.scala 30:58]
            node _io_out_T_10 = dshl(_io_out_T_9, UInt<4>("h0c")) @[ImmeUnit.scala 35:114]
            node _io_out_T_11 = asSInt(_io_out_T_10) @[ImmeUnit.scala 35:123]
            node _io_out_T_12 = add(_io_out_T_11, io.PC) @[ImmeUnit.scala 35:129]
            node _io_out_T_13 = tail(_io_out_T_12, 1) @[ImmeUnit.scala 35:129]
            node _io_out_T_14 = asSInt(_io_out_T_13) @[ImmeUnit.scala 35:129]
            io.out <= _io_out_T_14 @[ImmeUnit.scala 35:16]
            skip @[ImmeUnit.scala 33:45]
          else : @[ImmeUnit.scala 38:44]
            node _T_8 = bits(io.Instruction, 6, 0) @[ImmeUnit.scala 38:29]
            node _T_9 = eq(_T_8, UInt<5>("h017")) @[ImmeUnit.scala 38:35]
            when _T_9 : @[ImmeUnit.scala 38:44]
              node _io_out_T_15 = bits(io.Instruction, 31, 12) @[ImmeUnit.scala 39:34]
              node _io_out_T_16 = asSInt(_io_out_T_15) @[ImmeUnit.scala 39:42]
              node _io_out_T_17 = add(_io_out_T_16, io.PC) @[ImmeUnit.scala 39:49]
              node _io_out_T_18 = tail(_io_out_T_17, 1) @[ImmeUnit.scala 39:49]
              node _io_out_T_19 = asSInt(_io_out_T_18) @[ImmeUnit.scala 39:49]
              io.out <= _io_out_T_19 @[ImmeUnit.scala 39:16]
              skip @[ImmeUnit.scala 38:44]
            else : @[ImmeUnit.scala 42:45]
              node _T_10 = bits(io.Instruction, 6, 0) @[ImmeUnit.scala 42:29]
              node _T_11 = eq(_T_10, UInt<6>("h023")) @[ImmeUnit.scala 42:35]
              when _T_11 : @[ImmeUnit.scala 42:45]
                node io_out_hi_2 = bits(io.Instruction, 31, 25) @[ImmeUnit.scala 44:36]
                node io_out_lo_2 = bits(io.Instruction, 11, 7) @[ImmeUnit.scala 44:58]
                node _io_out_T_20 = cat(io_out_hi_2, io_out_lo_2) @[Cat.scala 30:58]
                node _io_out_T_21 = asSInt(_io_out_T_20) @[ImmeUnit.scala 44:66]
                io.out <= _io_out_T_21 @[ImmeUnit.scala 44:15]
                skip @[ImmeUnit.scala 42:45]
              else : @[ImmeUnit.scala 46:15]
                io.out <= asSInt(UInt<1>("h00")) @[ImmeUnit.scala 47:17]
                skip @[ImmeUnit.scala 46:15]
    
