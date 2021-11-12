package lab2
import org.scalatest._
import chiseltest._
import chisel3._

class ex2test extends FreeSpec with ChiselScalatestTester{
    "some test" in {
        test(new MuxLookup){ c=>
        c.io.in0.poke(0.B)
        c.io.in1.poke(0.B)
        c.io.in2.poke(0.B)
        c.io.in3.poke(0.B)
        c.io.in4.poke(0.B)
        c.io.in5.poke(0.B)
        c.io.in6.poke(1.B)
        c.io.in7.poke(0.B)
        c.io.sel.poke("b110".U)
        //c.io.sel1.poke(1.B)
        c.clock.step(4)
        
}}
}