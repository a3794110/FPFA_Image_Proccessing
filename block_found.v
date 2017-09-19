/* 
(C) OOMusou 2008 http://oomusou.cnblogs.com

Filename    : Sobel.v
Compiler    : Quartus II 8.0
Description : Demo how to implement Sobel Edge Detector on DE2-70
Release     : 09/27/2008 1.0
*/

module block_found (iCLK, iRST_N, x_cnt,y_cnt, iDVAL,iDATA,WB,oDVAL, oDATA_x,oDATA_y,oDATA_x_eye,oDATA_y_eye,load);
  input            iCLK;
  input            iRST_N;
  input [10:0] x_cnt;
  input [9:0] y_cnt;
  input            iDVAL;
  input      [9:0] iDATA;
  input WB;
  output load;
  output reg       oDVAL;
  output reg [10:0] oDATA_x;
   output reg [9:0] oDATA_y;
	output reg [10:0] oDATA_x_eye;
   output reg [9:0] oDATA_y_eye;
	
  wire [7:0] delay23_01,delay23_02,delay23_03,delay23_04,delay23_05,delay23_06,delay23_07,delay23_08,delay23_09;
  wire [7:0] delay23_10,delay23_11,delay23_12,delay23_13,delay23_14,delay23_15,delay23_16,delay23_17,delay23_18,delay23_19;
  wire [7:0] delay22_01,delay22_02,delay22_03,delay22_04,delay22_05,delay22_06,delay22_07,delay22_08,delay22_09;
  wire [7:0] delay22_10,delay22_11,delay22_12,delay22_13,delay22_14,delay22_15,delay22_16,delay22_17,delay22_18,delay22_19;
  wire [7:0] delay21_01,delay21_02,delay21_03,delay21_04,delay21_05,delay21_06,delay21_07,delay21_08,delay21_09;
  wire [7:0] delay21_10,delay21_11,delay21_12,delay21_13,delay21_14,delay21_15,delay21_16,delay21_17,delay21_18,delay21_19;
  wire [7:0] delay20_01,delay20_02,delay20_03,delay20_04,delay20_05,delay20_06,delay20_07,delay20_08,delay20_09;
  wire [7:0] delay20_10,delay20_11,delay20_12,delay20_13,delay20_14,delay20_15,delay20_16,delay20_17,delay20_18,delay20_19;
  wire [7:0] delay19_01,delay19_02,delay19_03,delay19_04,delay19_05,delay19_06,delay19_07,delay19_08,delay19_09;
  wire [7:0] delay19_10,delay19_11,delay19_12,delay19_13,delay19_14,delay19_15,delay19_16,delay19_17,delay19_18,delay19_19;
  wire [7:0] delay18_01,delay18_02,delay18_03,delay18_04,delay18_05,delay18_06,delay18_07,delay18_08,delay18_09;
  wire [7:0] delay18_10,delay18_11,delay18_12,delay18_13,delay18_14,delay18_15,delay18_16,delay18_17,delay18_18,delay18_19;
  wire [7:0] delay17_01,delay17_02,delay17_03,delay17_04,delay17_05,delay17_06,delay17_07,delay17_08,delay17_09;
  wire [7:0] delay17_10,delay17_11,delay17_12,delay17_13,delay17_14,delay17_15,delay17_16,delay17_17,delay17_18,delay17_19;
  wire [7:0] delay16_01,delay16_02,delay16_03,delay16_04,delay16_05,delay16_06,delay16_07,delay16_08,delay16_09;
  wire [7:0] delay16_10,delay16_11,delay16_12,delay16_13,delay16_14,delay16_15,delay16_16,delay16_17,delay16_18,delay16_19;
  wire [7:0] delay15_01,delay15_02,delay15_03,delay15_04,delay15_05,delay15_06,delay15_07,delay15_08,delay15_09;
  wire [7:0] delay15_10,delay15_11,delay15_12,delay15_13,delay15_14,delay15_15,delay15_16,delay15_17,delay15_18,delay15_19;
  wire [7:0] delay14_01,delay14_02,delay14_03,delay14_04,delay14_05,delay14_06,delay14_07,delay14_08,delay14_09;
  wire [7:0] delay14_10,delay14_11,delay14_12,delay14_13,delay14_14,delay14_15,delay14_16,delay14_17,delay14_18,delay14_19;
  wire [7:0] delay13_01,delay13_02,delay13_03,delay13_04,delay13_05,delay13_06,delay13_07,delay13_08,delay13_09;
  wire [7:0] delay13_10,delay13_11,delay13_12,delay13_13,delay13_14,delay13_15,delay13_16,delay13_17,delay13_18,delay13_19;
  wire [7:0] delay12_01,delay12_02,delay12_03,delay12_04,delay12_05,delay12_06,delay12_07,delay12_08,delay12_09;
  wire [7:0] delay12_10,delay12_11,delay12_12,delay12_13,delay12_14,delay12_15,delay12_16,delay12_17,delay12_18,delay12_19;
  wire [7:0] delay11_01,delay11_02,delay11_03,delay11_04,delay11_05,delay11_06,delay11_07,delay11_08,delay11_09;
  wire [7:0] delay11_10,delay11_11,delay11_12,delay11_13,delay11_14,delay11_15,delay11_16,delay11_17,delay11_18,delay11_19;
  wire [7:0] delay10_01,delay10_02,delay10_03,delay10_04,delay10_05,delay10_06,delay10_07,delay10_08,delay10_09;
  wire [7:0] delay10_10,delay10_11,delay10_12,delay10_13,delay10_14,delay10_15,delay10_16,delay10_17,delay10_18,delay10_19;

  wire [7:0] delay9_01,delay9_02,delay9_03,delay9_04,delay9_05,delay9_06,delay9_07,delay9_08,delay9_09;
  wire [7:0] delay9_10,delay9_11,delay9_12,delay9_13,delay9_14,delay9_15,delay9_16,delay9_17,delay9_18,delay9_19;
 
  wire [7:0] delay8_01,delay8_02,delay8_03,delay8_04,delay8_05,delay8_06,delay8_07,delay8_08,delay8_09;
  wire [7:0] delay8_10,delay8_11,delay8_12,delay8_13,delay8_14,delay8_15,delay8_16,delay8_17,delay8_18,delay8_19;
 
  wire [7:0] delay7_01,delay7_02,delay7_03,delay7_04,delay7_05,delay7_06,delay7_07,delay7_08,delay7_09;
  wire [7:0] delay7_10,delay7_11,delay7_12,delay7_13,delay7_14,delay7_15,delay7_16,delay7_17,delay7_18,delay7_19;
  wire [7:0] delay6_01,delay6_02,delay6_03,delay6_04,delay6_05,delay6_06,delay6_07,delay6_08,delay6_09;
  wire [7:0] delay6_10,delay6_11,delay6_12,delay6_13,delay6_14,delay6_15,delay6_16,delay6_17,delay6_18,delay6_19;
  wire [7:0] delay5_01,delay5_02,delay5_03,delay5_04,delay5_05,delay5_06,delay5_07,delay5_08,delay5_09;
  wire [7:0] delay5_10,delay5_11,delay5_12,delay5_13,delay5_14,delay5_15,delay5_16,delay5_17,delay5_18,delay5_19;
    wire [7:0] delay4_01,delay4_02,delay4_03,delay4_04,delay4_05,delay4_06,delay4_07,delay4_08,delay4_09;
  wire [7:0] delay4_10,delay4_11,delay4_12,delay4_13,delay4_14,delay4_15,delay4_16,delay4_17,delay4_18,delay4_19;
  wire [7:0] delay3_01,delay3_02,delay3_03,delay3_04,delay3_05,delay3_06,delay3_07,delay3_08,delay3_09;
  wire [7:0] delay3_10,delay3_11,delay3_12,delay3_13,delay3_14,delay3_15,delay3_16,delay3_17,delay3_18,delay3_19;
  wire [7:0] delay2_01,delay2_02,delay2_03,delay2_04,delay2_05,delay2_06,delay2_07,delay2_08,delay2_09;
  wire [7:0] delay2_10,delay2_11,delay2_12,delay2_13,delay2_14,delay2_15,delay2_16,delay2_17,delay2_18,delay2_19;
  wire [7:0] delay1_01,delay1_02,delay1_03,delay1_04,delay1_05,delay1_06,delay1_07,delay1_08,delay1_09;
  wire [7:0] delay1_10,delay1_11,delay1_12,delay1_13,delay1_14,delay1_15,delay1_16,delay1_17,delay1_18,delay1_19;
  wire [7:0] delay0_01,delay0_02,delay0_03,delay0_04,delay0_05,delay0_06,delay0_07,delay0_08,delay0_09;
  wire [7:0] delay0_10,delay0_11,delay0_12,delay0_13,delay0_14,delay0_15,delay0_16,delay0_17,delay0_18,delay0_19;

