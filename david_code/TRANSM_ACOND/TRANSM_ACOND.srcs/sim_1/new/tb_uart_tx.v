`timescale 1ps / 1ps

module tb_uart_tx;

    reg clk; 
    reg [1:0] mode;
    reg en_signal;
    wire send;
    wire tx;
    reg [7:0] dato;
    
    // --- RELOJES         
            
    //-- UNIDAD UART TX
                uart_tx #(3, 130) TX1(
                    .clk(clk),
                    .mode(mode),
                    .en_signal(en_signal),
                    .send(send),
                    .dato(dato),
                    .tx(tx)
                    );
            
        initial begin
            clk = 0;
            mode = 2'b00;
            dato = "A";
            #1910 dato = "B";
            mode = 2'b10;
            #5 en_signal = 1;
            #10 en_signal = 0;
            #985 dato = "A";
            #1600 dato = "C";
            mode = 2'b01;
            #500000 en_signal = 1;
            #10 en_signal = 0;
//            en_clk = 0;
//            #100 en_clk = 1;
        end 
        
//        initial begin
//            #1515 en_signal = 1;
//            #10 en_signal = 0;
//        end
        
        always
        begin
            #5 clk = ~clk;
            
        end
        
endmodule