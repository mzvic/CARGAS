`timescale 1ps / 1ps

module tb_FSM_tx;

logic clk; 
logic [3:0] sw;
logic [3:0] estado_sgte;
logic [3:0] estado;
logic [1:0] mode;
logic [7:0] data_out;

logic send = 0;
logic tx;
logic [7:0] data_jonas;
logic [2:0] state_jonas = 7;
logic [2:0] nextstate_jonas = 7;

localparam J = 3'd0;
localparam O = 3'd1;
localparam N = 3'd2;
localparam A = 3'd3;
localparam S = 3'd4;
localparam SPACE = 3'd5;

logic [4:0] cont_abc;
logic [7:0] data_abc;
logic [7:0] data_in;

always_comb begin
    case ( sw )
    
    4'b1000:    estado_sgte <= 4'b1000; // ABC...
    4'b0100:    estado_sgte <= 4'b0100; // Recep-Transm.
    4'b0010:    estado_sgte <= 4'b0010; // J-O-N-A-S-_
    4'b0001:    estado_sgte <= 4'b0001; // FSM TX
    default:    estado_sgte <= 4'b0000; // Sin transm.
    
    endcase
end

//-- Lógica secuencial (activación secuencial del estado)

always_ff @(posedge clk) begin
    if (send)
        estado <= estado_sgte;         
end

//-- Asignación de salida 

always_comb  begin
    unique case (estado)
    
    4'b1000:     // ABC...
    begin
        mode = 2'b01;
        data_out = data_abc;
    end
    4'b0100:    
    begin
        mode = 2'b10;
        data_out = data_in;
     end
    4'b0010:    // J-O-N-A-S-_   
    begin
        mode = 2'b01; 
        data_out = data_jonas;
    end 
    4'b0001:    
    begin
        mode = 2'b01;
        data_out = "A";
    end
    4'b0000:    mode = 2'b00;
    
    endcase
end  
        
//-- ABC...
assign data_abc = cont_abc + 65;
always_ff @(posedge clk)  begin
    if ( estado == 4'b1000) begin
        if ( send) begin
            if ( cont_abc == 25) begin
                cont_abc <= 1;
            end
            else begin
                cont_abc <= cont_abc + 1; 
            end
        end
    end
    else 
        cont_abc <= 0;
end

// J-O-N-A-S-_

always_comb begin
    if (send) begin
        if (estado != 4'b0010) 
            nextstate_jonas = J;
        else if ( state_jonas == J)
            nextstate_jonas = O;
        else if ( state_jonas == O)
            nextstate_jonas = N;
        else if ( state_jonas == N )
            nextstate_jonas = A;
        else if ( state_jonas == A )
            nextstate_jonas = S;
        else if ( state_jonas == S) 
            nextstate_jonas = SPACE;
        else if ( state_jonas == SPACE) 
            nextstate_jonas = J;
        else
            nextstate_jonas = J;  
     end
end

always_ff @(posedge clk) begin
    if (estado == 4'b0010) begin
        state_jonas <= nextstate_jonas;
    end
end

always_comb begin
    if (estado == 4'b0010) begin
        unique case (state_jonas) 
        J:  data_jonas = "J";
        O:  data_jonas = "O";
        N:  data_jonas = "N";
        A:  data_jonas = "A";
        S:  data_jonas = "S";
        SPACE:  data_jonas = 95;       
        endcase
    end
end
        
//-- UNIDAD UART TX
uart_tx #(3, 130) TX1(
    .clk(clk),
    .mode(mode),
    .send(send),
    .dato(data_out),
    .tx(tx)
    );
    
initial begin
    clk = 0;
//    data_jonas = "A";
//    mode = 2'b00;
//    estado = 4'b0000;
    sw = 4'b0000;
    #1000
//    mode = 2'b01;
//    estado = 4'b0010;
    sw = 4'b0010;
    #6000
    sw = 4'b1000;
    #4000
    sw = 0;
    #4000
    sw = 8;
    #4000 
    sw = 4; 
    #4000
    sw = 2;
    #4000
    sw = 1;
    #100000
    sw = 8;
    
end 

always begin
    #5 clk = ~clk;
end
endmodule
