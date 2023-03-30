`timescale 1ns/1ps

module alu_tb;

  // Parometros del test bench
  parameter WIDTH = 4;

  // Entradas del test bench
  logic [WIDTH-1:0] a;
  logic [WIDTH-1:0] b;
  logic [3:0] uc;

  // Salidas del test bench
  logic [WIDTH-1:0] result;
  logic n;
  logic z;
  logic c;
  logic v;

  // Instancia de la ALU
  alu #(WIDTH) dut(.a(a), .b(b), .uc(uc), .result(result), 
                .n(n), .z(z), .c(c), .v(v));

  // Generacion de estomulos
  initial begin
    // Test de suma
    a = 12;
    b = 2;
    uc = 4'b0000;
    #10;
    if(result !== 14) $error("Test de suma fallido");

    // Test de resta
    a = 12;
    b = 2;
    uc = 4'b0001;
    #10;
    if(result !== 10) $error("Test de resta fallido");

    // Test de multiplicacion
    a = 2;
    b = 2;
    uc = 4'b0010;
    #10;
    if(result !== 4) $error("Test de multiplicacion fallido");

    // Test de division
    a = 6;
    b = 3;
    uc = 4'b0011;
    #10;
    if(result !== 2) $error("Test de division fallido");

    // Test de division por cero
    a = 2;
    b = 4'b0000;
    uc = 4'b0011;
    #10;
    if(result !== 0) $error("Test de division por cero fallido");

    // Test de modulo
    a = 5;
    b = 2;
    uc = 4'b0100;
    #10;
    if(result !== 1) $error("Test de modulo fallido");

    // Test de modulo por cero
    a = 6;
    b = 0;
    uc = 4'b0100;
    #10;
    if(result !== 0) $error("Test de modulo por cero fallido");

    // Test de AND
    a = 4'b0010;
    b = 4'b1100;
    uc = 4'b0101;
    #10;
    if(result !== 4'b0000) $error("Test de AND fallido");

    // Test de OR
    a = 4'b0010;
    b = 4'b1100;
    uc = 4'b0110;
    #10;
    if(result !== 4'b1110) $error("Test de OR fallido");
    // Test de XOR
    a = 4'b1010;
    b = 4'b1100;
    uc = 4'b0111;
    #10;
    if(result !== 4'b0110) $error("Test de XOR fallido");

    // Test de ShiftL
    a = 4'b1010;
    b = 4'b0010;
    uc = 4'b1000;
    #10;
    if(result !== 4'b1000) $error("Test de ShiftL fallido");

    // Finalizar el test bench
    $display("Todos los tests pasaron exitosamente.");
    $finish;
  end

endmodule
