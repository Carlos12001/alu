module top_module(
    input logic change_switches,
    input logic [7:0] switches,
    output logic [6:0] display_units,
    output logic [6:0] display_tens,
    output logic [6:0] display_sign,
    output logic [3:0] result,
    output logic [3:0] flags,
	 output	logic [1:0] leftover_leds
);	

    // Asignar las entradas de la ALU según el mapeo de los switches
    logic [3:0] a;
    logic [3:0] b;
    logic [3:0] uc;
    logic [3:0] num_units;
    logic [3:0] num_tens;

   always @(*) begin
			leftover_leds = 2'b00;
        if (change_switches) begin
            uc = switches[7:4];
        end else begin;
            a = switches[7:4];
            b = switches[3:0];
        end
   end
	

	alu #(4) dut(
        .a(a),
        .b(b),
        .uc(uc),
        .result(result), 
        .n(flags[3]),
        .z(flags[2]),
        .c(flags[1]),
        .v(flags[0])
    );


     bin_converter uut_converter(
        .bin({flags[1], result}),
        .bin_unit(num_units),
        .bin_ten(num_tens)
    );

    // unit segments
    bin_to_bcd_decoder uut_unit_d(
        .bin_number(num_units),
        .bcd_number(display_units)
    );

    // ten segments
    bin_to_bcd_decoder uut_ten_d(
        .bin_number(num_tens),
        .bcd_number(display_tens)
    );
	 
	sign_to_display uut_sign(
		.n(flags[3]),  
		.seg(display_sign)
	);


endmodule
