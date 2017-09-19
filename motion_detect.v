
module motion_detect	(		
					iRST_n,
					clk,	
					iX_COORD,
					TEMP,
					out_count,
					trigger
					);
					 
//===========================================================================
// PORT declarations
//===========================================================================                      
parameter length=120;
input			iRST_n;				// system reset
input           clk;
input	[11:0]	iX_COORD;			// X coordinate form touch panel
output	[length-1:0]	TEMP;		// displaed photo number
output	[1:0]out_count;
output trigger;
//=============================================================================
// REG/WIRE declarations
//=============================================================================

reg 	[length-1:0]	TEMP;
//=============================================================================
// Structural coding
//=============================================================================
 
 
 wire clk_10Hz;
	
divider_v  inst(  .reset_n(iRST_n),  .clk(clk), .clk_out(clk_10Hz)   );
defparam inst.divisor = 5000000 ;
defparam inst.divisor2 =2500000 ; 


always@(posedge clk_10Hz or negedge iRST_n)
	begin
		if (!iRST_n)
			TEMP <= 0;
		 	
		else  
		   begin
		    TEMP <= TEMP >> 12 ;
		    TEMP[length-1:length-12] <= iX_COORD;
		   end
	end
	 	
//////////////////////////////////////////////////////////////////////////////
reg [1:0]  	out_count;

always @(posedge clk_10Hz or negedge iRST_n)
	begin
	if (!iRST_n)
	  out_count <=  2'b00;
//	else if ( iX_COORD > TEMP[length-1: length-12] &&  TEMP[length/2-1: length/2-12] > TEMP[11:0] )   //right 
	else if ( iX_COORD > TEMP[length-2*12-1: length-2*12-12] && TEMP[length-2*12-1: length-2*12-12]>TEMP[length/2-1: length/2-12] &&  TEMP[length/2-1: length/2-12] > TEMP[11:0] )   //right 
		
	out_count <=  2'b10; //increase
   else if 	( TEMP[11:0] > TEMP[length/2-1: length/2-12]   && TEMP[length/2-1: length/2-12] > TEMP[length-2*12-1: length-2*12-12] && TEMP[length-2*12-1: length-2*12-12]>iX_COORD) //left
	  out_count <=  2'b01;	//decrease
	  
	else 
      out_count <=  2'b00;	
	
   end	
	
assign trigger = |out_count;	//out_count[0] | out_count[1] 
endmodule
