package lab2
// package practice
import org.scalatest._
import chiseltest._
import chisel3._

class ex3test extends FreeSpec with ChiselScalatestTester{
    "some test" in {
        test(new mux_onehot_4to1){ c=>
        c.io.in0.poke(0.U)
        c.io.in1.poke(0.U)
        c.io.in2.poke(65537.U)
        c.io.in3.poke(0.U)
        c.io.sel.poke("b0100".U)
        //c.io.sel1.poke(1.B)
        c.clock.step(4)
        
}}
}