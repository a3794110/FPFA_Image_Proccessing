 

module redpassfilter (

    //// input ////  
    wVGA_R,
	 wVGA_G,
	 wVGA_B,

    //output

    wBinary,
    wBinary_B,
    wBinary_R,
    wBinary_G,
    wB 	 
  
    ) ; 
 
 input [9:0] wVGA_R;
 input [9:0] wVGA_G;
input	[9:0] wVGA_B;

 output[9:0] wBinary;
 output [9:0]  wBinary_B;
 output [9:0]  wBinary_R;
 output  [9:0] wBinary_G;
 output   wB ;
 
 reg [9:0] wBinary;
reg wB; 

reg [9:0] wBinary_B,wBinary_G,wBinary_R;
wire [32:0] right, left_u,left_d;
assign right =100*((wVGA_R[9:2]-wVGA_G[9:2])+(wVGA_R[9:2]-wVGA_B[9:2]))*((wVGA_R[9:2]-wVGA_G[9:2])+(wVGA_R[9:2]-wVGA_B[9:2]));
assign left_u = 400*((wVGA_R[9:2]-wVGA_B[9:2])*(wVGA_G[9:2]-wVGA_B[9:2])+(wVGA_R[9:2]-wVGA_G[9:2])*(wVGA_R[9:2]-wVGA_G[9:2]));
assign left_d = 10'b0110000111*((wVGA_R[9:2]-wVGA_B[9:2])*(wVGA_G[9:2]-wVGA_B[9:2])+(wVGA_R[9:2]-wVGA_G[9:2])*(wVGA_R[9:2]-wVGA_G[9:2]));

always @(wVGA_R or wVGA_G or wVGA_B)
begin
if ( right<=left_u && right>=left_d &&  (wVGA_R[9:2]-wVGA_G[9:2]) >= 8'h20 && (wVGA_R[9:2]-wVGA_B[9:2]) >= 8'h20  && wVGA_G[9:2] >= wVGA_B[9:2] )

begin
wBinary<=1023;
wBinary_B<=wVGA_B;
wBinary_R<=wVGA_R;
wBinary_G<=wVGA_G;
wB <=1;
end
else
begin
wBinary<=0;
wBinary_B<=0;
wBinary_R<=0;
wBinary_G<=0;
wB <= 0;

end
end

					


endmodule  // timer

