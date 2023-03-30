module sign_to_display(
    input logic n,
    output logic [6:0] seg
);
always @(*) begin
    case(n)	
//								    abcdefg
		0: 			seg = 7'b1111111; // positive
		1: 			seg = 7'b1111110; // negative
		default: 	seg = 7'b1111111; //default to 0
    endcase
end
endmodule