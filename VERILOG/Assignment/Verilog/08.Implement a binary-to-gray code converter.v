//design code
module binarytogray(
  input [3:0]bin,
  output [3:0]gray);
  assign gray[3]=bin[3];
  assign gray[2]=bin[3]^bin[2];
  assign gray[1]=bin[2]^bin[1];
  assign gray[0]=bin[1]^bin[0];
endmodule

//testbench code
module binarytogray_tb;
 reg [3:0] bin;
  wire [3:0] gray;
  binarytogray uut (.bin(bin),.gray(gray));
  initial begin
    $dumpfile("binarytogray.vcd");
    $dumpvars(1,binarytogray_tb);
  end
  initial begin
    $monitor("TIME=%0t BINARY=%b GRAY=%b",$time,bin,gray);
  end
  
  initial begin
        bin = 4'b0000;#10;
        bin = 4'b0001;#10;
        bin = 4'b0010;#10;
        bin = 4'b0011;#10;
        bin = 4'b0100;#10;
        bin = 4'b0101;#10;
        bin = 4'b0110;#10;
        bin = 4'b0111;#10;
        bin = 4'b1000;#10;
        bin = 4'b1001;#10;
        bin = 4'b1010;#10;
        bin = 4'b1011;#10;
        bin = 4'b1100;#10;
        bin = 4'b1101;#10;
        bin = 4'b1110;#10;
        bin = 4'b1111;#10;
    $finish;
    end
endmodule
