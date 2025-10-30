module suraj12 (
    input wire clk,         // External clock input
    input wire reset,       // Active-high asynchronous reset
    output wire [3:0] count // 4-bit counter output
);

    wire [3:0] q;           // Internal flip-flop outputs

    // First flip-flop triggered by external clock
    T_FF ff0 (.clk(clk),     .reset(reset), .q(q[0]));
    // Next flip-flops triggered by previous output
    T_FF ff1 (.clk(q[0]),    .reset(reset), .q(q[1]));
    T_FF ff2 (.clk(q[1]),    .reset(reset), .q(q[2]));
    T_FF ff3 (.clk(q[2]),    .reset(reset), .q(q[3]));

    assign count = q;

endmodule

// T Flip-Flop module
module T_FF (
    input wire clk,
    input wire reset,
    output reg q
);

    always @(negedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= ~q;
    end

endmodule