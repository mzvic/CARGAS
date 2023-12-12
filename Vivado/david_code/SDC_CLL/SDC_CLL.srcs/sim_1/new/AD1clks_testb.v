`timescale 1ps / 1ps

module AD1clks_testb;

reg clk; 
wire start;
wire divClk;
wire CS;
wire SCLK;
wire clkEn;
wire [4:0] state;
wire [4:0] data_read;
wire dato_ready;
wire SYNC;
wire SCLK2;
wire D0;
reg [11:0] data0;
wire [11:0] data;
wire ready;

// clk divClk
divisor_f #(11)clk_divClk(  //20MHz
//Entradas
    .clk(clk),
    .en_clk(1),
    //Salida
    .clk_out(divClk)               
);
        
divisor_f #(374)clk_start(  //100kHz
    //Entradas
    .clk(clk),
    .en_clk(1),
    //Salida
    .clk_out(start)               
);    

serial_gen_AD gg13(
       .start(start),
       .clk(clk), 
       .divClk(divClk),
       .data0(data0), 
       .D0(D0), 
       .SYNC(SYNC), 
       .SCLK(SCLK2),
       .ready(ready)      
       
);
      
AD1_drive AD1 ( 
//entradas
    .start(start),
    .clk(clk), 
    .divClk(divClk),
    .D0(D0),
    .D1(1),
 // salidas  
    .CS(CS),
    .SCLK(SCLK),
    .clkEn(clkEn),
    .state(state),
    .data_read(data_read),   
    .dato_ready(dato_ready),
    .data0(data)
);
    
initial begin
    clk = 0;
    data0 = 12'b000000111111;
end 

always
begin
    #5 clk = ~clk;
    
end
           
endmodule
