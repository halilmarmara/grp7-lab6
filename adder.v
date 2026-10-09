module adder(
    input  A,
    input  B,
    output Y,
    output Carry
);
    assign Y     = A ^ B;
    assign Carry = A & B;
endmodule