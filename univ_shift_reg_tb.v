module UniversalShiftReg_Tb;
reg q0,q1,q2,q3,clk,clr,sinr,sinl,s0,s1;
wire d0,d1,d2,d3;
UniversalShiftReg b1(clk,clr,s0,s1,q0,q1,q2,q3,sinr,sinl,d0,d1,d2,d3);
initial begin
clk=0;
forever #05 clk=~clk;
end
initial begin
clr=0;s0=1;s1=1;q0=1;q1=0;q2=1;q3=1;sinr=0;sinl=0;
#10 s0=0;s1=0;
#10 s0=0;s1=1;
#10 s0=1;s1=0;

end
endmodule
