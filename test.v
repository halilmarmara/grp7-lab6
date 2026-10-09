`timescale 1ns/1ps

module test;

    reg [7:0] sw;
    wire [5:0] led;
    
    reg fail = 1'b0;

    generate
        genvar led_idx;

        for (led_idx = 0; led_idx <= 4; led_idx = led_idx + 1) begin
            pulldown(led[led_idx]);
        end
    endgenerate

    top uut(
        .sw(sw[7:0]),
        .led(led[5:0])
    );

    initial begin
        $dumpvars(0, test);
        sw[0] = 0;
        sw[1] = 0;
        sw[2] = 0;
        sw[3] = 0;
        sw[4] = 0;
        sw[5] = 0;
        sw[6] = 0;
        sw[7] = 0;
        #20;
        if (led !== 6'b000000) begin
            fail = 1'b1;
            $error("Test failed! 01");
            $finish;
        end
        sw[0] = 0;
        sw[1] = 1;
        sw[2] = 1;
        sw[3] = 0;
        sw[4] = 1;
        sw[5] = 0;
        sw[6] = 0;
        sw[7] = 0;
        #20;
        if (led !== 6'b001011) begin
            fail = 1'b1;
            $error("Test failed! 02");
            $finish;
        end
        sw[0] = 1;
        sw[1] = 0;
        sw[2] = 0;
        sw[3] = 1;
        sw[4] = 0;
        sw[5] = 1;
        sw[6] = 0;
        sw[7] = 0;
        #20;
        if (led !== 6'b010011) begin
            fail = 1'b1;
            $error("Test failed! 03");
            $finish;
        end
        sw[0] = 1;
        sw[1] = 1;
        sw[2] = 1;
        sw[3] = 1;
        sw[4] = 1;
        sw[5] = 1;
        sw[6] = 0;
        sw[7] = 0;
        #20;
        if (led !== 6'b011100) begin
            fail = 1'b1;
            $error("Test failed! 04");
            $finish;
        end
        sw[4] = 0;
        sw[5] = 0;
        sw[6] = 1;
        sw[7] = 0;
        #20;
        if (led !== 6'b001100) begin
            fail = 1'b1;
            $error("Test failed! 05");
            $finish;
        end
        sw[4] = 1;
        sw[5] = 0;
        sw[6] = 1;
        sw[7] = 0;
        #20;
        if (led !== 6'b010100) begin
            fail = 1'b1;
            $error("Test failed! 06");
            $finish;
        end
        sw[4] = 0;
        sw[5] = 1;
        sw[6] = 1;
        sw[7] = 0;
        #20;
        if (led !== 6'b011100) begin
            fail = 1'b1;
            $error("Test failed! 07");
            $finish;
        end
        sw[4] = 1;
        sw[5] = 1;
        sw[6] = 1;
        sw[7] = 0;
        #20;
        if (led !== 6'b100100) begin
            fail = 1'b1;
            $error("Test failed! 08");
            $finish;
        end
        sw[4] = 0;
        sw[5] = 0;
        sw[6] = 0;
        sw[7] = 1;
        #20;
        if (led != 6'b010100) begin
            fail = 1'b1;
            $error("Test failed! 09");
            $finish;
        end
        sw[4] = 1;
        sw[5] = 0;
        sw[6] = 0;
        sw[7] = 1;
        #20;
        if (led !== 6'b011100) begin
            fail = 1'b1;
            $error("Test failed! 10");
            $finish;
        end
        sw[4] = 0;
        sw[5] = 1;
        sw[6] = 0;
        sw[7] = 1;
        #20;
        if (led != 6'b100100) begin
            fail = 1'b1;
            $error("Test failed! 11");
            $finish;
        end
        sw[4] = 1;
        sw[5] = 1;
        sw[6] = 0;
        sw[7] = 1;
        #20;
        if (led !== 6'b101100) begin
            fail = 1'b1;
            $error("Test failed! 12");
            $finish;
        end
        sw[4] = 0;
        sw[5] = 0;
        sw[6] = 1;
        sw[7] = 1;
        #20;
        if (led !== 6'b011100) begin
            fail = 1'b1;
            $error("Test failed! 13");
            $finish;
        end
        sw[4] = 1;
        sw[5] = 0;
        sw[6] = 1;
        sw[7] = 1;
        #20;
        if (led !== 6'b100100) begin
            fail = 1'b1;
            $error("Test failed! 14");
            $finish;
        end
        sw[4] = 0;
        sw[5] = 1;
        sw[6] = 1;
        sw[7] = 1;
        #20;
        if (led !== 6'b101100) begin
            fail = 1'b1;
            $display("Test failed! 15");
            $finish;
        end
        sw[4] = 1;
        sw[5] = 1;
        sw[6] = 1;
        sw[7] = 1;
        #20;
        if (led !== 6'b110100) begin
            fail = 1'b1;
            $error("Test failed! 16");
            $finish;
        end
        
        if (!fail)
            $display("All Testcases passed!");
            
        $stop;
    end
endmodule