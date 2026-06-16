module bcd_converter(
    input  wire [4:0] BIN,
    output reg  [3:0] TENS,
    output reg  [3:0] UNITS
);
    always @(*) begin
        case (BIN)
            5'd30: begin TENS = 4'd3; UNITS = 4'd0; end
            5'd29: begin TENS = 4'd2; UNITS = 4'd9; end
            5'd28: begin TENS = 4'd2; UNITS = 4'd8; end
            5'd27: begin TENS = 4'd2; UNITS = 4'd7; end
            5'd26: begin TENS = 4'd2; UNITS = 4'd6; end
            5'd25: begin TENS = 4'd2; UNITS = 4'd5; end
            5'd24: begin TENS = 4'd2; UNITS = 4'd4; end
            5'd23: begin TENS = 4'd2; UNITS = 4'd3; end
            5'd22: begin TENS = 4'd2; UNITS = 4'd2; end
            5'd21: begin TENS = 4'd2; UNITS = 4'd1; end
            5'd20: begin TENS = 4'd2; UNITS = 4'd0; end
            5'd19: begin TENS = 4'd1; UNITS = 4'd9; end
            5'd18: begin TENS = 4'd1; UNITS = 4'd8; end
            5'd17: begin TENS = 4'd1; UNITS = 4'd7; end
            5'd16: begin TENS = 4'd1; UNITS = 4'd6; end
            5'd15: begin TENS = 4'd1; UNITS = 4'd5; end
            5'd14: begin TENS = 4'd1; UNITS = 4'd4; end
            5'd13: begin TENS = 4'd1; UNITS = 4'd3; end
            5'd12: begin TENS = 4'd1; UNITS = 4'd2; end
            5'd11: begin TENS = 4'd1; UNITS = 4'd1; end
            5'd10: begin TENS = 4'd1; UNITS = 4'd0; end
            default: begin TENS = 4'd0; UNITS = BIN[3:0]; end
        endcase
    end
endmodule