module alu #(parameter WIDTH = 4) (
  input 	logic [WIDTH-1:0] a,
  input 	logic [WIDTH-1:0] b,
  input 	logic [4:0] uc,
  output  logic [WIDTH-1:0] result,
  output  logic n,
  output	logic	z, 
  output	logic	c,
  output	logic	v
);

  logic carry;

  always @(*) begin
    case(uc)
      5'b00000: begin   // AND
        result = a & b;
        n = result[WIDTH-1];
        z = result == 0;
        c = 0;
        v = 0;
      end
      5'b00001: begin   // OR
        result = a | b;
        n = result[WIDTH-1];
        z = result == 0;
        c = 0;
        v = 0;
      end
      5'b00010: begin   // SUM
        {carry, result} = a + b;
        n = result[WIDTH-1];
        z = result == 0;
        c = carry;
        v = (a[WIDTH-1] == b[WIDTH-1]) && (a[WIDTH-1] != result[WIDTH-1]);
      end
      5'b00011: begin   // RESTA
        {carry, result} = a - b;
        n = result[WIDTH-1];
        z = result == 0;
        c = ~carry;
        v = (a[WIDTH-1] != b[WIDTH-1]) && (a[WIDTH-1] != result[WIDTH-1]);
      end
      5'b00100: begin   // XOR
        result = a ^ b;
        n = result[WIDTH-1];
        z = result == 0;
        c = 0;
        v = 0;
      end
      default: begin    // NO_uc
        result = 0;
        n = 0;
        z = 0;
        c = 0;
        v = 0;
      end
    endcase
  end

endmodule
