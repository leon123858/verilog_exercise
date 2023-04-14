module Hello (
    input wire in,
    output reg out
);

initial begin
    $display("Hello World!");
    out = out + in;
end

endmodule //Hello