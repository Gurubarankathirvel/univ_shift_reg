module UniversalShiftReg(
    input clk,
    input clr,
    input s0,
    input s1,
    input q0,
    input q1,
    input q2,
    input q3,
    input sinr,
    input sinl,
    output d0,
    output d1,
    output d2,
    output d3
    );
    wire out0,out1,out2,out3;
    
    mux a1(s0,s1,d0,sinr,d1,q0,out0);
    mux a2(s0,s1,d1,d0,d2,q1,out1);
    mux a3(s0,s1,d2,d1,d3,q2,out2);
    mux a4(s0,s1,d3,d2,sinl,q3,out3);
    DFF f1(out0,clk,clr,d0);
    DFF f2(out1,clk,clr,d1);
    DFF f3(out2,clk,clr,d2);
    DFF f4(out3,clk,clr,d3);
    
endmodule
module DFF(
    input D,
    input clk,
    input clr,
    output reg Q
    );
   initial Q=0;
   always@(posedge clk or posedge clr) begin
       if (clr==1)
           begin
           Q=0;
           end
       else if (clr==0)
           begin
           case(D)
                    1'b0:Q=0;
                    1'b1:Q=1;
           endcase
       end   
   end 
endmodule
    
module mux(
        input a,
        input b,
        input d0,
        input d1,
        input d2,
        input d3,
        output reg data
        );
        always@(*)
        begin
            if (a==0&&b==0)
                begin
                    data=d0;
                end
            else if (a==0&&b==1)
                begin
                    data=d1;
                end
            else if (a==1&&b==0)
                begin
                    data=d2;
                end
            else if (a==1&&b==1)
                begin
                    data=d3;
                end
        end
endmodule
