//design code
module mod_6_counter(
  input clk,
  input rst,
  output reg[2:0]count);
  
  always@(posedge clk or posedge rst)begin
    if(rst)
      count<=3'b000;
    else if(count==3'b101)
      count<=3'b000;
    else 
      count<=count+1;
  end
endmodule

/testbench code
`timescale 1ns / 1ps
module mod_6_counter_tb;
  reg clk;
  reg rst;
  wire [2:0]count;
  
  mod_6_counter uut(clk,rst,count);
  
  initial begin
    $monitor("Time=%0t|clk=%d|rst=%d|Count=%d",$time,clk,rst,count);
  end
  
  initial begin
    $dumpfile("mod_6_counter.vcd");
    $dumpvars(1,mod_6_counter_tb);
  end

  
  always #5 clk = ~clk;

    initial begin
        clk = 0;
      rst=1;#10;
      rst=0;#60;
      rst=0;#50;
      rst=0;#10;
      rst=1;#10;
      $finish;

    end
endmodule
