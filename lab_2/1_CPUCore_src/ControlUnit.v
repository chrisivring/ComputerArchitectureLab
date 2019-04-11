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
endmodule

assign JalD = (op == 7'b1101111);
assign JalrD = (op == 7'b1100111);
assign LoadNpcD = (op == 7'b1101111 || op == 7'b1100111);


always@(*) begin
    case (Op)
    //ALU
        //LUI
        7'b0110111:begin
            RegWriteD = `LW;
            MemToRegD = 1'b0;
            MemWriteD = 4'b0000;
            RegReadD = 2'b00;
            BranchTypeD = `NOBRANCH;
            AluContrlD = `LUI;
            AluSrc1D = 1'b0; //both 0 or 1 are ok
            AluSrc2D = 2'b10;   //imm
            ImmType = `UTYPE;
        end
        //AUIPC
        7'b0010111: begin
            RegWriteD = `LW;
            MemToRegD = 1'b0;
            MemWriteD = 4'b0000;
            RegReadD = 2'b00;
            BranchTypeD = `NOBRANCH;
            AluContrlD = `ADD;
            AluSrc1D = 1'b1; 
            AluSrc2D = 2'b10;   //imm
            ImmType = `UTYPE;
        end
        //IMM
        7'0010011: begin
            case (Fn3)
                //ADDI
                3'000: begin
                    RegWriteD = `LW;
                    MemToRegD = 1'b0;
                    MemWriteD = 4'b0000;
                    RegReadD = 2'b01;   //A1 used
                    BranchTypeD = `NOBRANCH;
                    AluContrlD = `ADD;
                    AluSrc1D = 1'b0; 
                    AluSrc2D = 2'b10;   //imm
                    ImmType = `ITYPE;
                end
                //SLTI
                3'b010: begin
                    RegWriteD = `LW;
                    MemToRegD = 1'b0;
                    MemWriteD = 4'b0000;
                    RegReadD = 2'b01;   //A1 used
                    BranchTypeD = `NOBRANCH;
                    AluContrlD = `SLT;
                    AluSrc1D = 1'b0; 
                    AluSrc2D = 2'b10;   //imm
                    ImmType = `ITYPE;
                end
                //SLTIU
                3'b011: begin
                    RegWriteD = `LW;
                    MemToRegD = 1'b0;
                    MemWriteD = 4'b0000;
                    RegReadD = 2'b01;   //A1 used
                    BranchTypeD = `NOBRANCH;
                    AluContrlD = `SLTU;
                    AluSrc1D = 1'b0; 
                    AluSrc2D = 2'b10;   //imm
                    ImmType = `ITYPE;
                end
                //XORI
                3'b100: begin
                    RegWriteD = `LW;
                    MemToRegD = 1'b0;
                    MemWriteD = 4'b0000;
                    RegReadD = 2'b01;   //A1 used
                    BranchTypeD = `NOBRANCH;
                    AluContrlD = `XOR;
                    AluSrc1D = 1'b0; 
                    AluSrc2D = 2'b10;   //imm
                    ImmType = `ITYPE;
                end
                //ORI
                3'b110: begin
                    RegWriteD = `LW;
                    MemToRegD = 1'b0;
                    MemWriteD = 4'b0000;
                    RegReadD = 2'b01;   //A1 used
                    BranchTypeD = `NOBRANCH;
                    AluContrlD = `OR;
                    AluSrc1D = 1'b0; 
                    AluSrc2D = 2'b10;   //imm
                    ImmType = `ITYPE;
                end
                //ANDI
                3'b111: begin
                    RegWriteD = `LW;
                    MemToRegD = 1'b0;
                    MemWriteD = 4'b0000;
                    RegReadD = 2'b01;   //A1 used
                    BranchTypeD = `NOBRANCH;
                    AluContrlD = `ANDI;
                    AluSrc1D = 1'b0; 
                    AluSrc2D = 2'b10;   //imm
                    ImmType = `ITYPE;
                end
                //SLLI
                3'b001: begin
                    RegWriteD = `LW;
                    MemToRegD = 1'b0;
                    MemWriteD = 4'b0000;
                    RegReadD = 2'b01;   //A1 used
                    BranchTypeD = `NOBRANCH;
                    AluContrlD = `SLL;
                    AluSrc1D = 1'b0; 
                    AluSrc2D = 2'b01;   //24-20:shamt
                    ImmType = `ITYPE;
                end
                //SRLI && SRAI
                3'b101: begin
                    case (Fn7)
                        //SRLI
                        7'b0000000: begin
                            RegWriteD = `LW;
                            MemToRegD = 1'b0;
                            MemWriteD = 4'b0000;
                            RegReadD = 2'b01;   //A1 used
                            BranchTypeD = `NOBRANCH;
                            AluContrlD = `SRL;
                            AluSrc1D = 1'b0; 
                            AluSrc2D = 2'b01;   //24-20:shamt
                            ImmType = `ITYPE;
                        end
                        //SRAI
                        7'b0100000: begin
                            RegWriteD = `LW;
                            MemToRegD = 1'b0;
                            MemWriteD = 4'b0000;
                            RegReadD = 2'b01;   //A1 used
                            BranchTypeD = `NOBRANCH;
                            AluContrlD = `SRA;
                            AluSrc1D = 1'b0; 
                            AluSrc2D = 2'b01;   //24-20:shamt
                            ImmType = `ITYPE;    
                        end 
                        default: begin
                            RegWriteD = `NOREGWRITE;
                            MemToRegD = 1'b0;
                            MemWriteD = 4'b0000;
                            RegReadD = 2'b00;
                            BranchTypeD = `NOBRANCH;
                            AluContrlD = `ADD;
                            AluSrc1D = 1'b0; 
                            AluSrc2D = 2'b00;
                            ImmType = `ITYPE;
                        end 
                    endcase
                end     
                default: begin
                    RegWriteD = `NOREGWRITE;
                    MemToRegD = 1'b0;
                    MemWriteD = 4'b0000;
                    RegReadD = 2'b00;
                    BranchTypeD = `NOBRANCH;
                    AluContrlD = `ADD;
                    AluSrc1D = 1'b0; 
                    AluSrc2D = 2'b00;
                    ImmType = `ITYPE;
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
                            RegWriteD = `LW;
                            MemToRegD = 1'b0;
                            MemWriteD = 4'b0000;
                            RegReadD = 2'b11;   //A1&A2 used
                            BranchTypeD = `NOBRANCH;
                            AluContrlD = `ADD;
                            AluSrc1D = 1'b0; 
                            AluSrc2D = 2'b00; 
                            ImmType = `RTYPE;
                        end 
                        //SUB
                        7'b0100000: begin
                            RegWriteD = `LW;
                            MemToRegD = 1'b0;
                            MemWriteD = 4'b0000;
                            RegReadD = 2'b11;   //A1&A2 used
                            BranchTypeD = `NOBRANCH;
                            AluContrlD = `SUB;
                            AluSrc1D = 1'b0; 
                            AluSrc2D = 2'b00;
                            ImmType = `RTYPE;
                        end
                        default: begin
                            RegWriteD = `LW;
                            MemToRegD = 1'b0;
                            MemWriteD = 4'b0000;
                            RegReadD = 2'b11;   //A1&A2 used
                            BranchTypeD = `NOBRANCH;
                            AluContrlD = `ADD;
                            AluSrc1D = 1'b0; 
                            AluSrc2D = 2'b00; 
                            ImmType = `RTYPE;
                        end
                    endcase
                end
                //SLL
                3'b001: begin
                    RegWriteD = `LW;
                    MemToRegD = 1'b0;
                    MemWriteD = 4'b0000;
                    RegReadD = 2'b11;   //A1&A2 used
                    BranchTypeD = `NOBRANCH;
                    AluContrlD = `SLL;
                    AluSrc1D = 1'b0; 
                    AluSrc2D = 2'b00; 
                    ImmType = `RTYPE;
                end
                //SLT
                3'b010: begin
                    RegWriteD = `LW;
                    MemToRegD = 1'b0;
                    MemWriteD = 4'b0000;
                    RegReadD = 2'b11;   //A1&A2 used
                    BranchTypeD = `NOBRANCH;
                    AluContrlD = `SLT;
                    AluSrc1D = 1'b0; 
                    AluSrc2D = 2'b00; 
                    ImmType = `RTYPE;
                end
                //SLTU
                3'b011: begin
                    RegWriteD = `LW;
                    MemToRegD = 1'b0;
                    MemWriteD = 4'b0000;
                    RegReadD = 2'b11;   //A1&A2 used
                    BranchTypeD = `NOBRANCH;
                    AluContrlD = `SLTU;
                    AluSrc1D = 1'b0; 
                    AluSrc2D = 2'b00; 
                    ImmType = `RTYPE;
                end
                //XOR
                3'b100: begin
                    RegWriteD = `LW;
                    MemToRegD = 1'b0;
                    MemWriteD = 4'b0000;
                    RegReadD = 2'b11;   //A1&A2 used
                    BranchTypeD = `NOBRANCH;
                    AluContrlD = `XOR;
                    AluSrc1D = 1'b0; 
                    AluSrc2D = 2'b00; 
                    ImmType = `RTYPE;
                end
                //SRL && SRA
                3'b101: begin
                    case (Fn7)
                        //SRL
                        7'b0000000: begin
                            RegWriteD = `LW;
                            MemToRegD = 1'b0;
                            MemWriteD = 4'b0000;
                            RegReadD = 2'b11;   //A1&A2 used
                            BranchTypeD = `NOBRANCH;
                            AluContrlD = `SRL;
                            AluSrc1D = 1'b0; 
                            AluSrc2D = 2'b00; 
                            ImmType = `RTYPE;
                        end 
                        //SRA
                        7'b0100000: begin
                            RegWriteD = `LW;
                            MemToRegD = 1'b0;
                            MemWriteD = 4'b0000;
                            RegReadD = 2'b11;   //A1&A2 used
                            BranchTypeD = `NOBRANCH;
                            AluContrlD = `SRA;
                            AluSrc1D = 1'b0; 
                            AluSrc2D = 2'b00; 
                            ImmType = `RTYPE;
                        end
                        default: begin
                            RegWriteD = `LW;
                            MemToRegD = 1'b0;
                            MemWriteD = 4'b0000;
                            RegReadD = 2'b11;   //A1&A2 used
                            BranchTypeD = `NOBRANCH;
                            AluContrlD = `SRL;
                            AluSrc1D = 1'b0; 
                            AluSrc2D = 2'b00; 
                            ImmType = `RTYPE;
                        end
                    endcase
                end
                //OR
                3'b110: begin
                    RegWriteD = `LW;
                    MemToRegD = 1'b0;
                    MemWriteD = 4'b0000;
                    RegReadD = 2'b11;   //A1&A2 used
                    BranchTypeD = `NOBRANCH;
                    AluContrlD = `OR;
                    AluSrc1D = 1'b0; 
                    AluSrc2D = 2'b00; 
                    ImmType = `RTYPE;
                end
                //AND
                3'b111: begin
                    RegWriteD = `LW;
                    MemToRegD = 1'b0;
                    MemWriteD = 4'b0000;
                    RegReadD = 2'b11;   //A1&A2 used
                    BranchTypeD = `NOBRANCH;
                    AluContrlD = `AND;
                    AluSrc1D = 1'b0; 
                    AluSrc2D = 2'b00; 
                    ImmType = `RTYPE;
                end
                default: begin
                    RegWriteD = `LW;
                    MemToRegD = 1'b0;
                    MemWriteD = 4'b0000;
                    RegReadD = 2'b11;   //A1&A2 used
                    BranchTypeD = `NOBRANCH;
                    AluContrlD = `OR;
                    AluSrc1D = 1'b0; 
                    AluSrc2D = 2'b00; 
                    ImmType = `RTYPE;
                end
            endcase
        end
        default: begin
            RegWriteD = `LW;
            MemToRegD = 1'b0;
            MemWriteD = 4'b0000;
            RegReadD = 2'b00;
            BranchTypeD = `NOBRANCH;
            AluContrlD = `LUI;
            AluSrc1D = 1'b0; //both 0 or 1 are ok
            AluSrc2D = 2'b10;   //imm
            ImmType = `UTYPE;
        end
    endcase
end

//功能说明
    //ControlUnit       是本CPU的指令译码器，组合逻辑电路
//输入
    // Op               是指令的操作码部分
    // Fn3              是指令的func3部分
    // Fn7              是指令的func7部分
//输出
    // JalD==1          表示Jal指令到达ID译码阶段
    // JalrD==1         表示Jalr指令到达ID译码阶段
    // RegWriteD        表示ID阶段的指令对应的 寄存器写入模式 ，所有模式定义在Parameters.v中
    // MemToRegD==1     表示ID阶段的指令需要将data memory读取的值写入寄存器,
    // MemWriteD        共4bit，采用独热码格式，对于data memory的32bit字按byte进行写入,MemWriteD=0001表示只写入最低1个byte，和xilinx bram的接口类似
    // LoadNpcD==1      表示将NextPC输出到ResultM
    // RegReadD[1]==1   表示A1对应的寄存器值被使用到了，RegReadD[0]==1表示A2对应的寄存器值被使用到了，用于forward的处理
    // BranchTypeD      表示不同的分支类型，所有类型定义在Parameters.v中
    // AluContrlD       表示不同的ALU计算功能，所有类型定义在Parameters.v中
    // AluSrc2D         表示Alu输入源2的选择
    // AluSrc1D         表示Alu输入源1的选择
    // ImmType          表示指令的立即数格式，所有类型定义在Parameters.v中   
//实验要求  
    //实现ControlUnit模块   