// mask x
parameter X1 = 8'hff, X2 = 8'h00, X3 = 8'h01;
parameter X4 = 8'hfe, X5 = 8'h00, X6 = 8'h02;
parameter X7 = 8'hff, X8 = 8'h00, X9 = 8'h01;

// mask y
parameter Y1 = 8'h01, Y2 = 8'h02, Y3 = 8'h01;
parameter Y4 = 8'h00, Y5 = 8'h00, Y6 = 8'h00;
parameter Y7 = 8'hff, Y8 = 8'hfe, Y9 = 8'hff;

wire  [7:0] Line0;
wire  [7:0] Line1;
wire  [7:0] Line2;
wire  [7:0] Line3;
wire  [7:0] Line4;
wire  [7:0] Line5;
wire  [7:0] Line6;
wire  [7:0] Line7;
wire  [7:0] Line8;
wire  [7:0] Line9;
wire  [7:0] Line10;
wire  [7:0] Line11;
wire  [7:0] Line12;
wire  [7:0] Line13;
wire  [7:0] Line14;
wire  [7:0] Line15;
wire  [7:0] Line16;
wire  [7:0] Line17;
wire  [7:0] Line18;
wire  [7:0] Line19;
wire  [7:0] Line20;
wire  [7:0] Line21;
wire  [7:0] Line22;
wire  [7:0] Line23;

