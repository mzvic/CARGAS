`timescale 1ps / 1ps

module testb_prom;

//Parameterized values
parameter Q = 15;
parameter N = 28;

//Entrada
// Entradas 
logic [11:0] in_1;
logic clk;
//Salidas
logic [11:0] out_1;

//parameter DIEZ = 327680; // DIEZ = 10

/////////////////////////////////////////////// MODULO ///////////////////////////////////////////

logic [N-1:0] aux0; 
logic [N-1:0] aux1; 
//logic [N-1:0] aux2; logic [N-1:0] aux3; 
//logic [N-1:0] aux4; logic [N-1:0] aux5; 
//logic [N-1:0] aux6; logic [N-1:0] aux7; 
//logic [N-1:0] aux8; logic [N-1:0] aux9; 

logic [N-1:0] sum1;    
qadd #(Q,N) sum_1 ( in_1, in_1,out_1 );

//logic [N-1:0] sum2;    
//qadd #(Q,N) sum_2 ( sum1, aux2, sum2);

//logic [N-1:0] sum3;    
//qadd #(Q,N) sum_3 ( sum2, aux3, sum3);

//logic [N-1:0] sum4;    
//qadd #(Q,N) sum_4 ( sum3, aux4, sum4);

//logic [N-1:0] sum5;    
//qadd #(Q,N) sum_5 ( sum4, aux5, sum5);

//logic [N-1:0] sum6;    
//qadd #(Q,N) sum_6 ( sum5, aux6, sum6);

//logic [N-1:0] sum7;    
//qadd #(Q,N) sum_7 ( sum6, aux7, sum7);

//logic [N-1:0] sum8;    
//qadd #(Q,N) sum_8 ( sum7, aux8, sum8);

//logic [N-1:0] sum9;    
//qadd #(Q,N) sum_9 ( sum8, aux9, sum9);

//logic [N-1:0]  out_prom;
//division #(Q,N) div1 (sum9,DIEZ,clk,out_prom);


//always_ff @(posedge clk) begin

////    aux9 <= aux8;
////    aux8 <= aux7;
////    aux7 <= aux6;
////    aux6 <= aux5;
////    aux5 <= aux4;
////    aux4 <= aux3;
////    aux3 <= aux2;
////    aux2 <= aux1;
//    aux1 <= aux0;
//    aux0[26:15] <= in_1;
//    out_1 <= sum1[26:15];
 
//end


initial begin
    // Initialize Inputs
    clk = 0;
    in_1 = 3089;
    aux0 = 0; 
    aux1 = 0; 
//    aux2 = 0; aux3 = 0; 
//    aux4 = 0; aux5 = 0; 
//    aux6 = 0; aux7 = 0; 
//    aux8 = 0; aux9 = 0;
    out_prom = 0;     
end

always
begin
    #5 clk = ~clk;
end        

endmodule
