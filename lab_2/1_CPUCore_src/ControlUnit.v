`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB (Embeded System Lab)
// Engineer: Haojun Xia
// Create Date: 2019/02/08
// Design Name: RISCV-Pipline CPU
// Module Name: ControlUnit
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: RISC-V Instruction Decoder
//////////////////////////////////////////////////////////////////////////////////
`include "Parameters.v"   
module ControlUnit(
    input wire [6:0] Op,
    input wire [2:0] Fn3,
    input wire [6:0] Fn7,
    output wire JalD,
    output wire JalrD,
    output reg [2:0] RegWriteD,
    output wire MemToRegD,
    output reg [3:0] MemWriteD,
    output wire LoadNpcD,
    output reg [1:0] RegReadD,
    output reg [2:0] BranchTypeD,
    output reg [3:0] AluContrlD,
    output wire [1:0] AluSrc2D,
    output wire AluSrc1D,
    output reg [2:0] ImmType        
    );

assign JalD = (Op == 7'b1101111);
assign JalrD = (Op == 7'b1100111);
assign LoadNpcD = (Op == 7'b1101111 || Op == 7'b1100111);
assign AluSrc1D = (Op == 7'b0010111);   //auipc
assign AluSrc2D = (Op == 7'b0010011) && ((Fn3 == 3'b001) || (Fn3 == 3'b101)) ? 2'b01 : ( (Op == 7'b0110011 || Op == 7'b1100011 ) ? 2'b00 : 2'b10 );

assign MemToRegD= (Op == 7'b0000011);

always@(*) begin
    case (Op)
    //ALU
        //LUI
        7'b0110111:begin
            RegWriteD <= `LW;
            MemWriteD <= 4'b0000;
            RegReadD <= 2'b00;
            BranchTypeD <= `NOBRANCH;
            AluContrlD <= `LUI;
            ImmType <= `UTYPE;
        end
        //AUIPC
        7'b0010111: begin
            RegWriteD <= `LW;
            MemWriteD <= 4'b0000;
            RegReadD <= 2'b00;
            BranchTypeD <= `NOBRANCH;
            AluContrlD <= `ADD;
            ImmType <= `UTYPE;
        end
        //IMM
        7'b0010011: begin
            case (Fn3)
                //ADDI
                3'b000: begin
                    RegWriteD <= `LW;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b01;   //A1 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `ADD;
                    ImmType <= `ITYPE;
                end
                //SLTI
                3'b010: begin
                    RegWriteD <= `LW;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b01;   //A1 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `SLT;
                    ImmType <= `ITYPE;
                end
                //SLTIU
                3'b011: begin
                    RegWriteD <= `LW;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b01;   //A1 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `SLTU;
                    ImmType <= `ITYPE;
                end
                //XORI
                3'b100: begin
                    RegWriteD <= `LW;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b01;   //A1 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `XOR;
                    ImmType <= `ITYPE;
                end
                //ORI
                3'b110: begin
                    RegWriteD <= `LW;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b01;   //A1 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `OR;
                    ImmType <= `ITYPE;
                end
                //ANDI
                3'b111: begin
                    RegWriteD <= `LW;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b01;   //A1 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `AND;
                    ImmType <= `ITYPE;
                end
                //SLLI
                3'b001: begin
                    RegWriteD <= `LW;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b01;   //A1 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `SLL;
                    ImmType <= `ITYPE;
                end
                //SRLI && SRAI
                3'b101: begin
                    case (Fn7)
                        //SRLI
                        7'b0000000: begin
                            RegWriteD <= `LW;
                            MemWriteD <= 4'b0000;
                            RegReadD <= 2'b01;   //A1 used
                            BranchTypeD <= `NOBRANCH;
                            AluContrlD <= `SRL;
                            ImmType <= `ITYPE;
                        end
                        //SRAI
                        7'b0100000: begin
                            RegWriteD <= `LW;
                            MemWriteD <= 4'b0000;
                            RegReadD <= 2'b01;   //A1 used
                            BranchTypeD <= `NOBRANCH;
                            AluContrlD <= `SRA;
                            ImmType <= `ITYPE;    
                        end 
                        default: begin
                            RegWriteD <= `NOREGWRITE;
                            MemWriteD <= 4'bxxxx;
                            RegReadD <= 2'bxx;
                            BranchTypeD <= `NOBRANCH;
                            AluContrlD <= 4'bxxxx;
                            ImmType <= 3'bxxx;
                        end 
                    endcase
                end     
                default: begin
                    RegWriteD <= `NOREGWRITE;
                    MemWriteD <= 4'bxxxx;
                    RegReadD <= 2'bxx;
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= 4'bxxxx;
                    ImmType <= 3'bxxx;
                end 
            endcase
        end
        //RTYPE
        7'b0110011: begin
            case (Fn3)
                //ADD && SUB
                3'b000: begin
                    case (Fn7)
                        //ADD
                        7'b0000000: begin
                            RegWriteD <= `LW;     
                            MemWriteD <= 4'b0000;
                            RegReadD <= 2'b11;   //A1&A2 used
                            BranchTypeD <= `NOBRANCH;
                            AluContrlD <= `ADD;
                            ImmType <= `RTYPE;
                        end 
                        //SUB
                        7'b0100000: begin
                            RegWriteD <= `LW;
                            MemWriteD <= 4'b0000;
                            RegReadD <= 2'b11;   //A1&A2 used
                            BranchTypeD <= `NOBRANCH;
                            AluContrlD <= `SUB;
                            ImmType <= `RTYPE;
                        end
                        default: begin
                            RegWriteD <= `NOREGWRITE;
                            MemWriteD <= 4'bxxxx;
                            RegReadD <= 2'bxx;
                            BranchTypeD <= `NOBRANCH;
                            AluContrlD <= 4'bxxxx;
                            ImmType <= 3'bxxx;
                        end
                    endcase
                end
                //SLL
                3'b001: begin
                    RegWriteD <= `LW; 
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b11;   //A1&A2 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `SLL;
                    ImmType <= `RTYPE;
                end
                //SLT
                3'b010: begin
                    RegWriteD <= `LW;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b11;   //A1&A2 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `SLT;
                    ImmType <= `RTYPE;
                end
                //SLTU
                3'b011: begin
                    RegWriteD <= `LW;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b11;   //A1&A2 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `SLTU;
                    ImmType <= `RTYPE;
                end
                //XOR
                3'b100: begin
                    RegWriteD <= `LW;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b11;   //A1&A2 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `XOR;
                    ImmType <= `RTYPE;
                end
                //SRL && SRA
                3'b101: begin
                    case (Fn7)
                        //SRL
                        7'b0000000: begin
                            RegWriteD <= `LW;
                            MemWriteD <= 4'b0000;
                            RegReadD <= 2'b11;   //A1&A2 used
                            BranchTypeD <= `NOBRANCH;
                            AluContrlD <= `SRL;
                            ImmType <= `RTYPE;
                        end 
                        //SRA
                        7'b0100000: begin
                            RegWriteD <= `LW;
                            MemWriteD <= 4'b0000;
                            RegReadD <= 2'b11;   //A1&A2 used
                            BranchTypeD <= `NOBRANCH;
                            AluContrlD <= `SRA;
                            ImmType <= `RTYPE;
                        end
                        default: begin
                            RegWriteD <= `NOREGWRITE;
                            MemWriteD <= 4'bxxxx;
                            RegReadD <= 2'bxx;
                            BranchTypeD <= `NOBRANCH;
                            AluContrlD <= 4'bxxxx;
                            ImmType <= 3'bxxx;
                        end
                    endcase
                end
                //OR
                3'b110: begin
                    RegWriteD <= `LW;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b11;   //A1&A2 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `OR;
                    ImmType <= `RTYPE;
                end
                //AND
                3'b111: begin
                    RegWriteD <= `LW;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b11;   //A1&A2 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `AND;
                    ImmType <= `RTYPE;
                end
                default: begin
                    RegWriteD <= `NOREGWRITE;
                    MemWriteD <= 4'bxxxx;
                    RegReadD <= 2'bxx;
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= 4'bxxxx;
                    ImmType <= 3'bxxx;
                end
            endcase
        end
        //JAL
        7'b1101111: begin
            RegWriteD <= `LW;
            MemWriteD <= 4'b0000;
            RegReadD <= 2'b00;   //A1&A2 not used
            BranchTypeD <= `NOBRANCH;
            AluContrlD <= `ADD;
            ImmType <= `JTYPE;
        end
        //JALR
        7'b1100111: begin
            RegWriteD <= `LW;
            MemWriteD <= 4'b0000;
            RegReadD <= 2'b00;   //A1&A2 not used
            BranchTypeD <= `NOBRANCH;
            AluContrlD <= `ADD;
            ImmType <= `JTYPE;
        end 
        //BranchType
        7'b1100011: begin
            case (Fn3)
                //BEQ
                3'b000: begin
                    RegWriteD <= `NOREGWRITE;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b11;   //A1&A2 used
                    BranchTypeD <= `BEQ;
                    AluContrlD <= `ADD;
                    ImmType <= `BTYPE;
                end
                //BNE
                3'b001: begin
                    RegWriteD <= `NOREGWRITE;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b11;   //A1&A2 used
                    BranchTypeD <= `BNE;
                    AluContrlD <= `ADD;
                    ImmType <= `BTYPE;
                end 
                //BLT
                3'b100: begin
                    RegWriteD <= `NOREGWRITE;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b11;   //A1&A2 used
                    BranchTypeD <= `BLT;
                    AluContrlD <= `ADD;
                    ImmType <= `BTYPE;
                end
                //BGE
                3'b101: begin
                    RegWriteD <= `NOREGWRITE;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b11;   //A1&A2 used
                    BranchTypeD <= `BGE;
                    AluContrlD <= `ADD;
                    ImmType <= `BTYPE;
                end
                //BLTU
                3'b110: begin
                    RegWriteD <= `NOREGWRITE;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b11;   //A1&A2 used
                    BranchTypeD <= `BLTU;
                    AluContrlD <= `ADD;
                    ImmType <= `BTYPE;
                end
                3'b111: begin
                    RegWriteD <= `NOREGWRITE;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b11;   //A1&A2 used
                    BranchTypeD <= `BGEU;
                    AluContrlD <= `ADD;
                    ImmType <= `BTYPE;
                end
                default: begin
                    RegWriteD <= `NOREGWRITE;
                    MemWriteD <= 4'bxxxx;
                    RegReadD <= 2'bxx;
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= 4'bxxxx;
                    ImmType <= 3'bxxx;
                end
            endcase
        end
        //LOAD
        7'b0000011:begin
            case (Fn3)
                //LB
                3'b000:begin
                    RegWriteD <= `LB;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b01;   //A1 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `ADD;
                    ImmType <= `ITYPE;
                end
                //LH
                3'b001: begin
                    RegWriteD <= `LH;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b01;   //A1 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `ADD;
                    ImmType <= `ITYPE;
                end
                //LW
                3'b010: begin
                    RegWriteD <= `LW;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b01;   //A1 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `ADD;
                    ImmType <= `ITYPE;
                end
                //LBU
                3'b011: begin
                    RegWriteD <= `LBU;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b01;   //A1 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `ADD;
                    ImmType <= `ITYPE;
                end
                //LHU
                3'b100: begin
                    RegWriteD <= `LHU;
                    MemWriteD <= 4'b0000;
                    RegReadD <= 2'b01;   //A1 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `ADD;
                    ImmType <= `ITYPE;
                end 
                default: begin
                    RegWriteD <= `NOREGWRITE;
                    MemWriteD <= 4'bxxxx;
                    RegReadD <= 2'bxx;
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= 4'bxxxx;
                    ImmType <= 3'bxxx;
                end 
            endcase
        end
        //STORE
        7'b0100011: begin
            case (Fn3)
                //SB
                3'b000: begin
                    RegWriteD <= `NOREGWRITE;
                    MemWriteD <= 4'b0001;
                    RegReadD <= 2'b11;   //A1&A2 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `ADD;
                    ImmType <= `STYPE;
                end
                //SH
                3'b001: begin
                    RegWriteD <= `NOREGWRITE;
                    MemWriteD <= 4'b0011;
                    RegReadD <= 2'b11;   //A1&A2 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `ADD;
                    ImmType <= `STYPE;
                end
                //SW
                3'b010: begin
                    RegWriteD <= `NOREGWRITE;
                    MemWriteD <= 4'b1111;
                    RegReadD <= 2'b11;   //A1&A2 used
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= `ADD;
                    ImmType <= `STYPE;
                end 
                default: begin
                    RegWriteD <= `NOREGWRITE;
                    MemWriteD <= 4'bxxxx;
                    RegReadD <= 2'bxx;
                    BranchTypeD <= `NOBRANCH;
                    AluContrlD <= 4'bxxxx;
                    ImmType <= 3'bxxx;
                end
            endcase
        end
        default: begin
            RegWriteD <= `NOREGWRITE;
            MemWriteD <= 4'bxxxx;
            RegReadD <= 2'bxx;
            BranchTypeD <= `NOBRANCH;
            AluContrlD <= 4'bxxxx;
            ImmType <= 3'bxxx;
        end
    endcase
end

endmodule

//功能说明
    //ControlUnit       是本CPU的指令译码器，组合�?�辑电路
//输入
    // Op               是指令的操作码部�???
    // Fn3              是指令的func3部分
    // Fn7              是指令的func7部分
//输出
    // JalD=1          表示Jal指令到达ID译码阶段
    // JalrD=1         表示Jalr指令到达ID译码阶段
    // RegWriteD        表示ID阶段的指令对应的 寄存器写入模�??? ，所有模式定义在Parameters.v�???
    // MemToRegD=1     表示ID阶段的指令需要将data memory读取的�?�写入寄存器,
    // MemWriteD        �???4bit，采用独热码格式，对于data memory�???32bit字按byte进行写入,MemWriteD<=0001表示只写入最�???1个byte，和xilinx bram的接口类�???
    // LoadNpcD=1      表示将NextPC输出到ResultM
    // RegReadD[1]=1   表示A1对应的寄存器值被使用到了，RegReadD[0]=1表示A2对应的寄存器值被使用到了，用于forward的处�???
    // BranchTypeD      表示不同的分支类型，�???有类型定义在Parameters.v�???
    // AluContrlD       表示不同的ALU计算功能，所有类型定义在Parameters.v�???
    // AluSrc2D         表示Alu输入�???2的�?�择
    // AluSrc1D         表示Alu输入�???1的�?�择
    // ImmType          表示指令的立即数格式，所有类型定义在Parameters.v�???   
//实验要求  
    //实现ControlUnit模块   