lpm_line_24 b0 (
  .clken(iDVAL),
  .clock(iCLK),
//  .shiftin(iDATA[9:2]),
.shiftin({7'b0000000,WB}),
  .taps0x(Line0),
  .taps1x(Line1),
  .taps2x(Line2),
  .taps3x(Line3),
  .taps4x(Line4),
  .taps5x(Line5),
  .taps6x(Line6),
  .taps7x(Line7),
  .taps8x(Line8),
   .taps9x(Line9),
  .taps10x(Line10),
  .taps11x(Line11),
   .taps12x(Line12),
  .taps13x(Line13),
  .taps14x(Line14),
    .taps15x(Line15),
  .taps16x(Line16),
  .taps17x(Line17),
    .taps18x(Line18),
  .taps19x(Line19),
  .taps20x(Line20),
    .taps21x(Line21),
  .taps22x(Line22),
  .taps23x(Line23)
);

delay_20 Line0_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line0),.delay01(delay0_01),.delay02(delay0_02),.delay03(delay0_03),.delay04(delay0_04),.delay05(delay0_05),.delay06(delay0_06),.delay07(delay0_07),.delay08(delay0_08),.delay09(delay0_09),.delay10(delay0_10),
	.delay11(delay0_11),.delay12(delay0_12),.delay13(delay0_13),.delay14(delay0_14),.delay15(delay0_15),.delay16(delay0_16),.delay17(delay0_17),.delay18(delay0_18),.delay19(delay0_19) );

delay_20 Line1_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line1),.delay01(delay1_01),.delay02(delay1_02),.delay03(delay1_03),.delay04(delay1_04),.delay05(delay1_05),.delay06(delay1_06),.delay07(delay1_07),.delay08(delay1_08),.delay09(delay1_09),.delay10(delay1_10),
	.delay11(delay1_11),.delay12(delay1_12),.delay13(delay1_13),.delay14(delay1_14),.delay15(delay1_15),.delay16(delay1_16),.delay17(delay1_17),.delay18(delay1_18),.delay19(delay1_19) );


delay_20 Line2_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line2),.delay01(delay2_01),.delay02(delay2_02),.delay03(delay2_03),.delay04(delay2_04),.delay05(delay2_05),.delay06(delay2_06),.delay07(delay2_07),.delay08(delay2_08),.delay09(delay2_09),.delay10(delay2_10),
	.delay11(delay2_11),.delay12(delay2_12),.delay13(delay2_13),.delay14(delay2_14),.delay15(delay2_15),.delay16(delay2_16),.delay17(delay2_17),.delay18(delay2_18),.delay19(delay2_19) );

delay_20 Line3_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line3),.delay01(delay3_01),.delay02(delay3_02),.delay03(delay3_03),.delay04(delay3_04),.delay05(delay3_05),.delay06(delay3_06),.delay07(delay3_07),.delay08(delay3_08),.delay09(delay3_09),.delay10(delay3_10),
	.delay11(delay3_11),.delay12(delay3_12),.delay13(delay3_13),.delay14(delay3_14),.delay15(delay3_15),.delay16(delay3_16),.delay17(delay3_17),.delay18(delay3_18),.delay19(delay3_19) );

delay_20 Line4_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line4),.delay01(delay4_01),.delay02(delay4_02),.delay03(delay4_03),.delay04(delay4_04),.delay05(delay4_05),.delay06(delay4_06),.delay07(delay4_07),.delay08(delay4_08),.delay09(delay4_09),.delay10(delay4_10),
	.delay11(delay4_11),.delay12(delay4_12),.delay13(delay4_13),.delay14(delay4_14),.delay15(delay4_15),.delay16(delay4_16),.delay17(delay4_17),.delay18(delay4_18),.delay19(delay4_19) );
	
delay_20 Line5_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line5),.delay01(delay5_01),.delay02(delay5_02),.delay03(delay5_03),.delay04(delay5_04),.delay05(delay5_05),.delay06(delay5_06),.delay07(delay5_07),.delay08(delay5_08),.delay09(delay5_09),.delay10(delay5_10),
	.delay11(delay5_11),.delay12(delay5_12),.delay13(delay5_13),.delay14(delay5_14),.delay15(delay5_15),.delay16(delay5_16),.delay17(delay5_17),.delay18(delay5_18),.delay19(delay5_19) );
	
delay_20 Line6_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line6),.delay01(delay6_01),.delay02(delay6_02),.delay03(delay6_03),.delay04(delay6_04),.delay05(delay6_05),.delay06(delay6_06),.delay07(delay6_07),.delay08(delay6_08),.delay09(delay6_09),.delay10(delay6_10),
	.delay11(delay6_11),.delay12(delay6_12),.delay13(delay6_13),.delay14(delay6_14),.delay15(delay6_15),.delay16(delay6_16),.delay17(delay6_17),.delay18(delay6_18),.delay19(delay6_19) );

	
delay_20 Line7_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line7),.delay01(delay7_01),.delay02(delay7_02),.delay03(delay7_03),.delay04(delay7_04),.delay05(delay7_05),.delay06(delay7_06),.delay07(delay7_07),.delay08(delay7_08),.delay09(delay7_09),.delay10(delay7_10),
	.delay11(delay7_11),.delay12(delay7_12),.delay13(delay7_13),.delay14(delay7_14),.delay15(delay7_15),.delay16(delay7_16),.delay17(delay7_17),.delay18(delay7_18),.delay19(delay7_19) );
		
delay_20 Line8_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line8),.delay01(delay8_01),.delay02(delay8_02),.delay03(delay8_03),.delay04(delay8_04),.delay05(delay8_05),.delay06(delay8_06),.delay07(delay8_07),.delay08(delay8_08),.delay09(delay8_09),.delay10(delay8_10),
	.delay11(delay8_11),.delay12(delay8_12),.delay13(delay8_13),.delay14(delay8_14),.delay15(delay8_15),.delay16(delay8_16),.delay17(delay8_17),.delay18(delay8_18),.delay19(delay8_19) );
	
