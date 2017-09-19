module motor_switch_v ( reset_n, clk, SW, pwm_out ); 
parameter period_width = 2000;   
input reset_n;
input clk;
input [1:0] SW;
output pwm_out;

wire clk_100KHz;
reg [9:0] N; 
reg[31:0]  period ;

//除頻器
/*
引用divider_v，標記為’inst1’。
將參數divisor設定為500;
將參數divisor2設定為250。
’inst1’有reset_n與clk與clk_out端口，’inst1’的reset_n接reset_n接線，’inst1’的clk接clk接線，’inst1’的clk_out接clk_100KHz接線。
*/
divider_v inst1 (.reset_n(reset_n), .clk(clk), .clk_out(clk_100KHz));
defparam inst1.divisor = 500;
defparam inst1.divisor2 = 250;

//參數控制器
always @ (*)
begin
case(SW)
2'b01: N=130; //若SW3=0,SW2=0,SW1=0,SW0=1,則N=130

2'b11: N=170;

2'b00: N=153; //若SW3=1,SW2=0,SW1=0,SW0=0,則N=150

2'b10: N=170; //若SW3=1,SW2=1,SW1=1,SW0=1,則N=170
default: N = 150; //預設狀態, N=150
endcase
end
//計數器
/*
若reset_n 為0，則重置period為1;否則正緣觸發時，若period數到period_width 時，period變為1;否則，period加1。
*/
always @ (posedge clk_100KHz or negedge reset_n)
begin
   if (reset_n == 0)    //非同步清除
	     period <= 1;
	 else if ( period == period_width)  	
        period <= 1;
    else
        period <= period + 1;
 end 
////////////////////比較器///////////////////////////////////
//若period > N 則pwm_out等於0,否則pwm_out等於1
assign pwm_out  = (period > N) ? 0: 1;
///指定led_out 等於pwm_out/////////////////////

endmodule
