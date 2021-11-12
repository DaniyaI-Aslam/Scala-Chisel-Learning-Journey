package lab2
import org.scalatest._
import chiseltest._
import chisel3._

class task1test extends FreeSpec with ChiselScalatestTester{
    "some test" in {
        test(new Mux_5to1){ c=>
        c.io.s0.poke("b001".U)
        c.io.inp.poke(1.U)
        c.clock.step(4)
        
}}
}