`timescale 1ns/100ps
//correct read result:
// 0000008c 00000046 0000008f 00000007 0000001d 00000021 00000024 0000004b 00000041 0000003f 00000039 00000007 0000004b 00000065 00000061 00000025 00000073 00000068 0000001d 0000003a 0000007e 00000091 0000009c 00000015 0000006d 00000046 0000004e 0000009d 00000029 0000002c 00000031 0000008d 0000008a 00000092 00000049 00000092 0000005f 00000000 0000004f 0000004e

module cache_tb();

`define DATA_COUNT (40)
`define RDWR_COUNT (6*`DATA_COUNT)

reg wr_cycle           [`RDWR_COUNT];
reg rd_cycle           [`RDWR_COUNT];
reg [31:0] addr_rom    [`RDWR_COUNT];
reg [31:0] wr_data_rom [`RDWR_COUNT];
reg [31:0] validation_data [`DATA_COUNT];

initial begin
    // 40 sequence write cycles
    rd_cycle[    0] = 1'b0;  wr_cycle[    0] = 1'b1;  addr_rom[    0]='h00000000;  wr_data_rom[    0]='h0000008a;
    rd_cycle[    1] = 1'b0;  wr_cycle[    1] = 1'b1;  addr_rom[    1]='h00000004;  wr_data_rom[    1]='h00000029;
    rd_cycle[    2] = 1'b0;  wr_cycle[    2] = 1'b1;  addr_rom[    2]='h00000008;  wr_data_rom[    2]='h0000008c;
    rd_cycle[    3] = 1'b0;  wr_cycle[    3] = 1'b1;  addr_rom[    3]='h0000000c;  wr_data_rom[    3]='h00000007;
    rd_cycle[    4] = 1'b0;  wr_cycle[    4] = 1'b1;  addr_rom[    4]='h00000010;  wr_data_rom[    4]='h00000033;
    rd_cycle[    5] = 1'b0;  wr_cycle[    5] = 1'b1;  addr_rom[    5]='h00000014;  wr_data_rom[    5]='h0000008e;
    rd_cycle[    6] = 1'b0;  wr_cycle[    6] = 1'b1;  addr_rom[    6]='h00000018;  wr_data_rom[    6]='h00000013;
    rd_cycle[    7] = 1'b0;  wr_cycle[    7] = 1'b1;  addr_rom[    7]='h0000001c;  wr_data_rom[    7]='h0000004b;
    rd_cycle[    8] = 1'b0;  wr_cycle[    8] = 1'b1;  addr_rom[    8]='h00000020;  wr_data_rom[    8]='h00000027;
    rd_cycle[    9] = 1'b0;  wr_cycle[    9] = 1'b1;  addr_rom[    9]='h00000024;  wr_data_rom[    9]='h00000038;
    rd_cycle[   10] = 1'b0;  wr_cycle[   10] = 1'b1;  addr_rom[   10]='h00000028;  wr_data_rom[   10]='h00000084;
    rd_cycle[   11] = 1'b0;  wr_cycle[   11] = 1'b1;  addr_rom[   11]='h0000002c;  wr_data_rom[   11]='h00000002;
    rd_cycle[   12] = 1'b0;  wr_cycle[   12] = 1'b1;  addr_rom[   12]='h00000030;  wr_data_rom[   12]='h00000011;
    rd_cycle[   13] = 1'b0;  wr_cycle[   13] = 1'b1;  addr_rom[   13]='h00000034;  wr_data_rom[   13]='h00000088;
    rd_cycle[   14] = 1'b0;  wr_cycle[   14] = 1'b1;  addr_rom[   14]='h00000038;  wr_data_rom[   14]='h0000005c;
    rd_cycle[   15] = 1'b0;  wr_cycle[   15] = 1'b1;  addr_rom[   15]='h0000003c;  wr_data_rom[   15]='h0000007f;
    rd_cycle[   16] = 1'b0;  wr_cycle[   16] = 1'b1;  addr_rom[   16]='h00000040;  wr_data_rom[   16]='h0000004a;
    rd_cycle[   17] = 1'b0;  wr_cycle[   17] = 1'b1;  addr_rom[   17]='h00000044;  wr_data_rom[   17]='h00000053;
    rd_cycle[   18] = 1'b0;  wr_cycle[   18] = 1'b1;  addr_rom[   18]='h00000048;  wr_data_rom[   18]='h0000001d;
    rd_cycle[   19] = 1'b0;  wr_cycle[   19] = 1'b1;  addr_rom[   19]='h0000004c;  wr_data_rom[   19]='h00000048;
    rd_cycle[   20] = 1'b0;  wr_cycle[   20] = 1'b1;  addr_rom[   20]='h00000050;  wr_data_rom[   20]='h0000009f;
    rd_cycle[   21] = 1'b0;  wr_cycle[   21] = 1'b1;  addr_rom[   21]='h00000054;  wr_data_rom[   21]='h0000009e;
    rd_cycle[   22] = 1'b0;  wr_cycle[   22] = 1'b1;  addr_rom[   22]='h00000058;  wr_data_rom[   22]='h0000009c;
    rd_cycle[   23] = 1'b0;  wr_cycle[   23] = 1'b1;  addr_rom[   23]='h0000005c;  wr_data_rom[   23]='h00000071;
    rd_cycle[   24] = 1'b0;  wr_cycle[   24] = 1'b1;  addr_rom[   24]='h00000060;  wr_data_rom[   24]='h0000003e;
    rd_cycle[   25] = 1'b0;  wr_cycle[   25] = 1'b1;  addr_rom[   25]='h00000064;  wr_data_rom[   25]='h0000003c;
    rd_cycle[   26] = 1'b0;  wr_cycle[   26] = 1'b1;  addr_rom[   26]='h00000068;  wr_data_rom[   26]='h00000009;
    rd_cycle[   27] = 1'b0;  wr_cycle[   27] = 1'b1;  addr_rom[   27]='h0000006c;  wr_data_rom[   27]='h0000009d;
    rd_cycle[   28] = 1'b0;  wr_cycle[   28] = 1'b1;  addr_rom[   28]='h00000070;  wr_data_rom[   28]='h0000000a;
    rd_cycle[   29] = 1'b0;  wr_cycle[   29] = 1'b1;  addr_rom[   29]='h00000074;  wr_data_rom[   29]='h0000009c;
    rd_cycle[   30] = 1'b0;  wr_cycle[   30] = 1'b1;  addr_rom[   30]='h00000078;  wr_data_rom[   30]='h00000043;
    rd_cycle[   31] = 1'b0;  wr_cycle[   31] = 1'b1;  addr_rom[   31]='h0000007c;  wr_data_rom[   31]='h0000007f;
    rd_cycle[   32] = 1'b0;  wr_cycle[   32] = 1'b1;  addr_rom[   32]='h00000080;  wr_data_rom[   32]='h00000015;
    rd_cycle[   33] = 1'b0;  wr_cycle[   33] = 1'b1;  addr_rom[   33]='h00000084;  wr_data_rom[   33]='h0000003a;
    rd_cycle[   34] = 1'b0;  wr_cycle[   34] = 1'b1;  addr_rom[   34]='h00000088;  wr_data_rom[   34]='h00000089;
    rd_cycle[   35] = 1'b0;  wr_cycle[   35] = 1'b1;  addr_rom[   35]='h0000008c;  wr_data_rom[   35]='h00000098;
    rd_cycle[   36] = 1'b0;  wr_cycle[   36] = 1'b1;  addr_rom[   36]='h00000090;  wr_data_rom[   36]='h00000084;
    rd_cycle[   37] = 1'b0;  wr_cycle[   37] = 1'b1;  addr_rom[   37]='h00000094;  wr_data_rom[   37]='h00000052;
    rd_cycle[   38] = 1'b0;  wr_cycle[   38] = 1'b1;  addr_rom[   38]='h00000098;  wr_data_rom[   38]='h00000013;
    rd_cycle[   39] = 1'b0;  wr_cycle[   39] = 1'b1;  addr_rom[   39]='h0000009c;  wr_data_rom[   39]='h0000004e;
    // 120 random read and write cycles
    rd_cycle[   40] = 1'b0;  wr_cycle[   40] = 1'b1;  addr_rom[   40]='h00000044;  wr_data_rom[   40]='h0000007b;
    rd_cycle[   41] = 1'b0;  wr_cycle[   41] = 1'b1;  addr_rom[   41]='h00000070;  wr_data_rom[   41]='h00000054;
    rd_cycle[   42] = 1'b0;  wr_cycle[   42] = 1'b1;  addr_rom[   42]='h00000098;  wr_data_rom[   42]='h0000004f;
    rd_cycle[   43] = 1'b1;  wr_cycle[   43] = 1'b0;  addr_rom[   43]='h00000004;  wr_data_rom[   43]='h00000000;
    rd_cycle[   44] = 1'b1;  wr_cycle[   44] = 1'b0;  addr_rom[   44]='h00000034;  wr_data_rom[   44]='h00000000;
    rd_cycle[   45] = 1'b1;  wr_cycle[   45] = 1'b0;  addr_rom[   45]='h0000001c;  wr_data_rom[   45]='h00000000;
    rd_cycle[   46] = 1'b1;  wr_cycle[   46] = 1'b0;  addr_rom[   46]='h00000034;  wr_data_rom[   46]='h00000000;
    rd_cycle[   47] = 1'b1;  wr_cycle[   47] = 1'b0;  addr_rom[   47]='h0000008c;  wr_data_rom[   47]='h00000000;
    rd_cycle[   48] = 1'b1;  wr_cycle[   48] = 1'b0;  addr_rom[   48]='h00000048;  wr_data_rom[   48]='h00000000;
    rd_cycle[   49] = 1'b0;  wr_cycle[   49] = 1'b1;  addr_rom[   49]='h00000078;  wr_data_rom[   49]='h00000021;
    rd_cycle[   50] = 1'b0;  wr_cycle[   50] = 1'b1;  addr_rom[   50]='h00000040;  wr_data_rom[   50]='h00000073;
    rd_cycle[   51] = 1'b1;  wr_cycle[   51] = 1'b0;  addr_rom[   51]='h00000014;  wr_data_rom[   51]='h00000000;
    rd_cycle[   52] = 1'b0;  wr_cycle[   52] = 1'b1;  addr_rom[   52]='h00000084;  wr_data_rom[   52]='h00000092;
    rd_cycle[   53] = 1'b1;  wr_cycle[   53] = 1'b0;  addr_rom[   53]='h0000003c;  wr_data_rom[   53]='h00000000;
    rd_cycle[   54] = 1'b0;  wr_cycle[   54] = 1'b1;  addr_rom[   54]='h00000068;  wr_data_rom[   54]='h0000001e;
    rd_cycle[   55] = 1'b1;  wr_cycle[   55] = 1'b0;  addr_rom[   55]='h00000010;  wr_data_rom[   55]='h00000000;
    rd_cycle[   56] = 1'b0;  wr_cycle[   56] = 1'b1;  addr_rom[   56]='h00000050;  wr_data_rom[   56]='h00000082;
    rd_cycle[   57] = 1'b0;  wr_cycle[   57] = 1'b1;  addr_rom[   57]='h00000018;  wr_data_rom[   57]='h00000056;
    rd_cycle[   58] = 1'b0;  wr_cycle[   58] = 1'b1;  addr_rom[   58]='h00000044;  wr_data_rom[   58]='h00000049;
    rd_cycle[   59] = 1'b0;  wr_cycle[   59] = 1'b1;  addr_rom[   59]='h0000007c;  wr_data_rom[   59]='h0000003d;
    rd_cycle[   60] = 1'b0;  wr_cycle[   60] = 1'b1;  addr_rom[   60]='h00000028;  wr_data_rom[   60]='h0000009e;
    rd_cycle[   61] = 1'b0;  wr_cycle[   61] = 1'b1;  addr_rom[   61]='h00000000;  wr_data_rom[   61]='h0000008c;
    rd_cycle[   62] = 1'b0;  wr_cycle[   62] = 1'b1;  addr_rom[   62]='h00000080;  wr_data_rom[   62]='h0000003c;
    rd_cycle[   63] = 1'b1;  wr_cycle[   63] = 1'b0;  addr_rom[   63]='h00000090;  wr_data_rom[   63]='h00000000;
    rd_cycle[   64] = 1'b0;  wr_cycle[   64] = 1'b1;  addr_rom[   64]='h00000004;  wr_data_rom[   64]='h00000027;
    rd_cycle[   65] = 1'b1;  wr_cycle[   65] = 1'b0;  addr_rom[   65]='h0000000c;  wr_data_rom[   65]='h00000000;
    rd_cycle[   66] = 1'b1;  wr_cycle[   66] = 1'b0;  addr_rom[   66]='h00000090;  wr_data_rom[   66]='h00000000;
    rd_cycle[   67] = 1'b1;  wr_cycle[   67] = 1'b0;  addr_rom[   67]='h00000018;  wr_data_rom[   67]='h00000000;
    rd_cycle[   68] = 1'b1;  wr_cycle[   68] = 1'b0;  addr_rom[   68]='h00000030;  wr_data_rom[   68]='h00000000;
    rd_cycle[   69] = 1'b0;  wr_cycle[   69] = 1'b1;  addr_rom[   69]='h00000054;  wr_data_rom[   69]='h00000082;
    rd_cycle[   70] = 1'b0;  wr_cycle[   70] = 1'b1;  addr_rom[   70]='h00000010;  wr_data_rom[   70]='h0000004c;
    rd_cycle[   71] = 1'b0;  wr_cycle[   71] = 1'b1;  addr_rom[   71]='h00000020;  wr_data_rom[   71]='h0000007e;
    rd_cycle[   72] = 1'b1;  wr_cycle[   72] = 1'b0;  addr_rom[   72]='h00000088;  wr_data_rom[   72]='h00000000;
    rd_cycle[   73] = 1'b1;  wr_cycle[   73] = 1'b0;  addr_rom[   73]='h00000050;  wr_data_rom[   73]='h00000000;
    rd_cycle[   74] = 1'b0;  wr_cycle[   74] = 1'b1;  addr_rom[   74]='h00000068;  wr_data_rom[   74]='h0000004e;
    rd_cycle[   75] = 1'b1;  wr_cycle[   75] = 1'b0;  addr_rom[   75]='h00000038;  wr_data_rom[   75]='h00000000;
    rd_cycle[   76] = 1'b0;  wr_cycle[   76] = 1'b1;  addr_rom[   76]='h00000018;  wr_data_rom[   76]='h00000024;
    rd_cycle[   77] = 1'b1;  wr_cycle[   77] = 1'b0;  addr_rom[   77]='h00000014;  wr_data_rom[   77]='h00000000;
    rd_cycle[   78] = 1'b1;  wr_cycle[   78] = 1'b0;  addr_rom[   78]='h00000044;  wr_data_rom[   78]='h00000000;
    rd_cycle[   79] = 1'b1;  wr_cycle[   79] = 1'b0;  addr_rom[   79]='h00000080;  wr_data_rom[   79]='h00000000;
    rd_cycle[   80] = 1'b1;  wr_cycle[   80] = 1'b0;  addr_rom[   80]='h0000000c;  wr_data_rom[   80]='h00000000;
    rd_cycle[   81] = 1'b0;  wr_cycle[   81] = 1'b1;  addr_rom[   81]='h00000010;  wr_data_rom[   81]='h0000009b;
    rd_cycle[   82] = 1'b0;  wr_cycle[   82] = 1'b1;  addr_rom[   82]='h0000005c;  wr_data_rom[   82]='h00000094;
    rd_cycle[   83] = 1'b1;  wr_cycle[   83] = 1'b0;  addr_rom[   83]='h00000070;  wr_data_rom[   83]='h00000000;
    rd_cycle[   84] = 1'b0;  wr_cycle[   84] = 1'b1;  addr_rom[   84]='h00000060;  wr_data_rom[   84]='h0000006d;
    rd_cycle[   85] = 1'b1;  wr_cycle[   85] = 1'b0;  addr_rom[   85]='h0000004c;  wr_data_rom[   85]='h00000000;
    rd_cycle[   86] = 1'b1;  wr_cycle[   86] = 1'b0;  addr_rom[   86]='h00000080;  wr_data_rom[   86]='h00000000;
    rd_cycle[   87] = 1'b1;  wr_cycle[   87] = 1'b0;  addr_rom[   87]='h0000001c;  wr_data_rom[   87]='h00000000;
    rd_cycle[   88] = 1'b0;  wr_cycle[   88] = 1'b1;  addr_rom[   88]='h00000080;  wr_data_rom[   88]='h00000044;
    rd_cycle[   89] = 1'b0;  wr_cycle[   89] = 1'b1;  addr_rom[   89]='h00000080;  wr_data_rom[   89]='h00000020;
    rd_cycle[   90] = 1'b1;  wr_cycle[   90] = 1'b0;  addr_rom[   90]='h0000004c;  wr_data_rom[   90]='h00000000;
    rd_cycle[   91] = 1'b0;  wr_cycle[   91] = 1'b1;  addr_rom[   91]='h00000078;  wr_data_rom[   91]='h00000031;
    rd_cycle[   92] = 1'b1;  wr_cycle[   92] = 1'b0;  addr_rom[   92]='h00000034;  wr_data_rom[   92]='h00000000;
    rd_cycle[   93] = 1'b1;  wr_cycle[   93] = 1'b0;  addr_rom[   93]='h0000005c;  wr_data_rom[   93]='h00000000;
    rd_cycle[   94] = 1'b0;  wr_cycle[   94] = 1'b1;  addr_rom[   94]='h0000008c;  wr_data_rom[   94]='h00000004;
    rd_cycle[   95] = 1'b1;  wr_cycle[   95] = 1'b0;  addr_rom[   95]='h00000068;  wr_data_rom[   95]='h00000000;
    rd_cycle[   96] = 1'b0;  wr_cycle[   96] = 1'b1;  addr_rom[   96]='h00000038;  wr_data_rom[   96]='h00000008;
    rd_cycle[   97] = 1'b1;  wr_cycle[   97] = 1'b0;  addr_rom[   97]='h00000004;  wr_data_rom[   97]='h00000000;
    rd_cycle[   98] = 1'b0;  wr_cycle[   98] = 1'b1;  addr_rom[   98]='h00000080;  wr_data_rom[   98]='h0000008a;
    rd_cycle[   99] = 1'b1;  wr_cycle[   99] = 1'b0;  addr_rom[   99]='h00000074;  wr_data_rom[   99]='h00000000;
    rd_cycle[  100] = 1'b1;  wr_cycle[  100] = 1'b0;  addr_rom[  100]='h0000004c;  wr_data_rom[  100]='h00000000;
    rd_cycle[  101] = 1'b0;  wr_cycle[  101] = 1'b1;  addr_rom[  101]='h0000007c;  wr_data_rom[  101]='h00000070;
    rd_cycle[  102] = 1'b1;  wr_cycle[  102] = 1'b0;  addr_rom[  102]='h0000003c;  wr_data_rom[  102]='h00000000;
    rd_cycle[  103] = 1'b0;  wr_cycle[  103] = 1'b1;  addr_rom[  103]='h00000004;  wr_data_rom[  103]='h00000046;
    rd_cycle[  104] = 1'b0;  wr_cycle[  104] = 1'b1;  addr_rom[  104]='h00000090;  wr_data_rom[  104]='h0000007f;
    rd_cycle[  105] = 1'b1;  wr_cycle[  105] = 1'b0;  addr_rom[  105]='h0000002c;  wr_data_rom[  105]='h00000000;
    rd_cycle[  106] = 1'b0;  wr_cycle[  106] = 1'b1;  addr_rom[  106]='h00000090;  wr_data_rom[  106]='h0000005f;
    rd_cycle[  107] = 1'b1;  wr_cycle[  107] = 1'b0;  addr_rom[  107]='h00000060;  wr_data_rom[  107]='h00000000;
    rd_cycle[  108] = 1'b1;  wr_cycle[  108] = 1'b0;  addr_rom[  108]='h0000006c;  wr_data_rom[  108]='h00000000;
    rd_cycle[  109] = 1'b0;  wr_cycle[  109] = 1'b1;  addr_rom[  109]='h00000014;  wr_data_rom[  109]='h00000021;
    rd_cycle[  110] = 1'b1;  wr_cycle[  110] = 1'b0;  addr_rom[  110]='h00000064;  wr_data_rom[  110]='h00000000;
    rd_cycle[  111] = 1'b1;  wr_cycle[  111] = 1'b0;  addr_rom[  111]='h0000009c;  wr_data_rom[  111]='h00000000;
    rd_cycle[  112] = 1'b0;  wr_cycle[  112] = 1'b1;  addr_rom[  112]='h0000003c;  wr_data_rom[  112]='h00000025;
    rd_cycle[  113] = 1'b0;  wr_cycle[  113] = 1'b1;  addr_rom[  113]='h00000074;  wr_data_rom[  113]='h0000002c;
    rd_cycle[  114] = 1'b1;  wr_cycle[  114] = 1'b0;  addr_rom[  114]='h00000064;  wr_data_rom[  114]='h00000000;
    rd_cycle[  115] = 1'b0;  wr_cycle[  115] = 1'b1;  addr_rom[  115]='h00000030;  wr_data_rom[  115]='h0000004b;
    rd_cycle[  116] = 1'b0;  wr_cycle[  116] = 1'b1;  addr_rom[  116]='h00000024;  wr_data_rom[  116]='h0000003f;
    rd_cycle[  117] = 1'b0;  wr_cycle[  117] = 1'b1;  addr_rom[  117]='h00000070;  wr_data_rom[  117]='h00000029;
    rd_cycle[  118] = 1'b1;  wr_cycle[  118] = 1'b0;  addr_rom[  118]='h00000034;  wr_data_rom[  118]='h00000000;
    rd_cycle[  119] = 1'b1;  wr_cycle[  119] = 1'b0;  addr_rom[  119]='h00000010;  wr_data_rom[  119]='h00000000;
    rd_cycle[  120] = 1'b1;  wr_cycle[  120] = 1'b0;  addr_rom[  120]='h00000084;  wr_data_rom[  120]='h00000000;
    rd_cycle[  121] = 1'b0;  wr_cycle[  121] = 1'b1;  addr_rom[  121]='h00000038;  wr_data_rom[  121]='h00000061;
    rd_cycle[  122] = 1'b1;  wr_cycle[  122] = 1'b0;  addr_rom[  122]='h00000074;  wr_data_rom[  122]='h00000000;
    rd_cycle[  123] = 1'b0;  wr_cycle[  123] = 1'b1;  addr_rom[  123]='h00000044;  wr_data_rom[  123]='h00000068;
    rd_cycle[  124] = 1'b1;  wr_cycle[  124] = 1'b0;  addr_rom[  124]='h0000005c;  wr_data_rom[  124]='h00000000;
    rd_cycle[  125] = 1'b0;  wr_cycle[  125] = 1'b1;  addr_rom[  125]='h00000010;  wr_data_rom[  125]='h0000001d;
    rd_cycle[  126] = 1'b1;  wr_cycle[  126] = 1'b0;  addr_rom[  126]='h00000050;  wr_data_rom[  126]='h00000000;
    rd_cycle[  127] = 1'b1;  wr_cycle[  127] = 1'b0;  addr_rom[  127]='h00000080;  wr_data_rom[  127]='h00000000;
    rd_cycle[  128] = 1'b0;  wr_cycle[  128] = 1'b1;  addr_rom[  128]='h00000064;  wr_data_rom[  128]='h00000046;
    rd_cycle[  129] = 1'b1;  wr_cycle[  129] = 1'b0;  addr_rom[  129]='h0000009c;  wr_data_rom[  129]='h00000000;
    rd_cycle[  130] = 1'b1;  wr_cycle[  130] = 1'b0;  addr_rom[  130]='h00000088;  wr_data_rom[  130]='h00000000;
    rd_cycle[  131] = 1'b0;  wr_cycle[  131] = 1'b1;  addr_rom[  131]='h00000034;  wr_data_rom[  131]='h00000065;
    rd_cycle[  132] = 1'b0;  wr_cycle[  132] = 1'b1;  addr_rom[  132]='h00000008;  wr_data_rom[  132]='h0000008f;
    rd_cycle[  133] = 1'b1;  wr_cycle[  133] = 1'b0;  addr_rom[  133]='h00000070;  wr_data_rom[  133]='h00000000;
    rd_cycle[  134] = 1'b0;  wr_cycle[  134] = 1'b1;  addr_rom[  134]='h00000050;  wr_data_rom[  134]='h0000007e;
    rd_cycle[  135] = 1'b1;  wr_cycle[  135] = 1'b0;  addr_rom[  135]='h00000080;  wr_data_rom[  135]='h00000000;
    rd_cycle[  136] = 1'b0;  wr_cycle[  136] = 1'b1;  addr_rom[  136]='h00000094;  wr_data_rom[  136]='h0000005c;
    rd_cycle[  137] = 1'b1;  wr_cycle[  137] = 1'b0;  addr_rom[  137]='h0000002c;  wr_data_rom[  137]='h00000000;
    rd_cycle[  138] = 1'b1;  wr_cycle[  138] = 1'b0;  addr_rom[  138]='h00000064;  wr_data_rom[  138]='h00000000;
    rd_cycle[  139] = 1'b1;  wr_cycle[  139] = 1'b0;  addr_rom[  139]='h00000004;  wr_data_rom[  139]='h00000000;
    rd_cycle[  140] = 1'b1;  wr_cycle[  140] = 1'b0;  addr_rom[  140]='h0000003c;  wr_data_rom[  140]='h00000000;
    rd_cycle[  141] = 1'b0;  wr_cycle[  141] = 1'b1;  addr_rom[  141]='h00000054;  wr_data_rom[  141]='h00000091;
    rd_cycle[  142] = 1'b1;  wr_cycle[  142] = 1'b0;  addr_rom[  142]='h0000000c;  wr_data_rom[  142]='h00000000;
    rd_cycle[  143] = 1'b0;  wr_cycle[  143] = 1'b1;  addr_rom[  143]='h00000088;  wr_data_rom[  143]='h00000049;
    rd_cycle[  144] = 1'b0;  wr_cycle[  144] = 1'b1;  addr_rom[  144]='h0000007c;  wr_data_rom[  144]='h0000008d;
    rd_cycle[  145] = 1'b0;  wr_cycle[  145] = 1'b1;  addr_rom[  145]='h00000020;  wr_data_rom[  145]='h00000041;
    rd_cycle[  146] = 1'b0;  wr_cycle[  146] = 1'b1;  addr_rom[  146]='h0000002c;  wr_data_rom[  146]='h00000007;
    rd_cycle[  147] = 1'b1;  wr_cycle[  147] = 1'b0;  addr_rom[  147]='h00000084;  wr_data_rom[  147]='h00000000;
    rd_cycle[  148] = 1'b0;  wr_cycle[  148] = 1'b1;  addr_rom[  148]='h00000028;  wr_data_rom[  148]='h00000039;
    rd_cycle[  149] = 1'b1;  wr_cycle[  149] = 1'b0;  addr_rom[  149]='h00000004;  wr_data_rom[  149]='h00000000;
    rd_cycle[  150] = 1'b1;  wr_cycle[  150] = 1'b0;  addr_rom[  150]='h00000014;  wr_data_rom[  150]='h00000000;
    rd_cycle[  151] = 1'b0;  wr_cycle[  151] = 1'b1;  addr_rom[  151]='h0000004c;  wr_data_rom[  151]='h00000076;
    rd_cycle[  152] = 1'b0;  wr_cycle[  152] = 1'b1;  addr_rom[  152]='h0000004c;  wr_data_rom[  152]='h0000003a;
    rd_cycle[  153] = 1'b1;  wr_cycle[  153] = 1'b0;  addr_rom[  153]='h00000050;  wr_data_rom[  153]='h00000000;
    rd_cycle[  154] = 1'b1;  wr_cycle[  154] = 1'b0;  addr_rom[  154]='h00000090;  wr_data_rom[  154]='h00000000;
    rd_cycle[  155] = 1'b0;  wr_cycle[  155] = 1'b1;  addr_rom[  155]='h00000094;  wr_data_rom[  155]='h00000000;
    rd_cycle[  156] = 1'b1;  wr_cycle[  156] = 1'b0;  addr_rom[  156]='h00000070;  wr_data_rom[  156]='h00000000;
    rd_cycle[  157] = 1'b0;  wr_cycle[  157] = 1'b1;  addr_rom[  157]='h0000005c;  wr_data_rom[  157]='h00000015;
    rd_cycle[  158] = 1'b0;  wr_cycle[  158] = 1'b1;  addr_rom[  158]='h0000008c;  wr_data_rom[  158]='h00000092;
    rd_cycle[  159] = 1'b1;  wr_cycle[  159] = 1'b0;  addr_rom[  159]='h00000044;  wr_data_rom[  159]='h00000000;
    // 40 silence cycles
    rd_cycle[  160] = 1'b0;  wr_cycle[  160] = 1'b0;  addr_rom[  160]='h00000000;  wr_data_rom[  160]='h00000000;
    rd_cycle[  161] = 1'b0;  wr_cycle[  161] = 1'b0;  addr_rom[  161]='h00000000;  wr_data_rom[  161]='h00000000;
    rd_cycle[  162] = 1'b0;  wr_cycle[  162] = 1'b0;  addr_rom[  162]='h00000000;  wr_data_rom[  162]='h00000000;
    rd_cycle[  163] = 1'b0;  wr_cycle[  163] = 1'b0;  addr_rom[  163]='h00000000;  wr_data_rom[  163]='h00000000;
    rd_cycle[  164] = 1'b0;  wr_cycle[  164] = 1'b0;  addr_rom[  164]='h00000000;  wr_data_rom[  164]='h00000000;
    rd_cycle[  165] = 1'b0;  wr_cycle[  165] = 1'b0;  addr_rom[  165]='h00000000;  wr_data_rom[  165]='h00000000;
    rd_cycle[  166] = 1'b0;  wr_cycle[  166] = 1'b0;  addr_rom[  166]='h00000000;  wr_data_rom[  166]='h00000000;
    rd_cycle[  167] = 1'b0;  wr_cycle[  167] = 1'b0;  addr_rom[  167]='h00000000;  wr_data_rom[  167]='h00000000;
    rd_cycle[  168] = 1'b0;  wr_cycle[  168] = 1'b0;  addr_rom[  168]='h00000000;  wr_data_rom[  168]='h00000000;
    rd_cycle[  169] = 1'b0;  wr_cycle[  169] = 1'b0;  addr_rom[  169]='h00000000;  wr_data_rom[  169]='h00000000;
    rd_cycle[  170] = 1'b0;  wr_cycle[  170] = 1'b0;  addr_rom[  170]='h00000000;  wr_data_rom[  170]='h00000000;
    rd_cycle[  171] = 1'b0;  wr_cycle[  171] = 1'b0;  addr_rom[  171]='h00000000;  wr_data_rom[  171]='h00000000;
    rd_cycle[  172] = 1'b0;  wr_cycle[  172] = 1'b0;  addr_rom[  172]='h00000000;  wr_data_rom[  172]='h00000000;
    rd_cycle[  173] = 1'b0;  wr_cycle[  173] = 1'b0;  addr_rom[  173]='h00000000;  wr_data_rom[  173]='h00000000;
    rd_cycle[  174] = 1'b0;  wr_cycle[  174] = 1'b0;  addr_rom[  174]='h00000000;  wr_data_rom[  174]='h00000000;
    rd_cycle[  175] = 1'b0;  wr_cycle[  175] = 1'b0;  addr_rom[  175]='h00000000;  wr_data_rom[  175]='h00000000;
    rd_cycle[  176] = 1'b0;  wr_cycle[  176] = 1'b0;  addr_rom[  176]='h00000000;  wr_data_rom[  176]='h00000000;
    rd_cycle[  177] = 1'b0;  wr_cycle[  177] = 1'b0;  addr_rom[  177]='h00000000;  wr_data_rom[  177]='h00000000;
    rd_cycle[  178] = 1'b0;  wr_cycle[  178] = 1'b0;  addr_rom[  178]='h00000000;  wr_data_rom[  178]='h00000000;
    rd_cycle[  179] = 1'b0;  wr_cycle[  179] = 1'b0;  addr_rom[  179]='h00000000;  wr_data_rom[  179]='h00000000;
    rd_cycle[  180] = 1'b0;  wr_cycle[  180] = 1'b0;  addr_rom[  180]='h00000000;  wr_data_rom[  180]='h00000000;
    rd_cycle[  181] = 1'b0;  wr_cycle[  181] = 1'b0;  addr_rom[  181]='h00000000;  wr_data_rom[  181]='h00000000;
    rd_cycle[  182] = 1'b0;  wr_cycle[  182] = 1'b0;  addr_rom[  182]='h00000000;  wr_data_rom[  182]='h00000000;
    rd_cycle[  183] = 1'b0;  wr_cycle[  183] = 1'b0;  addr_rom[  183]='h00000000;  wr_data_rom[  183]='h00000000;
    rd_cycle[  184] = 1'b0;  wr_cycle[  184] = 1'b0;  addr_rom[  184]='h00000000;  wr_data_rom[  184]='h00000000;
    rd_cycle[  185] = 1'b0;  wr_cycle[  185] = 1'b0;  addr_rom[  185]='h00000000;  wr_data_rom[  185]='h00000000;
    rd_cycle[  186] = 1'b0;  wr_cycle[  186] = 1'b0;  addr_rom[  186]='h00000000;  wr_data_rom[  186]='h00000000;
    rd_cycle[  187] = 1'b0;  wr_cycle[  187] = 1'b0;  addr_rom[  187]='h00000000;  wr_data_rom[  187]='h00000000;
    rd_cycle[  188] = 1'b0;  wr_cycle[  188] = 1'b0;  addr_rom[  188]='h00000000;  wr_data_rom[  188]='h00000000;
    rd_cycle[  189] = 1'b0;  wr_cycle[  189] = 1'b0;  addr_rom[  189]='h00000000;  wr_data_rom[  189]='h00000000;
    rd_cycle[  190] = 1'b0;  wr_cycle[  190] = 1'b0;  addr_rom[  190]='h00000000;  wr_data_rom[  190]='h00000000;
    rd_cycle[  191] = 1'b0;  wr_cycle[  191] = 1'b0;  addr_rom[  191]='h00000000;  wr_data_rom[  191]='h00000000;
    rd_cycle[  192] = 1'b0;  wr_cycle[  192] = 1'b0;  addr_rom[  192]='h00000000;  wr_data_rom[  192]='h00000000;
    rd_cycle[  193] = 1'b0;  wr_cycle[  193] = 1'b0;  addr_rom[  193]='h00000000;  wr_data_rom[  193]='h00000000;
    rd_cycle[  194] = 1'b0;  wr_cycle[  194] = 1'b0;  addr_rom[  194]='h00000000;  wr_data_rom[  194]='h00000000;
    rd_cycle[  195] = 1'b0;  wr_cycle[  195] = 1'b0;  addr_rom[  195]='h00000000;  wr_data_rom[  195]='h00000000;
    rd_cycle[  196] = 1'b0;  wr_cycle[  196] = 1'b0;  addr_rom[  196]='h00000000;  wr_data_rom[  196]='h00000000;
    rd_cycle[  197] = 1'b0;  wr_cycle[  197] = 1'b0;  addr_rom[  197]='h00000000;  wr_data_rom[  197]='h00000000;
    rd_cycle[  198] = 1'b0;  wr_cycle[  198] = 1'b0;  addr_rom[  198]='h00000000;  wr_data_rom[  198]='h00000000;
    rd_cycle[  199] = 1'b0;  wr_cycle[  199] = 1'b0;  addr_rom[  199]='h00000000;  wr_data_rom[  199]='h00000000;
    // 40 sequence read cycles
    rd_cycle[  200] = 1'b1;  wr_cycle[  200] = 1'b0;  addr_rom[  200]='h00000000;  wr_data_rom[  200]='h00000000;
    rd_cycle[  201] = 1'b1;  wr_cycle[  201] = 1'b0;  addr_rom[  201]='h00000004;  wr_data_rom[  201]='h00000000;
    rd_cycle[  202] = 1'b1;  wr_cycle[  202] = 1'b0;  addr_rom[  202]='h00000008;  wr_data_rom[  202]='h00000000;
    rd_cycle[  203] = 1'b1;  wr_cycle[  203] = 1'b0;  addr_rom[  203]='h0000000c;  wr_data_rom[  203]='h00000000;
    rd_cycle[  204] = 1'b1;  wr_cycle[  204] = 1'b0;  addr_rom[  204]='h00000010;  wr_data_rom[  204]='h00000000;
    rd_cycle[  205] = 1'b1;  wr_cycle[  205] = 1'b0;  addr_rom[  205]='h00000014;  wr_data_rom[  205]='h00000000;
    rd_cycle[  206] = 1'b1;  wr_cycle[  206] = 1'b0;  addr_rom[  206]='h00000018;  wr_data_rom[  206]='h00000000;
    rd_cycle[  207] = 1'b1;  wr_cycle[  207] = 1'b0;  addr_rom[  207]='h0000001c;  wr_data_rom[  207]='h00000000;
    rd_cycle[  208] = 1'b1;  wr_cycle[  208] = 1'b0;  addr_rom[  208]='h00000020;  wr_data_rom[  208]='h00000000;
    rd_cycle[  209] = 1'b1;  wr_cycle[  209] = 1'b0;  addr_rom[  209]='h00000024;  wr_data_rom[  209]='h00000000;
    rd_cycle[  210] = 1'b1;  wr_cycle[  210] = 1'b0;  addr_rom[  210]='h00000028;  wr_data_rom[  210]='h00000000;
    rd_cycle[  211] = 1'b1;  wr_cycle[  211] = 1'b0;  addr_rom[  211]='h0000002c;  wr_data_rom[  211]='h00000000;
    rd_cycle[  212] = 1'b1;  wr_cycle[  212] = 1'b0;  addr_rom[  212]='h00000030;  wr_data_rom[  212]='h00000000;
    rd_cycle[  213] = 1'b1;  wr_cycle[  213] = 1'b0;  addr_rom[  213]='h00000034;  wr_data_rom[  213]='h00000000;
    rd_cycle[  214] = 1'b1;  wr_cycle[  214] = 1'b0;  addr_rom[  214]='h00000038;  wr_data_rom[  214]='h00000000;
    rd_cycle[  215] = 1'b1;  wr_cycle[  215] = 1'b0;  addr_rom[  215]='h0000003c;  wr_data_rom[  215]='h00000000;
    rd_cycle[  216] = 1'b1;  wr_cycle[  216] = 1'b0;  addr_rom[  216]='h00000040;  wr_data_rom[  216]='h00000000;
    rd_cycle[  217] = 1'b1;  wr_cycle[  217] = 1'b0;  addr_rom[  217]='h00000044;  wr_data_rom[  217]='h00000000;
    rd_cycle[  218] = 1'b1;  wr_cycle[  218] = 1'b0;  addr_rom[  218]='h00000048;  wr_data_rom[  218]='h00000000;
    rd_cycle[  219] = 1'b1;  wr_cycle[  219] = 1'b0;  addr_rom[  219]='h0000004c;  wr_data_rom[  219]='h00000000;
    rd_cycle[  220] = 1'b1;  wr_cycle[  220] = 1'b0;  addr_rom[  220]='h00000050;  wr_data_rom[  220]='h00000000;
    rd_cycle[  221] = 1'b1;  wr_cycle[  221] = 1'b0;  addr_rom[  221]='h00000054;  wr_data_rom[  221]='h00000000;
    rd_cycle[  222] = 1'b1;  wr_cycle[  222] = 1'b0;  addr_rom[  222]='h00000058;  wr_data_rom[  222]='h00000000;
    rd_cycle[  223] = 1'b1;  wr_cycle[  223] = 1'b0;  addr_rom[  223]='h0000005c;  wr_data_rom[  223]='h00000000;
    rd_cycle[  224] = 1'b1;  wr_cycle[  224] = 1'b0;  addr_rom[  224]='h00000060;  wr_data_rom[  224]='h00000000;
    rd_cycle[  225] = 1'b1;  wr_cycle[  225] = 1'b0;  addr_rom[  225]='h00000064;  wr_data_rom[  225]='h00000000;
    rd_cycle[  226] = 1'b1;  wr_cycle[  226] = 1'b0;  addr_rom[  226]='h00000068;  wr_data_rom[  226]='h00000000;
    rd_cycle[  227] = 1'b1;  wr_cycle[  227] = 1'b0;  addr_rom[  227]='h0000006c;  wr_data_rom[  227]='h00000000;
    rd_cycle[  228] = 1'b1;  wr_cycle[  228] = 1'b0;  addr_rom[  228]='h00000070;  wr_data_rom[  228]='h00000000;
    rd_cycle[  229] = 1'b1;  wr_cycle[  229] = 1'b0;  addr_rom[  229]='h00000074;  wr_data_rom[  229]='h00000000;
    rd_cycle[  230] = 1'b1;  wr_cycle[  230] = 1'b0;  addr_rom[  230]='h00000078;  wr_data_rom[  230]='h00000000;
    rd_cycle[  231] = 1'b1;  wr_cycle[  231] = 1'b0;  addr_rom[  231]='h0000007c;  wr_data_rom[  231]='h00000000;
    rd_cycle[  232] = 1'b1;  wr_cycle[  232] = 1'b0;  addr_rom[  232]='h00000080;  wr_data_rom[  232]='h00000000;
    rd_cycle[  233] = 1'b1;  wr_cycle[  233] = 1'b0;  addr_rom[  233]='h00000084;  wr_data_rom[  233]='h00000000;
    rd_cycle[  234] = 1'b1;  wr_cycle[  234] = 1'b0;  addr_rom[  234]='h00000088;  wr_data_rom[  234]='h00000000;
    rd_cycle[  235] = 1'b1;  wr_cycle[  235] = 1'b0;  addr_rom[  235]='h0000008c;  wr_data_rom[  235]='h00000000;
    rd_cycle[  236] = 1'b1;  wr_cycle[  236] = 1'b0;  addr_rom[  236]='h00000090;  wr_data_rom[  236]='h00000000;
    rd_cycle[  237] = 1'b1;  wr_cycle[  237] = 1'b0;  addr_rom[  237]='h00000094;  wr_data_rom[  237]='h00000000;
    rd_cycle[  238] = 1'b1;  wr_cycle[  238] = 1'b0;  addr_rom[  238]='h00000098;  wr_data_rom[  238]='h00000000;
    rd_cycle[  239] = 1'b1;  wr_cycle[  239] = 1'b0;  addr_rom[  239]='h0000009c;  wr_data_rom[  239]='h00000000;
end

initial begin
    validation_data[    0] = 'h0000008c; 
    validation_data[    1] = 'h00000046; 
    validation_data[    2] = 'h0000008f; 
    validation_data[    3] = 'h00000007; 
    validation_data[    4] = 'h0000001d; 
    validation_data[    5] = 'h00000021; 
    validation_data[    6] = 'h00000024; 
    validation_data[    7] = 'h0000004b; 
    validation_data[    8] = 'h00000041; 
    validation_data[    9] = 'h0000003f; 
    validation_data[   10] = 'h00000039; 
    validation_data[   11] = 'h00000007; 
    validation_data[   12] = 'h0000004b; 
    validation_data[   13] = 'h00000065; 
    validation_data[   14] = 'h00000061; 
    validation_data[   15] = 'h00000025; 
    validation_data[   16] = 'h00000073; 
    validation_data[   17] = 'h00000068; 
    validation_data[   18] = 'h0000001d; 
    validation_data[   19] = 'h0000003a; 
    validation_data[   20] = 'h0000007e; 
    validation_data[   21] = 'h00000091; 
    validation_data[   22] = 'h0000009c; 
    validation_data[   23] = 'h00000015; 
    validation_data[   24] = 'h0000006d; 
    validation_data[   25] = 'h00000046; 
    validation_data[   26] = 'h0000004e; 
    validation_data[   27] = 'h0000009d; 
    validation_data[   28] = 'h00000029; 
    validation_data[   29] = 'h0000002c; 
    validation_data[   30] = 'h00000031; 
    validation_data[   31] = 'h0000008d; 
    validation_data[   32] = 'h0000008a; 
    validation_data[   33] = 'h00000092; 
    validation_data[   34] = 'h00000049; 
    validation_data[   35] = 'h00000092; 
    validation_data[   36] = 'h0000005f; 
    validation_data[   37] = 'h00000000; 
    validation_data[   38] = 'h0000004f; 
    validation_data[   39] = 'h0000004e; 

end


reg clk = 1'b1, rst = 1'b1;
initial #4 rst = 1'b0;
always  #1 clk = ~clk;

wire  miss;
wire [31:0] rd_data;
reg  [31:0] index = 0, wr_data = 0, addr = 0;
reg  rd_req = 1'b0, wr_req = 1'b0;
reg rd_req_ff = 1'b0, miss_ff = 1'b0;
reg [31:0] validation_count = 0;

always @ (posedge clk or posedge rst)
    if(rst) begin
        rd_req_ff <= 1'b0;
        miss_ff   <= 1'b0;
    end else begin
        rd_req_ff <= rd_req;
        miss_ff   <= miss;
    end

always @ (posedge clk or posedge rst)
    if(rst) begin
        validation_count <= 0;
    end else begin
        if(validation_count>=`DATA_COUNT) begin
            validation_count <= 'hffffffff;
        end else if(rd_req_ff && (index>(4*`DATA_COUNT))) begin
            if(~miss_ff) begin
                if(validation_data[validation_count]==rd_data)
                    validation_count <= validation_count+1;
                else
                    validation_count <= 0;
            end
        end else begin
            validation_count <= 0;
        end
    end

always @ (posedge clk or posedge rst)
    if(rst) begin
        index   <= 0;
        wr_data <= 0;
        addr    <= 0;
        rd_req  <= 1'b0;
        wr_req  <= 1'b0;
    end else begin
        if(~miss) begin
            if(index<`RDWR_COUNT) begin
                if(wr_cycle[index]) begin
                    rd_req  <= 1'b0;
                    wr_req  <= 1'b1;
                end else if(rd_cycle[index]) begin
                    wr_data <= 0;
                    rd_req  <= 1'b1;
                    wr_req  <= 1'b0;
                end else begin
                    wr_data <= 0;
                    rd_req  <= 1'b0;
                    wr_req  <= 1'b0;
                end
                wr_data <= wr_data_rom[index];
                addr    <= addr_rom[index];
                index <= index + 1;
            end else begin
                wr_data <= 0;
                addr    <= 0;
                rd_req  <= 1'b0;
                wr_req  <= 1'b0;
            end
        end
    end

cache #(
    .LINE_ADDR_LEN  ( 3             ),
    .SET_ADDR_LEN   ( 2             ),
    .TAG_ADDR_LEN   ( 12            ),
    .WAY_CNT        ( 3             )
) cache_test_instance (
    .clk            ( clk           ),
    .rst            ( rst           ),
    .miss           ( miss          ),
    .addr           ( addr          ),
    .rd_req         ( rd_req        ),
    .rd_data        ( rd_data       ),
    .wr_req         ( wr_req        ),
    .wr_data        ( wr_data       )
);

endmodule

