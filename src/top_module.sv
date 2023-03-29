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

    parameter WIDTH = 4;

    logic [WIDTH-1:0] sync_a;
    logic [WIDTH-1:0] sync_b;
    logic [3:0] sync_uc;
    logic [WIDTH-1:0] result;
    logic [3:0] flags;

    input_synchronizer #(.WIDTH(WIDTH)) synchronizer_a (
        .clk(clk),
        .reset(reset),
        .d(a),
        .q(sync_a)
    );

    input_synchronizer #(.WIDTH(WIDTH)) synchronizer_b (
        .clk(clk),
        .reset(reset),
        .d(b),
        .q(sync_b)
    );

    input_synchronizer #(.WIDTH(WIDTH)) synchronizer_uc (
        .clk(clk),
        .reset(reset),
        .d(uc),
        .q(sync_uc)
    );

    // Resto del código...
endmodule
