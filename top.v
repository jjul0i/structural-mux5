module top (
    input [31:0] in, 
    input [1:0] sel, 
    output [7:0] out
);

wire [7:0] w1, w2;

// Primeiro nível de muxes
mux2byte m1 (
    .a(in[7:0]),
    .b(in[15:8]),
    .sel(sel[0]),
    .out(w1)
);

mux2byte m2 (
    .a(in[23:16]),
    .b(in[31:24]),
    .sel(sel[0]),
    .out(w2)
);

// Segundo nível
mux2byte m3 (
    .a(w1),
    .b(w2),
    .sel(sel[1]),
    .out(out)
);

endmodule
