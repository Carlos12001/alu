module top_module(
    input logic clk,
    input logic reset,
    input logic change_switches,
    input logic [7:0] switches,
    output logic [6:0] display_units,
    output logic [6:0] display_tens,
    output logic [6:0] display_sign,
    output logic [3:0] result,
    output logic [3:0] flags
);
    parameter WIDTH = 4;
    // Asignar las entradas de la ALU según el mapeo de los switches
    logic a;
    logic b;
    logic uc;
    logic [WIDTH-1:0] num_units;
    logic [WIDTH-1:0] num_tens;

   always @(*) begin
        if (change_switches) begin
            uc = switches[7:4];
				flags = a;
        end else begin
				flags = 0;
            a = switches[7:4];
            b = switches[3:0];
        end
   end
	
/*	
	alu #(WIDTH) dut(
        .a(a),
        .b(b),
        .uc(uc),
        .result(result), 
        .n(flags[3]),
        .z(flags[2]),
        .c(flags[1]),
        .v(flags[0])
    );
	 */


     bin_converter uut_converter(
        .bin({1'b0, a}),
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
		.n(1'b1),  
		.seg(display_sign)
	);


endmodule
