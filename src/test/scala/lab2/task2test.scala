package lab2
import org.scalatest._
import chiseltest._
import chisel3._

class task2test extends FreeSpec with ChiselScalatestTester{
    "some test" in {
        test(new MuxLookup1){ c=>
        c.io.in0.poke(true.B)
        c.io.in1.poke(false.B)
        c.io.in2.poke(false.B)
        c.io.in3.poke(false.B)
        c.io.in4.poke(false.B)
        c.io.in5.poke(false.B)
        c.io.in6.poke(false.B)
        c.io.in7.poke(false.B)
        // c.io.in.poke(false.B)
        // c.io.shifter.poke(1.B)
        c.clock.step(4)
        
}}
}