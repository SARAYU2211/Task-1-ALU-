`timescale 1ns/1ps

module alu_tb;
    reg [3:0] a, b;
    reg [2:0] sel;
    wire [3:0] y;

    alu uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Monitor signals
        $monitor("Time=%0d, a=%b, b=%b, sel=%b, y=%b", $time, a, b, sel, y);

        // Test Addition
        a = 4'b0011; b = 4'b0101; sel = 3'b000; #10;
        // Test Subtraction
        a = 4'b1001; b = 4'b0011; sel = 3'b001; #10;
        // Test AND
        a = 4'b1100; b = 4'b1010; sel = 3'b010; #10;
        // Test OR
        a = 4'b1100; b = 4'b1010; sel = 3'b011; #10;
        // Test NOT
        a = 4'b1010; b = 4'b0000; sel = 3'b100; #10;
        // Test Default
        a = 4'b1111; b = 4'b0001; sel = 3'b101; #10;

        $finish;
    end
endmodule