delay_20 Line9_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line9),.delay01(delay9_01),.delay02(delay9_02),.delay03(delay9_03),.delay04(delay9_04),.delay05(delay9_05),.delay06(delay9_06),.delay07(delay9_07),.delay08(delay9_08),.delay09(delay9_09),.delay10(delay9_10),
	.delay11(delay9_11),.delay12(delay9_12),.delay13(delay9_13),.delay14(delay9_14),.delay15(delay9_15),.delay16(delay9_16),.delay17(delay9_17),.delay18(delay9_18),.delay19(delay9_19) );
delay_20 Line10_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line10),.delay01(delay10_01),.delay02(delay10_02),.delay03(delay10_03),.delay04(delay10_04),.delay05(delay10_05),.delay06(delay10_06),.delay07(delay10_07),.delay08(delay10_08),.delay09(delay10_09),.delay10(delay10_10),
	.delay11(delay10_11),.delay12(delay10_12),.delay13(delay10_13),.delay14(delay10_14),.delay15(delay10_15),.delay16(delay10_16),.delay17(delay10_17),.delay18(delay10_18),.delay19(delay10_19) );
delay_20 Line11_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line11),.delay01(delay11_01),.delay02(delay11_02),.delay03(delay11_03),.delay04(delay11_04),.delay05(delay11_05),.delay06(delay11_06),.delay07(delay11_07),.delay08(delay11_08),.delay09(delay11_09),.delay10(delay11_10),
	.delay11(delay11_11),.delay12(delay11_12),.delay13(delay11_13),.delay14(delay11_14),.delay15(delay11_15),.delay16(delay11_16),.delay17(delay11_17),.delay18(delay11_18),.delay19(delay11_19) );
delay_20 Line12_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line12),.delay01(delay12_01),.delay02(delay12_02),.delay03(delay12_03),.delay04(delay12_04),.delay05(delay12_05),.delay06(delay12_06),.delay07(delay12_07),.delay08(delay12_08),.delay09(delay12_09),.delay10(delay12_10),
	.delay11(delay12_11),.delay12(delay12_12),.delay13(delay12_13),.delay14(delay12_14),.delay15(delay12_15),.delay16(delay12_16),.delay17(delay12_17),.delay18(delay12_18),.delay19(delay12_19) );
delay_20 Line13_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line13),.delay01(delay13_01),.delay02(delay13_02),.delay03(delay13_03),.delay04(delay13_04),.delay05(delay13_05),.delay06(delay13_06),.delay07(delay13_07),.delay08(delay13_08),.delay09(delay13_09),.delay10(delay13_10),
	.delay11(delay13_11),.delay12(delay13_12),.delay13(delay13_13),.delay14(delay13_14),.delay15(delay13_15),.delay16(delay13_16),.delay17(delay13_17),.delay18(delay13_18),.delay19(delay13_19) );

delay_20 Line14_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line14),.delay01(delay14_01),.delay02(delay14_02),.delay03(delay14_03),.delay04(delay14_04),.delay05(delay14_05),.delay06(delay14_06),.delay07(delay14_07),.delay08(delay14_08),.delay09(delay14_09),.delay10(delay14_10),
	.delay11(delay14_11),.delay12(delay14_12),.delay13(delay14_13),.delay14(delay14_14),.delay15(delay14_15),.delay16(delay14_16),.delay17(delay14_17),.delay18(delay14_18),.delay19(delay14_19) );
delay_20 Line15_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line15),.delay01(delay15_01),.delay02(delay15_02),.delay03(delay15_03),.delay04(delay15_04),.delay05(delay15_05),.delay06(delay15_06),.delay07(delay15_07),.delay08(delay15_08),.delay09(delay15_09),.delay10(delay15_10),
	.delay11(delay15_11),.delay12(delay15_12),.delay13(delay15_13),.delay14(delay15_14),.delay15(delay15_15),.delay16(delay15_16),.delay17(delay15_17),.delay18(delay15_18),.delay19(delay15_19) );
delay_20 Line16_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line16),.delay01(delay16_01),.delay02(delay16_02),.delay03(delay16_03),.delay04(delay16_04),.delay05(delay16_05),.delay06(delay16_06),.delay07(delay16_07),.delay08(delay16_08),.delay09(delay16_09),.delay10(delay16_10),
	.delay11(delay16_11),.delay12(delay16_12),.delay13(delay16_13),.delay14(delay16_14),.delay15(delay16_15),.delay16(delay16_16),.delay17(delay16_17),.delay18(delay16_18),.delay19(delay16_19) );
	
delay_20 Line17_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line17),.delay01(delay17_01),.delay02(delay17_02),.delay03(delay17_03),.delay04(delay17_04),.delay05(delay17_05),.delay06(delay17_06),.delay07(delay17_07),.delay08(delay17_08),.delay09(delay17_09),.delay10(delay17_10),
	.delay11(delay17_11),.delay12(delay17_12),.delay13(delay17_13),.delay14(delay17_14),.delay15(delay17_15),.delay16(delay17_16),.delay17(delay17_17),.delay18(delay17_18),.delay19(delay17_19) );
