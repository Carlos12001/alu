`timescale 1ns / 1ps

module tb_bin_converter;

    logic [4:0] bin_6;
    logic [3:0] bin_unit;
    logic [3:0] bin_ten;

    // Instancia del módulo bin_converter
    bin_converter my_bin_converter (
        .bin(bin_6),
        .bin_unit(bin_unit),
        .bin_ten(bin_ten)
    );

    initial begin
        // Caso de prueba 1: bin_6 = 6'b10111
        bin_6 = 5'b10111;
        #10;
        $display("Caso de prueba 1: bin_6 = 10111");
        $display("bin_unit = %b", bin_unit);
        $display("bin_ten = %b", bin_ten);
        $display("");

        // Caso de prueba 2: bin_6 = 6'b100111
        bin_6 = 5'b10011;
        #10;
        $display("Caso de prueba 2: bin_6 = 10011");
        $display("bin_unit = %b", bin_unit);
        $display("bin_ten = %b", bin_ten);
        $display("");

        // Caso de prueba adicional: bin_6 = 6'b010101
        bin_6 = 5'b01001;
        #10;
        $display("Caso de prueba adicional: bin_6 = 01001");
        $display("bin_unit = %b", bin_unit);
        $display("bin_ten = %b", bin_ten);
        $display("");

        // Finalizar simulación
        $finish;
    end

endmodule