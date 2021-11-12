package lab2
import chisel3 . _
import chisel3 . util . _
class mux_onehot_4to1 extends Module {
val io = IO ( new Bundle {
val in0 = Input ( UInt (32. W ) )
val in1 = Input ( UInt (32. W ) )
val in2 = Input ( UInt (32. W ) )
val in3 = Input ( UInt (32. W ) )
val sel = Input ( UInt (4. W ) )
val out1 = Output ( UInt (16. W ) )
val out2 = Output ( UInt (16. W ) )
val a = Output(UInt (32. W ))
})
io.a :=  Mux1H ( io . sel , Seq ( io . in0 , io . in1 , io . in2 , io . in3 ) )
io.out1 := io.a(15,0)
io.out2 := io.a(31,16) 
}