delay_20 Line18_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line18),.delay01(delay18_01),.delay02(delay18_02),.delay03(delay18_03),.delay04(delay18_04),.delay05(delay18_05),.delay06(delay18_06),.delay07(delay18_07),.delay08(delay18_08),.delay09(delay18_09),.delay10(delay18_10),
	.delay11(delay18_11),.delay12(delay18_12),.delay13(delay18_13),.delay14(delay18_14),.delay15(delay18_15),.delay16(delay18_16),.delay17(delay18_17),.delay18(delay18_18),.delay19(delay18_19) );
delay_20 Line19_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line19),.delay01(delay19_01),.delay02(delay19_02),.delay03(delay19_03),.delay04(delay19_04),.delay05(delay19_05),.delay06(delay19_06),.delay07(delay19_07),.delay08(delay19_08),.delay09(delay19_09),.delay10(delay19_10),
	.delay11(delay19_11),.delay12(delay19_12),.delay13(delay19_13),.delay14(delay19_14),.delay15(delay19_15),.delay16(delay19_16),.delay17(delay19_17),.delay18(delay19_18),.delay19(delay19_19) );
delay_20 Line20_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line20),.delay01(delay20_01),.delay02(delay20_02),.delay03(delay20_03),.delay04(delay20_04),.delay05(delay20_05),.delay06(delay20_06),.delay07(delay20_07),.delay08(delay20_08),.delay09(delay20_09),.delay10(delay20_10),
	.delay11(delay20_11),.delay12(delay20_12),.delay13(delay20_13),.delay14(delay20_14),.delay15(delay20_15),.delay16(delay20_16),.delay17(delay20_17),.delay18(delay20_18),.delay19(delay20_19) );
delay_20 Line21_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line21),.delay01(delay21_01),.delay02(delay21_02),.delay03(delay21_03),.delay04(delay21_04),.delay05(delay21_05),.delay06(delay21_06),.delay07(delay21_07),.delay08(delay21_08),.delay09(delay21_09),.delay10(delay21_10),
	.delay11(delay21_11),.delay12(delay21_12),.delay13(delay21_13),.delay14(delay21_14),.delay15(delay21_15),.delay16(delay21_16),.delay17(delay21_17),.delay18(delay21_18),.delay19(delay21_19) );
	
delay_20 Line22_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line22),.delay01(delay22_01),.delay02(delay22_02),.delay03(delay22_03),.delay04(delay22_04),.delay05(delay22_05),.delay06(delay22_06),.delay07(delay22_07),.delay08(delay22_08),.delay09(delay22_09),.delay10(delay22_10),
	.delay11(delay22_11),.delay12(delay22_12),.delay13(delay22_13),.delay14(delay22_14),.delay15(delay22_15),.delay16(delay22_16),.delay17(delay22_17),.delay18(delay22_18),.delay19(delay22_19) );
delay_20 Line23_delay(
	 .clk(iCLK),.rst_n(iRST_N),.tapsx(Line23),.delay01(delay23_01),.delay02(delay23_02),.delay03(delay23_03),.delay04(delay23_04),.delay05(delay23_05),.delay06(delay23_06),.delay07(delay23_07),.delay08(delay23_08),.delay09(delay23_09),.delay10(delay23_10),
	.delay11(delay23_11),.delay12(delay23_12),.delay13(delay23_13),.delay14(delay23_14),.delay15(delay23_15),.delay16(delay23_16),.delay17(delay23_17),.delay18(delay23_18),.delay19(delay23_19) );

 wire [63:0]  sum;
 assign sum =delay23_01[0]+delay23_02[0]+delay23_03[0]+delay23_04[0]+delay23_05[0]+delay23_06[0]+delay23_07[0]+delay23_08[0]+
 delay23_09[0]+delay23_10[0]+delay23_11[0]+delay23_12[0]+delay23_13[0]+delay23_14[0]+delay23_15[0]+delay23_16[0]+delay23_17[0]+
 delay23_18[0]+delay23_19[0]+
delay22_01[0]+delay22_02[0]+delay22_03[0]+delay22_04[0]+delay22_05[0]+delay22_06[0]+delay22_07[0]+delay22_08[0]+
 delay22_09[0]+delay22_10[0]+delay22_11[0]+delay22_12[0]+delay22_13[0]+delay22_14[0]+delay22_15[0]+delay22_16[0]+delay22_17[0]+
 delay22_18[0]+delay22_19[0]+
delay21_01[0]+delay21_02[0]+delay21_03[0]+delay21_04[0]+delay21_05[0]+delay21_06[0]+delay21_07[0]+delay21_08[0]+
 delay21_09[0]+delay21_10[0]+delay21_11[0]+delay21_12[0]+delay21_13[0]+delay21_14[0]+delay21_15[0]+delay21_16[0]+delay21_17[0]+
 delay21_18[0]+delay21_19[0]+
delay20_01[0]+delay20_02[0]+delay20_03[0]+delay20_04[0]+delay20_05[0]+delay20_06[0]+delay20_07[0]+delay20_08[0]+
 delay20_09[0]+delay20_10[0]+delay20_11[0]+delay20_12[0]+delay20_13[0]+delay20_14[0]+delay20_15[0]+delay20_16[0]+delay20_17[0]+
 delay20_18[0]+delay20_19[0]+
 delay19_01[0]+delay19_02[0]+delay19_03[0]+delay19_04[0]+delay19_05[0]+delay19_06[0]+delay19_07[0]+delay19_08[0]+
 delay19_09[0]+delay19_10[0]+delay19_11[0]+delay19_12[0]+delay19_13[0]+delay19_14[0]+delay19_15[0]+delay19_16[0]+delay19_17[0]+
 delay19_18[0]+delay19_19[0]+
