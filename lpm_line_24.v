module lpm_line_24 (
	clken,
	clock,
	shiftin,
	shiftout,
	taps0x,
	taps1x,
	taps2x,
	taps3x,
	taps4x,
	taps5x,
	taps6x,
	taps7x,
	taps8x,
	taps9x,
	taps10x,
	taps11x,
	taps12x,
	taps13x,
	taps14x,
	taps15x,
	taps16x,
	taps17x,
	taps18x,
	taps19x,
	 taps20x,
	taps21x,
		taps22x,
	taps23x
	);

	input	  clken;
	input	  clock;
	input	[7:0]  shiftin;
	output	[7:0]  shiftout;
	 //output	[191:0]  taps;
	output	[7:0]  taps0x;
	output	[7:0]  taps1x;
	output	[7:0]  taps2x;
   output	[7:0]  taps3x;
	output	[7:0]  taps4x;
	output	[7:0]  taps5x;
	output	[7:0]  taps6x;
	output	[7:0]  taps7x;
	output	[7:0]  taps8x;
	output	[7:0]  taps9x;
	output	[7:0]  taps10x;
	output	[7:0]  taps11x;
	output	[7:0]  taps12x;
	output	[7:0]  taps13x;
	output	[7:0]  taps14x;
	output	[7:0]  taps15x;
	output	[7:0]  taps16x;
	output	[7:0]  taps17x;
	output	[7:0]  taps18x;
	output	[7:0]  taps19x;
	output	[7:0]  taps20x;
	output	[7:0]  taps21x;
	output	[7:0]  taps22x;
	output	[7:0]  taps23x;
	wire [7:0] sub_wire0;
	wire [191:0] sub_wire1;
	wire [7:0] shiftout = sub_wire0[7:0];
	//wire [191:0] taps = sub_wire1[191:0];
  	 wire [7:0] taps23x = sub_wire1[191:184];
	wire [7:0] taps22x = sub_wire1[183:176];
	wire [7:0] taps21x = sub_wire1[175:168];
	 wire [7:0] taps20x = sub_wire1[167:160];
	wire [7:0] taps19x = sub_wire1[159:152];
	wire [7:0] taps18x = sub_wire1[151:144];
	 wire [7:0] taps17x = sub_wire1[143:136];
	wire [7:0] taps16x = sub_wire1[135:128];
	wire [7:0] taps15x = sub_wire1[127:120];
	 wire [7:0] taps14x = sub_wire1[119:112];
	wire [7:0] taps13x = sub_wire1[111:104];
	wire [7:0] taps12x = sub_wire1[103:96];
	 wire [7:0] taps11x = sub_wire1[95:88];
	wire [7:0] taps10x = sub_wire1[87:80];
	wire [7:0] taps9x = sub_wire1[79:72];
	 wire [7:0] taps8x = sub_wire1[71:64];
	wire [7:0] taps7x = sub_wire1[63:56];
	wire [7:0] taps6x = sub_wire1[55:48];
	 wire [7:0] taps5x = sub_wire1[47:40];
	wire [7:0] taps4x = sub_wire1[39:32];
	wire [7:0] taps3x = sub_wire1[31:24];
   wire [7:0] taps2x = sub_wire1[23:16];
	wire [7:0] taps1x = sub_wire1[15:8];
	wire [7:0] taps0x = sub_wire1[7:0];
	altshift_taps	ALTSHIFT_TAPS_component (
				.clock (clock),
				.clken (clken),
				.shiftin (shiftin),
				.shiftout (sub_wire0),
				.taps (sub_wire1)
				// synopsys translate_off
				,
				.aclr ()
				// synopsys translate_on
				);
	defparam
		ALTSHIFT_TAPS_component.intended_device_family = "Cyclone II",
		ALTSHIFT_TAPS_component.lpm_hint = "RAM_BLOCK_TYPE=M4K",
		ALTSHIFT_TAPS_component.lpm_type = "altshift_taps",
		ALTSHIFT_TAPS_component.number_of_taps = 24,
		ALTSHIFT_TAPS_component.power_up_state = "CLEARED",
		ALTSHIFT_TAPS_component.tap_distance = 800,
		ALTSHIFT_TAPS_component.width = 8;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: CONSTANT: LPM_HINT STRING "RAM_BLOCK_TYPE=M4K"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altshift_taps"
// Retrieval info: CONSTANT: NUMBER_OF_TAPS NUMERIC "24"
// Retrieval info: CONSTANT: POWER_UP_STATE STRING "CLEARED"
// Retrieval info: CONSTANT: TAP_DISTANCE NUMERIC "800"
// Retrieval info: CONSTANT: WIDTH NUMERIC "8"
// Retrieval info: USED_PORT: clken 0 0 0 0 INPUT NODEFVAL "clken"
// Retrieval info: CONNECT: @clken 0 0 0 0 clken 0 0 0 0
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: USED_PORT: shiftin 0 0 8 0 INPUT NODEFVAL "shiftin[7..0]"
// Retrieval info: CONNECT: @shiftin 0 0 8 0 shiftin 0 0 8 0
// Retrieval info: USED_PORT: shiftout 0 0 8 0 OUTPUT NODEFVAL "shiftout[7..0]"
// Retrieval info: CONNECT: shiftout 0 0 8 0 @shiftout 0 0 8 0
// Retrieval info: USED_PORT: taps 0 0 192 0 OUTPUT NODEFVAL "taps[191..0]"
// Retrieval info: CONNECT: taps 0 0 192 0 @taps 0 0 192 0
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_line.v TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_line.qip TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_line.bsf TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_line_inst.v TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_line_bb.v TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_line.inc TRUE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_line.cmp TRUE TRUE
// Retrieval info: LIB_FILE: altera_mf
