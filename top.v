module top(
    input  [7:0] sw,
    output [5:0] led
);
    // Stairway light: sw[0], sw[1] -> led[0]
    light stairs (
        .downstairs(sw[0]),
        .upstairs(sw[1]),
        .stair_light(led[0])
    );

    // One-bit adder: sw[2], sw[3] -> led[1] (sum), led[2] (carry)
    adder one_bit (
        .A(sw[2]),
        .B(sw[3]),
        .Y(led[1]),
        .Carry(led[2])
    );

    // Two-bit adder from two full adders
    // A = {sw[5], sw[4]}, B = {sw[7], sw[6]}
    wire carry_mid;

    full_adder fa0 (
        .A(sw[4]),
        .B(sw[6]),
        .Cin(1'b0),
        .Y(led[3]),
        .Cout(carry_mid)
    );

    full_adder fa1 (
        .A(sw[5]),
        .B(sw[7]),
        .Cin(carry_mid),
        .Y(led[4]),
        .Cout(led[5])
    );
endmodule