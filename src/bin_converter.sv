module bin_converter (
    input logic [4:0] bin,
    output logic [3:0] bin_unit,
    output logic [3:0] bin_ten
);



	function logic [4:0] to_decimal;
		 input logic [4:0] binary;
		 to_decimal =   binary[0] + 2*binary[1] + 4*binary[2] + 
                        8*binary[3] + 16*binary[4];
	endfunction

	logic [4:0] decimal_value;
	logic [3:0] units;
   logic [3:0] tens;
	always_comb begin
		// Convertir el numero binario de 6 bits a un numero decimal
		decimal_value = to_decimal(bin);

		// Calcular las unidades y las decenas en decimal
		units = decimal_value % 10;
		tens = decimal_value / 10;

		// Convertir las unidades y las decenas a binario
		bin_unit = units;
		bin_ten = tens;
	end

endmodule