delay18_01[0]+delay18_02[0]+delay18_03[0]+delay18_04[0]+delay18_05[0]+delay18_06[0]+delay18_07[0]+delay18_08[0]+
 delay18_09[0]+delay18_10[0]+delay18_11[0]+delay18_12[0]+delay18_13[0]+delay18_14[0]+delay18_15[0]+delay18_16[0]+delay18_17[0]+
 delay18_18[0]+delay18_19[0]+
delay17_01[0]+delay17_02[0]+delay17_03[0]+delay17_04[0]+delay17_05[0]+delay17_06[0]+delay17_07[0]+delay17_08[0]+
 delay17_09[0]+delay17_10[0]+delay17_11[0]+delay17_12[0]+delay17_13[0]+delay17_14[0]+delay17_15[0]+delay17_16[0]+delay17_17[0]+
 delay17_18[0]+delay17_19[0]+
delay16_01[0]+delay16_02[0]+delay16_03[0]+delay16_04[0]+delay16_05[0]+delay16_06[0]+delay16_07[0]+delay16_08[0]+
 delay16_09[0]+delay16_10[0]+delay16_11[0]+delay16_12[0]+delay16_13[0]+delay16_14[0]+delay16_15[0]+delay16_16[0]+delay16_17[0]+
 delay16_18[0]+delay16_19[0]+
delay15_01[0]+delay15_02[0]+delay15_03[0]+delay15_04[0]+delay15_05[0]+delay15_06[0]+delay15_07[0]+delay15_08[0]+
 delay15_09[0]+delay15_10[0]+delay15_11[0]+delay15_12[0]+delay15_13[0]+delay15_14[0]+delay15_15[0]+delay15_16[0]+delay15_17[0]+
 delay15_18[0]+delay15_19[0]+
delay14_01[0]+delay14_02[0]+delay14_03[0]+delay14_04[0]+delay14_05[0]+delay14_06[0]+delay14_07[0]+delay14_08[0]+
 delay14_09[0]+delay14_10[0]+delay14_11[0]+delay14_12[0]+delay14_13[0]+delay14_14[0]+delay14_15[0]+delay14_16[0]+delay14_17[0]+
 delay14_18[0]+delay14_19[0]+
delay13_01[0]+delay13_02[0]+delay13_03[0]+delay13_04[0]+delay13_05[0]+delay13_06[0]+delay13_07[0]+delay13_08[0]+
 delay13_09[0]+delay13_10[0]+delay13_11[0]+delay13_12[0]+delay13_13[0]+delay13_14[0]+delay13_15[0]+delay13_16[0]+delay13_17[0]+
 delay13_18[0]+delay13_19[0]+
delay12_01[0]+delay12_02[0]+delay12_03[0]+delay12_04[0]+delay12_05[0]+delay12_06[0]+delay12_07[0]+delay12_08[0]+
 delay12_09[0]+delay12_10[0]+delay12_11[0]+delay12_12[0]+delay12_13[0]+delay12_14[0]+delay12_15[0]+delay12_16[0]+delay12_17[0]+
 delay12_18[0]+delay12_19[0]+
delay11_01[0]+delay11_02[0]+delay11_03[0]+delay11_04[0]+delay11_05[0]+delay11_06[0]+delay11_07[0]+delay11_08[0]+
 delay11_09[0]+delay11_10[0]+delay11_11[0]+delay11_12[0]+delay11_13[0]+delay11_14[0]+delay11_15[0]+delay11_16[0]+delay11_17[0]+
 delay11_18[0]+delay11_19[0]+
delay10_01[0]+delay10_02[0]+delay10_03[0]+delay10_04[0]+delay10_05[0]+delay10_06[0]+delay10_07[0]+delay10_08[0]+
 delay10_09[0]+delay10_10[0]+delay10_11[0]+delay10_12[0]+delay10_13[0]+delay10_14[0]+delay10_15[0]+delay10_16[0]+delay10_17[0]+
 delay10_18[0]+delay10_19[0]+
delay9_01[0]+delay9_02[0]+delay9_03[0]+delay9_04[0]+delay9_05[0]+delay9_06[0]+delay9_07[0]+delay9_08[0]+
 delay9_09[0]+delay9_10[0]+delay9_11[0]+delay9_12[0]+delay9_13[0]+delay9_14[0]+delay9_15[0]+delay9_16[0]+delay9_17[0]+
 delay9_18[0]+delay9_19[0]+
delay8_01[0]+delay8_02[0]+delay8_03[0]+delay8_04[0]+delay8_05[0]+delay8_06[0]+delay8_07[0]+delay8_08[0]+
 delay8_09[0]+delay8_10[0]+delay8_11[0]+delay8_12[0]+delay8_13[0]+delay8_14[0]+delay8_15[0]+delay8_16[0]+delay8_17[0]+
 delay8_18[0]+delay8_19[0]+
