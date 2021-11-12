package lab2
import chisel3 . _
import chisel3 . util . _
class LM_IO_Interface extends Bundle {
val inp = Input (UInt (32.W))
val s0 = Input ( UInt (3. W ) )
//val s1 = Input ( Bool () )
//val s2 = Input ( Bool () )
val out = Output ( UInt (32. W ) )
}
class Mux_5to1 extends Module {
val io = IO (new LM_IO_Interface )
when("b1".U=== io.s0(2)){
    println("here")
    io.out := 32.U}

.elsewhen("b001".U=== io.s0){
    io.out := 8.U
}
.elsewhen("b010".U=== io.s0){
    io.out := 16.U
}
.elsewhen("b011".U=== io.s0){
    io.out := 24.U
}

.otherwise{
io.out := 0.U}
}

