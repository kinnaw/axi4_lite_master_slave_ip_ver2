module axi4_lite_top_master #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32,
    parameter MEM_DEPTH  = 16
)(
    input  wire                       ACLK,
    input  wire                       ARESETn,
 
    
    output wire [ADDR_WIDTH-1:0]      AWADDR,
    output wire [2:0]                 AWPROT,
    output wire                       AWVALID,
    input  wire                       AWREADY,   
 
    
    output wire [DATA_WIDTH-1:0]      WDATA,
    output wire [(DATA_WIDTH/8)-1:0]  WSTRB,
    output wire                       WVALID,
    input  wire                       WREADY,    
 
    
    input  wire [1:0]                 BRESP,
    input  wire                       BVALID,
    output wire                       BREADY,    
 
    
    output wire [ADDR_WIDTH-1:0]      ARADDR,
    output wire [2:0]                 ARPROT,
    output wire                       ARVALID,
    input  wire                       ARREADY,  
 
   
    input  wire [DATA_WIDTH-1:0]      RDATA,
    input  wire [1:0]                 RRESP,
    input  wire                       RVALID,
    output wire                       RREADY,    
 
    
    input  wire                       wr_en,
    input  wire [ADDR_WIDTH-1:0]      awaddr_in,
    input  wire [DATA_WIDTH-1:0]      wdata_in,
    input  wire [(DATA_WIDTH/8)-1:0]  wstrb_in,
    input  wire [2:0]                 wr_prot,
    output wire [1:0]                 bresp_out,
 
    input  wire                       rd_en,
    input  wire [ADDR_WIDTH-1:0]      araddr_in,
    input  wire [2:0]                 rd_prot,
    output wire [DATA_WIDTH-1:0]      data_out,
    output wire [1:0]                 rresp_out
);

 axi4_lite_master #(
    .DATA_WIDTH (DATA_WIDTH),
    .ADDR_WIDTH (ADDR_WIDTH)
) u_master (
    .ACLK       (ACLK),       .ARESETn    (ARESETn),
    .AWADDR     (AWADDR),     .AWPROT     (AWPROT),
    .AWVALID    (AWVALID),    .AWREADY    (AWREADY),
    .WDATA      (WDATA),      .WSTRB      (WSTRB),
    .WVALID     (WVALID),     .WREADY     (WREADY),
    .BRESP      (BRESP),      .BVALID     (BVALID),     .BREADY     (BREADY),
    .ARADDR     (ARADDR),     .ARPROT     (ARPROT),
    .ARVALID    (ARVALID),    .ARREADY    (ARREADY),
    .RDATA      (RDATA),      .RRESP      (RRESP),
    .RVALID     (RVALID),     .RREADY     (RREADY),
    .wr_en      (wr_en),      .awaddr_in  (awaddr_in),
    .wdata_in   (wdata_in),   .wstrb_in   (wstrb_in),
    .wr_prot    (wr_prot),    .bresp_out  (bresp_out),
    .rd_en      (rd_en),      .araddr_in  (araddr_in),
    .rd_prot    (rd_prot),    .data_out   (data_out),
    .rresp_out  (rresp_out)
);
 
endmodule
