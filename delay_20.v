module delay_20 (
	 clk,
	 rst_n,
	tapsx,
	 
	delay01,delay02,delay03,delay04,delay05,delay06,delay07,delay08,delay09,delay10,
	delay11,delay12,delay13,delay14,delay15,delay16,delay17,delay18,delay19 );

	input  clk,	 rst_n;
	input [7:0]  tapsx;
	output reg[7:0] delay01,delay02,delay03,delay04,delay05,delay06,delay07,delay08,delay09,delay10;
	output reg[7:0]delay11,delay12,delay13,delay14,delay15,delay16,delay17,delay18,delay19;
	
	
	
	
	always @(posedge clk  or negedge rst_n )
	begin
	
	 if (rst_n ==0)
	 begin
	 delay01<=0;
	 delay02<=0;
	 delay03<=0;
	 delay04<=0;
	 delay05<=0;
	 delay06<=0;
	 delay07<=0;
	 delay08<=0;
	 delay09<=0;
	 delay10<=0;
	 delay11<=0;
	 delay12<=0;
	 delay13<=0;
	 delay14<=0;
	 delay15<=0;
	 delay16<=0;
	 delay17<=0;
	 delay18<=0;
	 delay19<=0;
	 end
	 else
	 begin
	
	 	 delay01 <= tapsx; 
	 delay02<=delay01;
	 delay03<=delay02;
 
	 delay04<=delay03;
	 delay05<=delay04;
	 delay06<=delay05;
	 delay07<=delay06;
	 delay08<=delay07;
	 delay09<=delay08;
	 delay10<=delay09;
	 delay11<=delay10;
	 delay12<=delay11;
	 delay13<=delay12;
	 delay14<=delay13;
	 delay15<=delay14;
	 delay16<=delay15;
	 delay17<=delay16;
	 delay18<=delay17;
	 delay19<=delay18;
	 end
	
	end
	
	
	
	endmodule
	
	