delay7_01[0]+delay7_02[0]+delay7_03[0]+delay7_04[0]+delay7_05[0]+delay7_06[0]+delay7_07[0]+delay7_08[0]+
 delay7_09[0]+delay7_10[0]+delay7_11[0]+delay7_12[0]+delay7_13[0]+delay7_14[0]+delay7_15[0]+delay7_16[0]+delay7_17[0]+
 delay7_18[0]+delay7_19[0]+ delay6_01[0]+delay6_02[0]+delay6_03[0]+delay6_04[0]+delay6_05[0]+delay6_06[0]+delay6_07[0]+
 delay6_08[0]+delay6_09[0]+delay6_10[0]+delay6_11[0]+delay6_12[0]+delay6_13[0]+delay6_14[0]+delay6_15[0]+delay6_16[0]+
 delay6_17[0]+delay6_18[0]+delay6_19[0]+delay5_01[0]+delay5_02[0]+delay5_03[0]+delay5_04[0]+delay5_05[0]+delay5_06[0]+
 delay5_07[0]+delay5_08[0]+delay5_09[0]+delay5_10[0]+delay5_11[0]+delay5_12[0]+delay5_13[0]+delay5_14[0]+delay5_15[0]+
 delay5_16[0]+delay5_17[0]+delay5_18[0]+delay5_19[0]+delay4_01[0]+delay4_02[0]+delay4_03[0]+delay4_04[0]+delay4_05[0]+
 delay4_06[0]+delay4_07[0]+delay4_08[0]+delay4_09[0]+delay4_10[0]+delay4_11[0]+delay4_12[0]+delay4_13[0]+delay4_14[0]+
 delay4_15[0]+delay4_16[0]+delay4_17[0]+delay4_18[0]+delay4_19[0]+delay3_01[0]+delay3_02[0]+delay3_03[0]+delay3_04[0]+
 delay3_05[0]+delay3_06[0]+delay3_07[0]+delay3_08[0]+delay3_09[0]+delay3_10[0]+delay3_11[0]+delay3_12[0]+delay3_13[0]+
 delay3_14[0]+delay3_15[0]+delay3_16[0]+delay3_17[0]+delay3_18[0]+delay3_19[0]+delay2_01[0]+delay2_02[0]+delay2_03[0]+
 delay2_04[0]+delay2_05[0]+delay2_06[0]+delay2_07[0]+delay2_08[0]+delay2_09[0]+delay2_10[0]+delay2_11[0]+delay2_12[0]+
 delay2_13[0]+delay2_14[0]+delay2_15[0]+delay2_16[0]+delay2_17[0]+delay2_18[0]+delay2_19[0]+delay1_01[0]+delay1_02[0]+
 delay1_03[0]+delay1_04[0]+delay1_05[0]+delay1_06[0]+delay1_07[0]+delay1_08[0]+delay1_09[0]+delay1_10[0]+delay1_11[0]+
 delay1_12[0]+delay1_13[0]+delay1_14[0]+delay1_15[0]+delay1_16[0]+delay1_17[0]+delay1_18[0]+delay1_19[0]+delay0_01[0]+
 delay0_02[0]+delay0_03[0]+delay0_04[0]+delay0_05[0]+delay0_06[0]+delay0_07[0]+delay0_08[0]+delay0_09[0]+delay0_10[0]+
 delay0_11[0]+delay0_12[0]+delay0_13[0]+delay0_14[0]+delay0_15[0]+delay0_16[0]+delay0_17[0]+delay0_18[0]+delay0_19[0];

 parameter H_LINE = 1056;
 parameter V_LINE = 525;
 parameter Hsync_Blank = 216;
 parameter Hsync_Front_Porch = 40;
 parameter Vertical_Back_Porch = 35;
 parameter Vertical_Front_Porch = 10;

  //parameter X_START = Hsync_Front_Porch;
parameter H_START = Hsync_Blank-1;
//parameter Y_START = Vertical_Front_Porch;
parameter Y_START =  Vertical_Back_Porch-1;


/*always@(posedge iCLK, negedge iRST_N) begin
  if (!iRST_N)
    begin
     oDVAL <= 0;
     oDATA_x <=   400 ;
	oDATA_y <=   240 ;
     cnt <= 0;
    end
  else
   begin
    oDVAL <= iDVAL;
    
    if (iDVAL)
	   begin
         if (x_cnt >=0 && x_cnt <=X_START  &&  y_cnt >=0  && y_cnt<= Y_START)
             cnt <= 0;
         else if (sum > 400 &&  cnt ==0)
         begin
         oDATA_x <=   x_cnt-X_START-19 ;
		 oDATA_y <=   y_cnt -Y_START-24 ;
		 cnt <= 1;
		 end
		end
	else  
	 begin
	 if (x_cnt >=0 && x_cnt <=X_START  &&  y_cnt >=0  && y_cnt<= Y_START)
             cnt <= 0;
      else
       begin
       oDATA_x <=   oDATA_x ;
	   oDATA_y <=   oDATA_y ;
       end	
  end
end
*/

always@(posedge iCLK, negedge iRST_N) 
begin
  if (!iRST_N)
    begin
     oDVAL <= 0;

    end
  else
   begin
    oDVAL <= iDVAL;
    
  end
end


reg  cnt;
reg	[2:0]	next_state, state;
reg set,set_eye;
reg load,load_eye;
reg [10:0] oDATA_x_temp,oDATA_x_eye_temp;
reg [9:0] oDATA_y_temp,oDATA_y_eye_temp;
parameter	x_IDLE	= 3'b000,	x_START	= 3'b010,
			x_WAIT	= 3'b011,	x_SHIFT	= 3'b100,
			x_STOP	= 3'b101;
 
