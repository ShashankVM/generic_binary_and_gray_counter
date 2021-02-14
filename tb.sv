module tb;
  parameter WIDTH = 4;
  
  logic clk,
      reset, 
      mode;
  logic [WIDTH-1:0] q;
   
  binary_ctr #(WIDTH)	u0(.*);
  
  always #10 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);                
    $monitor ("T=%0t out=%b", $time, q);
    clk <= 0;
    reset <= 1;
    mode <= 1;
    #20;
    reset = 0;
    #300;
    mode = 0;
    #300 
    $finish;
  end
  
endmodule
