;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit My_Queue : 
  module Queue : 
    input clock : Clock
    input reset : Reset
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, count : UInt<2>}
    
    cmem ram : UInt<8>[2] @[Decoupled.scala 218:16]
    reg value : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Counter.scala 60:40]
    reg value_1 : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Counter.scala 60:40]
    reg maybe_full : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Decoupled.scala 221:27]
    node ptr_match = eq(value, value_1) @[Decoupled.scala 223:33]
    node _empty_T = eq(maybe_full, UInt<1>("h00")) @[Decoupled.scala 224:28]
    node empty = and(ptr_match, _empty_T) @[Decoupled.scala 224:25]
    node full = and(ptr_match, maybe_full) @[Decoupled.scala 225:24]
    node _do_enq_T = and(io.enq.ready, io.enq.valid) @[Decoupled.scala 40:37]
    wire do_enq : UInt<1>
    do_enq <= _do_enq_T
    node _do_deq_T = and(io.deq.ready, io.deq.valid) @[Decoupled.scala 40:37]
    wire do_deq : UInt<1>
    do_deq <= _do_deq_T
    when do_enq : @[Decoupled.scala 229:17]
      infer mport MPORT = ram[value], clock @[Decoupled.scala 230:8]
      MPORT <= io.enq.bits @[Decoupled.scala 230:24]
      node wrap = eq(value, UInt<1>("h01")) @[Counter.scala 72:24]
      node _value_T = add(value, UInt<1>("h01")) @[Counter.scala 76:24]
      node _value_T_1 = tail(_value_T, 1) @[Counter.scala 76:24]
      value <= _value_T_1 @[Counter.scala 76:15]
      skip @[Decoupled.scala 229:17]
    when do_deq : @[Decoupled.scala 233:17]
      node wrap_1 = eq(value_1, UInt<1>("h01")) @[Counter.scala 72:24]
      node _value_T_2 = add(value_1, UInt<1>("h01")) @[Counter.scala 76:24]
      node _value_T_3 = tail(_value_T_2, 1) @[Counter.scala 76:24]
      value_1 <= _value_T_3 @[Counter.scala 76:15]
      skip @[Decoupled.scala 233:17]
    node _T = neq(do_enq, do_deq) @[Decoupled.scala 236:16]
    when _T : @[Decoupled.scala 236:28]
      maybe_full <= do_enq @[Decoupled.scala 237:16]
      skip @[Decoupled.scala 236:28]
    node _io_deq_valid_T = eq(empty, UInt<1>("h00")) @[Decoupled.scala 240:19]
    io.deq.valid <= _io_deq_valid_T @[Decoupled.scala 240:16]
    node _io_enq_ready_T = eq(full, UInt<1>("h00")) @[Decoupled.scala 241:19]
    io.enq.ready <= _io_enq_ready_T @[Decoupled.scala 241:16]
    infer mport io_deq_bits_MPORT = ram[value_1], clock @[Decoupled.scala 242:21]
    io.deq.bits <= io_deq_bits_MPORT @[Decoupled.scala 242:15]
    node _ptr_diff_T = sub(value, value_1) @[Decoupled.scala 257:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[Decoupled.scala 257:32]
    node _io_count_T = and(maybe_full, ptr_match) @[Decoupled.scala 259:32]
    node _io_count_T_1 = mux(_io_count_T, UInt<2>("h02"), UInt<1>("h00")) @[Decoupled.scala 259:20]
    node _io_count_T_2 = or(_io_count_T_1, ptr_diff) @[Decoupled.scala 259:62]
    io.count <= _io_count_T_2 @[Decoupled.scala 259:14]
    
  module Queue_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, count : UInt<2>}
    
    cmem ram : UInt<8>[2] @[Decoupled.scala 218:16]
    reg value : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Counter.scala 60:40]
    reg value_1 : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Counter.scala 60:40]
    reg maybe_full : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Decoupled.scala 221:27]
    node ptr_match = eq(value, value_1) @[Decoupled.scala 223:33]
    node _empty_T = eq(maybe_full, UInt<1>("h00")) @[Decoupled.scala 224:28]
    node empty = and(ptr_match, _empty_T) @[Decoupled.scala 224:25]
    node full = and(ptr_match, maybe_full) @[Decoupled.scala 225:24]
    node _do_enq_T = and(io.enq.ready, io.enq.valid) @[Decoupled.scala 40:37]
    wire do_enq : UInt<1>
    do_enq <= _do_enq_T
    node _do_deq_T = and(io.deq.ready, io.deq.valid) @[Decoupled.scala 40:37]
    wire do_deq : UInt<1>
    do_deq <= _do_deq_T
    when do_enq : @[Decoupled.scala 229:17]
      infer mport MPORT = ram[value], clock @[Decoupled.scala 230:8]
      MPORT <= io.enq.bits @[Decoupled.scala 230:24]
      node wrap = eq(value, UInt<1>("h01")) @[Counter.scala 72:24]
      node _value_T = add(value, UInt<1>("h01")) @[Counter.scala 76:24]
      node _value_T_1 = tail(_value_T, 1) @[Counter.scala 76:24]
      value <= _value_T_1 @[Counter.scala 76:15]
      skip @[Decoupled.scala 229:17]
    when do_deq : @[Decoupled.scala 233:17]
      node wrap_1 = eq(value_1, UInt<1>("h01")) @[Counter.scala 72:24]
      node _value_T_2 = add(value_1, UInt<1>("h01")) @[Counter.scala 76:24]
      node _value_T_3 = tail(_value_T_2, 1) @[Counter.scala 76:24]
      value_1 <= _value_T_3 @[Counter.scala 76:15]
      skip @[Decoupled.scala 233:17]
    node _T = neq(do_enq, do_deq) @[Decoupled.scala 236:16]
    when _T : @[Decoupled.scala 236:28]
      maybe_full <= do_enq @[Decoupled.scala 237:16]
      skip @[Decoupled.scala 236:28]
    node _io_deq_valid_T = eq(empty, UInt<1>("h00")) @[Decoupled.scala 240:19]
    io.deq.valid <= _io_deq_valid_T @[Decoupled.scala 240:16]
    node _io_enq_ready_T = eq(full, UInt<1>("h00")) @[Decoupled.scala 241:19]
    io.enq.ready <= _io_enq_ready_T @[Decoupled.scala 241:16]
    infer mport io_deq_bits_MPORT = ram[value_1], clock @[Decoupled.scala 242:21]
    io.deq.bits <= io_deq_bits_MPORT @[Decoupled.scala 242:15]
    node _ptr_diff_T = sub(value, value_1) @[Decoupled.scala 257:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[Decoupled.scala 257:32]
    node _io_count_T = and(maybe_full, ptr_match) @[Decoupled.scala 259:32]
    node _io_count_T_1 = mux(_io_count_T, UInt<2>("h02"), UInt<1>("h00")) @[Decoupled.scala 259:20]
    node _io_count_T_2 = or(_io_count_T_1, ptr_diff) @[Decoupled.scala 259:62]
    io.count <= _io_count_T_2 @[Decoupled.scala 259:14]
    
  module My_Queue : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in0 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}}
    
    inst queue0 of Queue @[Decoupled.scala 296:21]
    queue0.clock <= clock
    queue0.reset <= reset
    queue0.io.enq.valid <= io.in0.valid @[Decoupled.scala 297:22]
    queue0.io.enq.bits <= io.in0.bits @[Decoupled.scala 298:21]
    io.in0.ready <= queue0.io.enq.ready @[Decoupled.scala 299:17]
    inst queue1 of Queue_1 @[Decoupled.scala 296:21]
    queue1.clock <= clock
    queue1.reset <= reset
    queue1.io.enq.valid <= queue0.io.deq.valid @[Decoupled.scala 297:22]
    queue1.io.enq.bits <= queue0.io.deq.bits @[Decoupled.scala 298:21]
    queue0.io.deq.ready <= queue1.io.enq.ready @[Decoupled.scala 299:17]
    queue0.io.deq.ready <= UInt<1>("h00") @[Decoupled.scala 72:20]
    queue1.io.deq.ready <= UInt<1>("h00") @[Decoupled.scala 72:20]
    io.out.bits <= UInt<1>("h00") @[Ex4.scala 16:16]
    io.out.valid <= UInt<1>("h00") @[Ex4.scala 17:17]
    node _T = dshr(io.out.valid, UInt<1>("h01")) @[Ex4.scala 18:18]
    node _T_1 = bits(_T, 0, 0) @[Ex4.scala 18:18]
    node _T_2 = and(queue1.io.deq.valid, io.out.ready) @[Ex4.scala 19:27]
    node _T_3 = eq(UInt<1>("h01"), _T_2) @[Conditional.scala 37:30]
    when _T_3 : @[Conditional.scala 40:58]
      queue1.io.deq.ready <= UInt<1>("h01") @[Decoupled.scala 65:20]
      io.out.valid <= UInt<1>("h01") @[Decoupled.scala 47:20]
      io.out.bits <= queue1.io.deq.bits @[Decoupled.scala 48:19]
      skip @[Conditional.scala 40:58]
    
