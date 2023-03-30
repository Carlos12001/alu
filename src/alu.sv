module alu #(parameter WIDTH = 4)(
  input logic [WIDTH-1:0] a,
  input logic [WIDTH-1:0] b,
  input logic [3:0] uc,
  output logic [WIDTH-1:0] result,
  output logic n,
  output logic z,
  output logic c,
  output logic v
);

  logic [WIDTH:0] temp;
  logic carry;
  logic overflow;

  // Operacion seleccionada por el código de control
  always_comb begin
    case(uc)
      4'b0000: temp = {1'b0, a} + {1'b0, b}; // Add
      4'b0001: temp = {1'b0, a} - {1'b0, b}; // Sub
      4'b0010: temp = a * b;                // Mult
      4'b0011: begin             // Div
        if (b == 0) begin
          temp = {1'b0, {WIDTH{1'b0}}};
        end else begin
          temp = a / b;
        end
      end
      4'b0100:  begin            // Mod
        if (b == 0) begin
          temp = {1'b0, {WIDTH{1'b0}}};
        end else begin
          temp = a % b;
        end
      end
      4'b0101: temp = a & b;                // AND
      4'b0110: temp = a | b;                // OR
      4'b0111: temp = a ^ b;                // XOR
      4'b1000: temp = a << b;               // Shift left
      default: temp = {1'b0, {WIDTH{1'b0}}}; // Not operation
    endcase
  end

  // Almacenamiento del resultado y los flags
  always_comb begin
    result = temp[WIDTH-1:0];
    carry = temp[WIDTH];
	 
    if (uc == 4'b0010) begin
		  overflow = ((a*b) > 31) ;
    end else begin
      overflow = 0;
    end
   
    if (uc == 4'b0001) begin         
      n = temp[WIDTH];
      result =  n ? (~temp)+1 : result;
      c = 0;
    end else begin
      n = 0;
      c = carry;
    end
    z = result == 0;
    v = overflow;
  end

endmodule
