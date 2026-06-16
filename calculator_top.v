
module calculator_top(
    input  wire       clk,
    input  wire [3:0] a,        // DIP Switch A (active low)
    input  wire [3:0] b,        // DIP Switch B (active low)
    output wire [6:0] SEG,      // segment a-g (active low)
    output wire [3:0] DIG       // digit select (active low)
);
    // Balik input active low → active high
    wire [3:0] A = ~a;
    wire [3:0] B = ~b;

    // Penjumlahan langsung (realtime)
    wire [4:0] sum = A + B;

    // BCD Converter
    wire [3:0] tens, units;
    bcd_converter u_bcd(
        .BIN   (sum),
        .TENS  (tens),
        .UNITS (units)
    );

    // 7-Segment Multiplexer
    seg_mux u_mux(
        .clk   (clk),
        .tens  (tens),
        .units (units),
        .SEG   (SEG),
        .DIG   (DIG)
    );
endmodule