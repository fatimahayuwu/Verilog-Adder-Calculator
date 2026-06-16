module seg_mux(
    input  wire       clk,
    input  wire [3:0] tens,
    input  wire [3:0] units,
    output reg  [6:0] SEG,
    output reg  [3:0] DIG
);
    // Clock divider 50MHz ke 1kHz
    reg [15:0] clk_div;
    reg        scan_clk;

    always @(posedge clk) begin
        if (clk_div == 16'd24999) begin
            clk_div  <= 16'd0;
            scan_clk <= ~scan_clk;
        end else
            clk_div <= clk_div + 1;
    end

    // Scan digit
    always @(posedge clk) begin
        if (scan_clk == 1'b0) begin
            DIG <= 4'b1110;       // DIG1 aktif (PIN 133) → satuan
            SEG <= seg7(units);
        end else begin
            DIG <= 4'b1101;       // DIG2 aktif (PIN 135) → puluhan
            SEG <= seg7(tens);
        end
    end

    // Decoder 7-segment active low {g,f,e,d,c,b,a}
    function [6:0] seg7;
        input [3:0] d;
        case (d)
            4'd0: seg7 = 7'b1000000;
            4'd1: seg7 = 7'b1111001;
            4'd2: seg7 = 7'b0100100;
            4'd3: seg7 = 7'b0110000;
            4'd4: seg7 = 7'b0011001;
            4'd5: seg7 = 7'b0010010;
            4'd6: seg7 = 7'b0000010;
            4'd7: seg7 = 7'b1111000;
            4'd8: seg7 = 7'b0000000;
            4'd9: seg7 = 7'b0010000;
            default: seg7 = 7'b1111111;
        endcase
    endfunction
endmodule