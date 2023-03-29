`timescale 1ns/1ps

module alu_tb;

  // Parámetros del test bench
  parameter WIDTH = 4;

  // Entradas del test bench
  logic [WIDTH-1:0] a;
  logic [WIDTH-1:0] b;
  logic [4:0] uc;

  // Salida del test bench
  logic [WIDTH-1:0] result;
  logic [3:0] flags;

  // Instancia de la ALU
  alu #(WIDTH) dut(.a(a), .b(b), .uc(uc), .result(result), 
  .n(flags[3]), .z(flags[2]), .c(flags[1]), .v(flags[0]));

  // Generación de estímulos
  initial begin
    // Test de AND
    a = 4'b0010;
    b = 4'b1100;
    uc = 3'b000;
    #10;
    if(result !== 4'b0000) $error("Test de AND fallido");
    if(flags !== 4'b0010) $error("Banderas de AND incorrectas");

    // Test de OR
    a = 4'b0010;
    b = 4'b1100;
    uc = 3'b001;
    #10;
    if(result !== 4'b1110) $error("Test de OR fallido");
    if(flags !== 4'b0000) $error("Banderas de OR incorrectas");

    // Test de SUMA
    a = 4'b0010;
    b = 4'b1100;
    uc = 3'b010;
    #10;
    if(result !== 4'b1110) $error("Test de SUMA fallido");
    if(flags !== 4'b1000) $error("Banderas de SUMA incorrectas");

    // Test de RESTA
    a = 4'b0010;
    b = 4'b1100;
    uc = 3'b011;
    #10;
    if(result !== 4'b1110) $error("Test de RESTA fallido");
    if(flags !== 4'b0110) $error("Banderas de RESTA incorrectas");

    $display("Todos los tests pasaron");
    $finish;
  end

endmodule
