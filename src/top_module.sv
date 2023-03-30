module top_module(
    input logic clk,
    input logic reset,
    input logic change_switches,
    input logic [3:0] a,
    input logic [3:0] b,
    input logic [3:0] uc,
    output logic [6:0] display_units,
    output logic [6:0] display_tens,
    output logic [6:0] display_sign,
    output logic [3:0] leds_result,
    output logic [3:0] leds_flags
);
	 
	// Instancia de la ALU
	alu #(4) dut(.a(a), .b(b), .uc(uc), .result(leds_result), 
                    .n(leds_flags[3]),
				    .z(leds_flags[2]),
				    .c(leds_flags[1]),
				    .v(leds_flags[0]));

    

    // Resto del código...
endmodule
