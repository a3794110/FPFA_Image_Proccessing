 // --------------------------------------------------------------------
// Copyright (c) 2011 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
 
 // nios OK

module DE0_Nano(

	//////////// CLOCK //////////
	CLOCK_50,

	//////////// LED //////////
	LED,

	//////////// KEY //////////
	KEY,

	//////////// SW //////////
	SW,

	//////////// SDRAM //////////
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_DQM,
	DRAM_RAS_N,
	DRAM_WE_N,
	
	//////////// ECPS //////////
	EPCS_ASDO,
	EPCS_DATA0,
	EPCS_DCLK,
	EPCS_NCSO,

	//////////// Accelerometer and EEPROM //////////
	G_SENSOR_CS_N,
	G_SENSOR_INT,
	I2C_SCLK,
	I2C_SDAT,

	//////////// ADC //////////
	ADC_CS_N,
	ADC_SADDR,
	ADC_SCLK,
	ADC_SDAT,

	//////////// 2x13 GPIO Header //////////
	GPIO_2,
	GPIO_2_IN,

	//////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
	GPIO0_0,
	GPIO0_1,
//	GPIO_0,
//	GPIO_0_IN,


	 		          		LT24_ADC_BUSY,//B8
			          		LT24_ADC_CS_N,//D12
		          		LT24_ADC_DCLK, //A2
		          		LT24_ADC_DIN,//C3
 		          		LT24_ADC_DOUT,//D3
 		          		LT24_ADC_PENIRQ_N,  //A8
		          		LT24_CS_N, //E9
	               	LT24_D,
			          		LT24_LCD_ON, //B12
			          		LT24_RD_N,//A5
			          		LT24_RESET_N, //D11
			          		LT24_RS,  //B6
			          		LT24_WR_N,//D5

	//////////// GPIO_1, GPIO_1 connect to GPIO Default //////////
//	GPIO_1,
//	GPIO_1_IN 

   D5M_D,
	D5M_FVAL,
	D5M_LVAL,
	D5M_PIXCLK,
	D5M_RESET_N,
	D5M_SCLK,
	D5M_SDATA,
	D5M_STROBE,
	D5M_TRIGGER,
	D5M_XCLKIN 
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input 		          		CLOCK_50;

//////////// LED //////////
output		     [7:0]		LED;

//////////// KEY //////////
input 		     [1:0]		KEY;

//////////// SW //////////
input 		     [3:0]		SW;

//////////// SDRAM //////////
output		    [12:0]		DRAM_ADDR;
output		     [1:0]		DRAM_BA;
output		          		DRAM_CAS_N;
output		          		DRAM_CKE;
output		          		DRAM_CLK;
output		          		DRAM_CS_N;
inout 		    [15:0]		DRAM_DQ;
output		     [1:0]		DRAM_DQM;
output		          		DRAM_RAS_N;
output		          		DRAM_WE_N;

//////////// EPCS //////////
output		          		EPCS_ASDO;
input 		          		EPCS_DATA0;
output		          		EPCS_DCLK;
output		          		EPCS_NCSO;

//////////// Accelerometer and EEPROM //////////
output		          		G_SENSOR_CS_N;
input 		          		G_SENSOR_INT;
output							I2C_SCLK;
inout 		          		I2C_SDAT;

//////////// ADC //////////
output		          		ADC_CS_N;
output		          		ADC_SADDR;
output		          		ADC_SCLK;
input 		          		ADC_SDAT;

//////////// 2x13 GPIO Header //////////
inout 		    [12:0]		GPIO_2;
input 		     [2:0]		GPIO_2_IN;

//////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
input GPIO0_0;
input GPIO0_1;
input 		          		LT24_ADC_BUSY;
	output		          		LT24_ADC_CS_N;
	output		          		LT24_ADC_DCLK;
	output		          		LT24_ADC_DIN;
	input 		          		LT24_ADC_DOUT;
	input 		          		LT24_ADC_PENIRQ_N;
	output		          		LT24_CS_N;
	inout 		    [15:0]		LT24_D;
	output		          		LT24_LCD_ON;
	output		          		LT24_RD_N;
	output		          		LT24_RESET_N;
	output		          		LT24_RS;
	output		          		LT24_WR_N;

//////////// GPIO_1, GPIO_1 connect to GPIO Defaul                     //////////
input 		    [11:0]		D5M_D;
input 		          		D5M_FVAL;
input 		          		D5M_LVAL;
input 		          		D5M_PIXCLK;
output		          		D5M_RESET_N;
output		          		D5M_SCLK;
inout 		          		D5M_SDATA;
input 		          		D5M_STROBE;
output		          		D5M_TRIGGER;
output		          		D5M_XCLKIN;

//=======================================================
//  REG/WIRE declarations
//=======================================================
wire reset_n;
wire select_i2c_clk;
wire i2c_clk;
wire spi_clk;



//=======================================================
//  Structural coding
//=======================================================

assign reset_n = 1'b1;
 


	wire capture_CLK;
	wire fifo_aclr;				  
   assign I2C_SCLK = (select_i2c_clk)?i2c_clk:spi_clk;


////

//	CCD

wire  [11:0]  CCD_DATA;
wire          CCD_SDAT;
wire          CCD_SCLK;
wire          CCD_FLASH;
wire          CCD_FVAL;
wire          CCD_LVAL;
wire          CCD_PIXCLK;
wire          CCD_MCLK; //  CCD Master Clock

wire  [15:0]  Read_DATA1;
wire  [15:0]  Read_DATA2;
wire          VGA_CTRL_CLK;
wire  [11:0]  mCCD_DATA;
wire          mCCD_DVAL;
wire          mCCD_DVAL_d;
wire  [15:0]  X_Cont;
wire  [15:0]  Y_Cont;
wire  [9:0]   X_ADDR;
wire  [31:0]  Frame_Cont;
wire          DLY_RST_0;
wire          DLY_RST_1;
wire          DLY_RST_2;
wire          Read;
reg   [11:0]  rCCD_DATA;
reg           rCCD_LVAL;
reg           rCCD_FVAL;
wire  [11:0]  sCCD_R;
wire  [11:0]  sCCD_G;
wire  [11:0]  sCCD_B;
wire          sCCD_DVAL;
reg   [2:0]   rClk;
wire          sdram_ctrl_clk;



//=======================================================
//  Structural coding
//=======================================================
assign LTM_GREST      = 1'b1;

assign D5M_XCLKIN=	CCD_MCLK;
assign	CCD_DATA[0]		=	D5M_D[0];
assign	CCD_DATA[1]		=	D5M_D[1];
assign	CCD_DATA[2]		=	D5M_D[2];
assign	CCD_DATA[3]		=	D5M_D[3];
assign	CCD_DATA[4]		=	D5M_D[4];
assign	CCD_DATA[5]		=	D5M_D[5];
assign	CCD_DATA[6]		=	D5M_D[6];
assign	CCD_DATA[7]		=	D5M_D[7];
assign	CCD_DATA[8]		=	D5M_D[8];
assign	CCD_DATA[9]		=	D5M_D[9];
assign	CCD_DATA[10]	=	D5M_D[10];
assign	CCD_DATA[11]	=	D5M_D[11];
assign	CCD_FVAL		=	D5M_FVAL;
assign	CCD_LVAL		=	D5M_LVAL;
assign	CCD_PIXCLK		=	D5M_PIXCLK;
assign	D5M_TRIGGER		=	1'b1;  			// tRIGGER
assign	D5M_RESET_N		=	DLY_RST_1;

//assign	CCD_MCLK 		=	rClk[0];
assign	CCD_MCLK 		=	rClk[1];
//assign	CCD_MCLK 		=	rClk[2];
//assign	CCD_MCLK 		=	dec;

always@(posedge CLOCK_50)	rClk	<=	rClk+1;

 
always@(posedge CCD_PIXCLK)
begin
	rCCD_DATA	<=	CCD_DATA;
	rCCD_LVAL	<=	CCD_LVAL;
	rCCD_FVAL	<=	CCD_FVAL;
end
 
Reset_Delay			u2	(	.iCLK(CLOCK_50),
						//	.iRST(r_BUTTON0),
						   .iRST(KEY[0]),
							.oRST_0(DLY_RST_0),
							.oRST_1(DLY_RST_1),
							.oRST_2(DLY_RST_2)
						);
						

 


CCD_Capture capture0 (
  .oDATA(mCCD_DATA),
  .oDVAL(mCCD_DVAL),
  .oX_Cont(X_Cont),
  .oY_Cont(Y_Cont),
  .oFrame_Cont(Frame_Cont),
  .iDATA(rCCD_DATA),
  .iFVAL(rCCD_FVAL),
  .iLVAL(rCCD_LVAL),
  .iSTART(!KEY[1]),
  .iEND(SW[3]),
  .iCLK(CCD_PIXCLK),
  .iRST(DLY_RST_2)
);

//assign LED[3:0] = SW[3:0];   ////////////////////////////////////========================///////////////////////
		
wire Mirror = 1'b0;

		RAW2RGB raw0 (
  .iCLK(CCD_PIXCLK),
 .iRST_n(DLY_RST_1),
 //   .iRST_n(DLY_RST_0),
  .iData(mCCD_DATA),
  .iDval(mCCD_DVAL),
  .oRed(sCCD_R),
  .oGreen(sCCD_G),
  .oBlue(sCCD_B),
  .oDval(sCCD_DVAL),
  .iMIRROR(Mirror),
  .iX_Cont(X_Cont),
  .iY_Cont(Y_Cont)
);
 wire ltm_nclk;	
 wire  dec;
pll      upll 		( 	.inclk0(CLOCK_50),
							.c0( dec ),    
				//			.c1(DRAM_CLK), 
							.c2(sdram_ctrl_clk)//166MHz
						);
 
 

 
wire [9:0] wVGA_R = sCCD_R[11:2];
wire [9:0] wVGA_G = sCCD_G[11:2];
wire [9:0] wVGA_B =  sCCD_B[11:2];

 
 
 	
	 
wire [7:0] red, green, blue;
  I2C_CCD_Config ccd_config0 (
  //  Host Side
  .iCLK(CLOCK_50),
  .iRST_N(DLY_RST_1),
  .iEXPOSURE_ADJ(KEY[0]),
  .iEXPOSURE_DEC_p(1'b0),  //0 increase   1 decrease
   .iMIRROR_SW(Mirror),  
 //  I2C Side
  .I2C_SCLK(D5M_SCLK),
  .I2C_SDAT(D5M_SDATA)	
);




//////////////

 wire[1:0] DISPLAY_MODE;

 
 wire [119:0] TEMP;
motion_detect	inst11(		
					.iRST_n(DLY_RST_2),
					.clk(CLOCK_50),
					.iX_COORD({1'b0,DATA_x}),
					.TEMP(TEMP), 
					.out_count(DISPLAY_MODE),
		
					);
	//defparam	inst11.length = 120;				 
 
 
///////////////
 
 

/////////filter


wire [9:0] wBinary, wBinary_B,wBinary_G,wBinary_R;
wire wB;
redpassfilter instfilter(

    //// input ////  
    .wVGA_R(wVGA_R),
	 .wVGA_G(wVGA_G),
	 .wVGA_B(wVGA_B),
    //output
    .wBinary(wBinary),
    .wBinary_B(wBinary_B),
    .wBinary_R(wBinary_R),
    .wBinary_G(wBinary_G),
    .wB(wB) 	 
  
    ) ; 
					

// dilation
wire       wDVAL_dilation,wDVAL_dilation2;
wire [9:0] wDilation,wDilation2;


/*
Dilation dilation0 (
  .iCLK(CCD_PIXCLK),
 .iRST_N(DLY_RST_0),
  .iDVAL(sCCD_DVAL),
  .iDATA(wBinary),
  .oDVAL(wDVAL_dilation),
  .oDATA(wDilation) 

);

*/


wire        [10:0]  DATA_x,DATA_x_eye;
wire   [9:0]  DATA_y,   DATA_y_eye ;
 
////////////////


wire wDAL_block;
 block_found  block1(
.iCLK(CCD_PIXCLK), 
 .iRST_N(DLY_RST_2),
 .x_cnt(X_Cont[10:0]),
 .y_cnt(Y_Cont[9:0]),
 //.iDVAL(wDVAL_dilation),
 .iDVAL(sCCD_DVAL),
 //.iDATA(wDilation),
 .WB(wB),
 .oDVAL(wDAL_block),
 .oDATA_x(DATA_x),
 .oDATA_y(DATA_y) 
  

 ) ;
 
///////////////////////////////

reg new[1:0];
wire[1:0] new2;
assign new2[1] = new[1]; 
assign new2[0] = new[0];
 

always@(*)
begin
    case(SW[3])
      1'b1: begin
		      new[1]<=1*GPIO0_1;
				new[0]<=1*GPIO0_0; 
				end
	   //assign LED[7]=DISPLAY_MODE[1] ; //increas
      //assign LED[0]=DISPLAY_MODE[0]; //decrease
		1'b0:begin
		     new[1]<=DISPLAY_MODE[1];
			  new[0]<=DISPLAY_MODE[0];
			  end
	 endcase
end
 


 
motor_switch_v inst_right(.reset_n(reset_n), .clk(CLOCK_50), .SW(new2), .pwm_out(GPIO_2[10]));
 
motor_switch_v2 inst_left(.reset_n(reset_n), .clk(CLOCK_50), .SW(new2), .pwm_out(GPIO_2[11]));


endmodule
