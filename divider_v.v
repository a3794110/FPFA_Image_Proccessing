module divider_v ( reset_n,  clk, clk_out   );
input reset_n;
input clk;
output clk_out;

parameter divisor = 5 ;
parameter divisor2 = 2 ;

reg [31:0]  cnt1;
reg cnt2;

always@(posedge clk  or negedge reset_n)
begin
   if (reset_n == 0)
	    cnt1 <= 0;
	else if (cnt1 == divisor)
	    cnt1 <= 1;
	else 
	    cnt1 <= cnt1 + 1;
end


always@(posedge clk or negedge reset_n )
begin
    if (reset_n == 0)
	    cnt2 <= 0;
	else if (cnt1 == divisor || cnt1 == divisor2)
	    cnt2 <= ! cnt2;
end
///////////////////////////////////
assign  clk_out  =  cnt2;

endmodule
