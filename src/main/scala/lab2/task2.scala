package lab2
import chisel3._

import chisel3.util._
class MuxLookup1 extends Module {
val io = IO ( new Bundle {
val in0 = Input ( Bool () )
val in1 = Input ( Bool () )
val in2 = Input ( Bool () )
val in3 = Input ( Bool () )
val in4 = Input ( Bool () )
val in5 = Input ( Bool () )
val in6 = Input ( Bool () )
val in7 = Input ( Bool () )
val sel = Input ( UInt (3.W) )
//val sel1 = Input ( Bool() )
val out = Output ( Bool () )
val out1 = Output(Bool())
val out2 = Output(Bool())
})
io.out := MuxLookup ( io.sel(2), false .B , Array (
    (0. U) -> io.out1,(1. U ) -> io.out2))

io.out1 := MuxLookup( io.sel(1,0), false .B , Array (
        (0. U ) ->io . in0 ,
        (1. U ) ->io . in1 ,
        (2. U ) ->io . in2 ,
        (3. U ) ->io . in3 
    ))

io.out2 := MuxLookup(  io.sel(1,0), false .B , Array (
        (0. U ) ->io . in4 ,
        (1. U ) ->io . in5 ,
        (2. U ) ->io . in6 ,
        (3. U ) ->io . in7 ))
}