reg			  cnt_data;
reg			  load_cnt; 
		 		
always @(posedge iCLK, negedge iRST_N)
begin
  if (~iRST_N) state <= x_IDLE;
  else state <= next_state;
end



// Next State
always @(state or iDVAL or cnt or    oDATA_x or x_cnt or y_cnt or sum)
begin
 

	case (state)
    	// x_IDLE
		// wait for the start command
			x_IDLE:
			begin
		       
		       // oDATA_x <=   400;
		       // oDATA_y <=   240 ;
				 //oDATA_x_eye <=   0;
		       //oDATA_y_eye <=   0 ;
				  set_eye <=1;
				  load_eye<=0;
				  set<=1;
				  load<=0;
				  next_state <= x_START;
				 
				  cnt_data=0;
				  load_cnt =1; 
		        end
    		 
	       
		 x_START:
			begin
		//	if (x_cnt ==0 &&  y_cnt < 10)
			if (   y_cnt < 10)

				 begin
				 set_eye <=0;
				 load_eye<=0;
				 set<=0;
				 cnt_data=0;
				 load_cnt =1; 
		   
				 load <=0;
				 next_state <= x_START;
				 end 
       //    else if (iDVAL    )
	        else if (iDVAL  && x_cnt >0    && y_cnt >=10  && x_cnt <=800       )
	         begin
           
            if (sum > 400 &&  cnt ==0) //350
             begin
      //      oDATA_x <=   x_cnt-X_START-19 ;
		//      oDATA_y <=   y_cnt -Y_START-24 ;
		        oDATA_x_temp <=   x_cnt;
		        oDATA_y_temp <=   y_cnt ;
				  set_eye <=0;
				  load_eye<=0;
				  set<=0;
				  load<=1;
		        cnt_data=1;
				  load_cnt =1; 
		   
				  next_state <= x_WAIT;
		       end
    		   else  
				 begin
	          set_eye <=0;
			    load_eye<=0;
			    set<=0;
			    load<=0;
				   cnt_data=0;
				  load_cnt =0; 
			    next_state <= x_START;
             end
	        end
			  else
			    begin
	          set_eye <=0;
			    load_eye<=0;
			    set<=0;
			    load<=0;
				   cnt_data=0;
				  load_cnt =0; 
			    next_state <= x_START;
             end
			  
       end
  		// x_START
		// send start bit 
			x_WAIT:
			begin
		 
          if ( x_cnt >0 && x_cnt <= 700 &&  y_cnt >= 10  )
	  //    if ( x_cnt >oDATA_x && x_cnt <=X_START+800-200  &&  y_cnt >= Y_START+19   &&  y_cnt <= Y_START+480-80)
	         begin
				 
             if ( sum < 50 && cnt ==1 )
              begin
           //    oDATA_x_eye <=   x_cnt-X_START-19 ;
		     //    oDATA_y_eye <=   y_cnt -Y_START-24 ;
					oDATA_x_eye_temp <=   x_cnt ;
		         oDATA_y_eye_temp <=   y_cnt ;
				    set_eye <=0;
				    load_eye<=1;
				    set<=0;
				    load<=0;
		          cnt_data=1;
				    load_cnt =1; 
				    next_state <= x_START;
		        end
				 else
				   begin
					 set_eye <=0;
				    load_eye<=0;
				    set<=0;
				    load<=0;
				      cnt_data=0;
				  load_cnt =0; 
			   	 next_state <= x_WAIT;
					end 
    		   end  
	        else  
			     begin
				  set_eye <=0;
				  load_eye<=0;
				  set<=0;
				  load<=0;
			    cnt_data=0;
				  load_cnt =0; 
		        next_state <= x_WAIT;
				  end
				  
			end
	
		default: 
		begin
			 next_state <= 3'bxxx;
			 set_eye <=0;
			 load_eye<=0;
			 set<=0;
			 load<=0;
			   cnt_data=0;
				  load_cnt =0; 
		 	 oDATA_x_temp <=   400 ;
		    oDATA_y_temp <=  240;
		    oDATA_x_eye_temp <=   400;
		    oDATA_y_eye_temp <=  240 ;
		     
		end
    endcase


end
 
	
always@(posedge iCLK )
begin

if( load_cnt ==1)

cnt<=  cnt_data ;

else

cnt <= cnt; 
end
 

always@(posedge iCLK )
begin

if(set==1)
begin
 oDATA_x <=  400 ;
 oDATA_y <= 240 ;
end
else if (load ==1)
begin
oDATA_x <=  oDATA_x_temp ;
 oDATA_y <=  oDATA_y_temp ;
 end
else
begin
oDATA_x <=  oDATA_x ;
 oDATA_y <=  oDATA_y ;
end
end

always@(posedge iCLK )
begin

if(set_eye==1)
begin
 oDATA_x_eye <=20 ;
 oDATA_y_eye <=24 ;
end
else if (load_eye ==1)
begin
oDATA_x_eye <=  oDATA_x_eye_temp ;
 oDATA_y_eye <=  oDATA_y_eye_temp ;
end
 else
 begin
oDATA_x_eye <=  oDATA_x_eye ;
 oDATA_y_eye <=  oDATA_y_eye ;
end

end








endmodule
