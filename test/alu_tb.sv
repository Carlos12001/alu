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
  // Variable para almacenar el valor de result y c
  logic [WIDTH:0] num = 0;

  

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
    num = {c, result};
    if(num !== 14) $error("Test de suma fallido");


     // Test de suma
    a = 15;
    b = 6;
    uc = 4'b0000;
    #10;
    num = {c, result};
    if(num !== 21) $error("Test de suma fallido");

    // Test de suma
    a = 15;
    b = 15;
    uc = 4'b0000;
    #10;
    num = {c, result};
    if(num !== 30 || v==1) $error("Test de suma fallido");

    // Test de resta
    a = 12;
    b = 2;
    uc = 4'b0001;
    #10;
    num = {c, result};
    if({n, num} !== 10) $error("Test de resta fallido");
	 
	// Test de resta
    a = 2;
    b = 12;
    uc = 4'b0001;
    #10;
    num = {c, result};
    if({n, num} !== -10) $error("Test de resta fallido");

    // Test de multiplicacion
    a = 2;
    b = 2;
    uc = 4'b0010;
    #10;
    num = {c, result};
    if(num !== 4) $error("Test de multiplicacion fallido");


     // Test de multiplicacion
    a = 8;
    b = 8;
    uc = 4'b0010;
    #10;
    num = {c, result};
    if(v !== 1) $error("Test de multiplicacion fallido");

      // Test de multiplicacion
    a = 8;
    b = 9;
    uc = 4'b0010;
    #10;
    num = {c, result};
    if(v !== 1) $error("Test de multiplicacion fallido");
	 
	 
    // Test de division
    a = 6;
    b = 3;
    uc = 4'b0011;
    #10;
    num = {c, result};
    if(num !== 2) $error("Test de division fallido");

    // Test de division por cero
    a = 2;
    b = 4'b0000;
    uc = 4'b0011;
    #10;
    num = {c, result};
    if(num !== 0) $error("Test de division por cero fallido");

    // Test de modulo
    a = 5;
    b = 2;
    uc = 4'b0100;
    #10;
    num = {c, result};
    if(num !== 1) $error("Test de modulo fallido");

    // Test de modulo por cero
    a = 6;
    b = 0;
    uc = 4'b0100;
    #10;
    num = {c, result};
    if(num !== 0) $error("Test de modulo por cero fallido");

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
    a = 4'b0110;
    b = 4'b0010;
    uc = 4'b1000;
    #10;
    if({c, result} !== 5'b11000) $error("Test de ShiftL fallido");

    // Test de ShiftL
    a = 4'b0001;
    b = 4'b0010;
    uc = 4'b1000;
    #10;
    if({c, result} !== 5'b00100) $error("Test de ShiftL fallido");

    // Finalizar el test bench
    $display("Todos los tests pasaron exitosamente.");
    $finish;
  end

endmodule
