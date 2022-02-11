`timescale 1 ns / 1 ps

module iq_gen_hls_deadlock_idx0_monitor ( // for module iq_gen_iq_gen_inst
    input wire clock,
    input wire reset,
    input wire [3:0] axis_block_sigs,
    input wire [0:0] inst_idle_sigs,
    input wire [0:0] inst_block_sigs,
    output wire [15:0] axis_block_info,
    output wire block
);

// signal declare
reg [15:0] monitor_axis_block_info;
reg monitor_find_block;
wire sub_parallel_block;
wire all_sub_parallel_has_block;
wire all_sub_single_has_block;
wire cur_axis_has_block;
wire seq_is_axis_block;

assign axis_block_info = (monitor_find_block == 1'b1) ? monitor_axis_block_info : 16'h0;
assign block = monitor_find_block;
assign all_sub_parallel_has_block = 1'b0;
assign all_sub_single_has_block = 1'b0;
assign cur_axis_has_block = 1'b0 | axis_block_sigs[0] | axis_block_sigs[1] | axis_block_sigs[2] | axis_block_sigs[3];
assign seq_is_axis_block = all_sub_parallel_has_block | all_sub_single_has_block | cur_axis_has_block;

always @(posedge clock) begin
    if (reset == 1'b1)
        monitor_find_block <= 1'b0;
    else if (seq_is_axis_block == 1'b1)
        monitor_find_block <= 1'b1;
    else
        monitor_find_block <= 1'b0;
end

always @(posedge clock) begin
    if (reset == 1'b1)
        monitor_axis_block_info[3:0] <= 4'h0;
    else if (axis_block_sigs[0])
        monitor_axis_block_info[3:0] <= ~(4'h1 << 0);
    else
        monitor_axis_block_info[3:0] <= 4'h0;
end
always @(posedge clock) begin
    if (reset == 1'b1)
        monitor_axis_block_info[7:4] <= 4'h0;
    else if (axis_block_sigs[1])
        monitor_axis_block_info[7:4] <= ~(4'h1 << 1);
    else
        monitor_axis_block_info[7:4] <= 4'h0;
end
always @(posedge clock) begin
    if (reset == 1'b1)
        monitor_axis_block_info[11:8] <= 4'h0;
    else if (axis_block_sigs[2])
        monitor_axis_block_info[11:8] <= ~(4'h1 << 2);
    else
        monitor_axis_block_info[11:8] <= 4'h0;
end
always @(posedge clock) begin
    if (reset == 1'b1)
        monitor_axis_block_info[15:12] <= 4'h0;
    else if (axis_block_sigs[3])
        monitor_axis_block_info[15:12] <= ~(4'h1 << 3);
    else
        monitor_axis_block_info[15:12] <= 4'h0;
end

// instant sub module
endmodule
