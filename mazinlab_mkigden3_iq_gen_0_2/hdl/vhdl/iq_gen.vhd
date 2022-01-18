-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
-- Version: 2021.1
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity iq_gen is
generic (
    C_S_AXI_CONTROL_ADDR_WIDTH : INTEGER := 5;
    C_S_AXI_CONTROL_DATA_WIDTH : INTEGER := 32 );
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    out_r_TDATA : OUT STD_LOGIC_VECTOR (255 downto 0);
    out_r_TVALID : OUT STD_LOGIC;
    out_r_TREADY : IN STD_LOGIC;
    out_r_TKEEP : OUT STD_LOGIC_VECTOR (31 downto 0);
    out_r_TSTRB : OUT STD_LOGIC_VECTOR (31 downto 0);
    out_r_TUSER : OUT STD_LOGIC_VECTOR (7 downto 0);
    out_r_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    s_axi_control_AWVALID : IN STD_LOGIC;
    s_axi_control_AWREADY : OUT STD_LOGIC;
    s_axi_control_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_WVALID : IN STD_LOGIC;
    s_axi_control_WREADY : OUT STD_LOGIC;
    s_axi_control_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH/8-1 downto 0);
    s_axi_control_ARVALID : IN STD_LOGIC;
    s_axi_control_ARREADY : OUT STD_LOGIC;
    s_axi_control_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_RVALID : OUT STD_LOGIC;
    s_axi_control_RREADY : IN STD_LOGIC;
    s_axi_control_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_control_BVALID : OUT STD_LOGIC;
    s_axi_control_BREADY : IN STD_LOGIC;
    s_axi_control_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0) );
end;


architecture behav of iq_gen is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "iq_gen_iq_gen,hls_ip_2021_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu28dr-ffvg1517-2-e,HLS_INPUT_CLOCK=1.818000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.016000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=209,HLS_SYN_LUT=797,HLS_VERSION=2021_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv32_B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001011";
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv32_D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001101";
    constant ap_const_lv32_E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001110";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal max : STD_LOGIC_VECTOR (31 downto 0);
    signal out_r_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal i2_reg_118 : STD_LOGIC_VECTOR (31 downto 0);
    signal max_read_reg_298 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln9_1_fu_129_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal empty_10_fu_138_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_10_reg_308 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state3_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal p_Result_7_fu_186_p10 : STD_LOGIC_VECTOR (255 downto 0);
    signal tmp_user_V_fu_209_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_user_V_reg_325 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_fu_214_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_reg_331 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Result_1_7_fu_260_p9 : STD_LOGIC_VECTOR (255 downto 0);
    signal ap_block_state4_pp0_stage1_iter0 : BOOLEAN;
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal tmp_user_V_1_fu_281_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_last_V_fu_287_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln9_fu_294_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln9_reg_352 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal ap_condition_pp0_flush_enable : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_phi_mux_i2_phi_fu_122_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal ap_block_pp0_stage1_01001 : BOOLEAN;
    signal or_ln13_6_fu_180_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln13_5_fu_174_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln13_4_fu_168_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln13_3_fu_162_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln13_2_fu_156_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln13_1_fu_150_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln13_fu_144_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_fu_134_p1 : STD_LOGIC_VECTOR (28 downto 0);
    signal or_ln18_6_fu_255_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln18_5_fu_250_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln18_4_fu_245_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln18_3_fu_240_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln18_2_fu_235_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln18_1_fu_230_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal or_ln18_fu_225_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul121_fu_220_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal regslice_both_out_V_data_V_U_apdone_blk : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal out_r_TDATA_int_regslice : STD_LOGIC_VECTOR (255 downto 0);
    signal out_r_TVALID_int_regslice : STD_LOGIC;
    signal out_r_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_out_V_data_V_U_vld_out : STD_LOGIC;
    signal regslice_both_out_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_out_V_keep_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_out_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_out_V_strb_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_out_V_strb_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_out_V_strb_V_U_vld_out : STD_LOGIC;
    signal regslice_both_out_V_user_V_U_apdone_blk : STD_LOGIC;
    signal out_r_TUSER_int_regslice : STD_LOGIC_VECTOR (7 downto 0);
    signal regslice_both_out_V_user_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_out_V_user_V_U_vld_out : STD_LOGIC;
    signal regslice_both_out_V_last_V_U_apdone_blk : STD_LOGIC;
    signal out_r_TLAST_int_regslice : STD_LOGIC_VECTOR (0 downto 0);
    signal regslice_both_out_V_last_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_out_V_last_V_U_vld_out : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component iq_gen_control_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        max : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component iq_gen_regslice_both IS
    generic (
        DataWidth : INTEGER );
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_in : IN STD_LOGIC;
        ack_in : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_out : OUT STD_LOGIC;
        ack_out : IN STD_LOGIC;
        apdone_blk : OUT STD_LOGIC );
    end component;



begin
    control_s_axi_U : component iq_gen_control_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_CONTROL_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_CONTROL_DATA_WIDTH)
    port map (
        AWVALID => s_axi_control_AWVALID,
        AWREADY => s_axi_control_AWREADY,
        AWADDR => s_axi_control_AWADDR,
        WVALID => s_axi_control_WVALID,
        WREADY => s_axi_control_WREADY,
        WDATA => s_axi_control_WDATA,
        WSTRB => s_axi_control_WSTRB,
        ARVALID => s_axi_control_ARVALID,
        ARREADY => s_axi_control_ARREADY,
        ARADDR => s_axi_control_ARADDR,
        RVALID => s_axi_control_RVALID,
        RREADY => s_axi_control_RREADY,
        RDATA => s_axi_control_RDATA,
        RRESP => s_axi_control_RRESP,
        BVALID => s_axi_control_BVALID,
        BREADY => s_axi_control_BREADY,
        BRESP => s_axi_control_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        max => max);

    regslice_both_out_V_data_V_U : component iq_gen_regslice_both
    generic map (
        DataWidth => 256)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => out_r_TDATA_int_regslice,
        vld_in => out_r_TVALID_int_regslice,
        ack_in => out_r_TREADY_int_regslice,
        data_out => out_r_TDATA,
        vld_out => regslice_both_out_V_data_V_U_vld_out,
        ack_out => out_r_TREADY,
        apdone_blk => regslice_both_out_V_data_V_U_apdone_blk);

    regslice_both_out_V_keep_V_U : component iq_gen_regslice_both
    generic map (
        DataWidth => 32)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => ap_const_lv32_0,
        vld_in => out_r_TVALID_int_regslice,
        ack_in => regslice_both_out_V_keep_V_U_ack_in_dummy,
        data_out => out_r_TKEEP,
        vld_out => regslice_both_out_V_keep_V_U_vld_out,
        ack_out => out_r_TREADY,
        apdone_blk => regslice_both_out_V_keep_V_U_apdone_blk);

    regslice_both_out_V_strb_V_U : component iq_gen_regslice_both
    generic map (
        DataWidth => 32)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => ap_const_lv32_0,
        vld_in => out_r_TVALID_int_regslice,
        ack_in => regslice_both_out_V_strb_V_U_ack_in_dummy,
        data_out => out_r_TSTRB,
        vld_out => regslice_both_out_V_strb_V_U_vld_out,
        ack_out => out_r_TREADY,
        apdone_blk => regslice_both_out_V_strb_V_U_apdone_blk);

    regslice_both_out_V_user_V_U : component iq_gen_regslice_both
    generic map (
        DataWidth => 8)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => out_r_TUSER_int_regslice,
        vld_in => out_r_TVALID_int_regslice,
        ack_in => regslice_both_out_V_user_V_U_ack_in_dummy,
        data_out => out_r_TUSER,
        vld_out => regslice_both_out_V_user_V_U_vld_out,
        ack_out => out_r_TREADY,
        apdone_blk => regslice_both_out_V_user_V_U_apdone_blk);

    regslice_both_out_V_last_V_U : component iq_gen_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => out_r_TLAST_int_regslice,
        vld_in => out_r_TVALID_int_regslice,
        ack_in => regslice_both_out_V_last_V_U_ack_in_dummy,
        data_out => out_r_TLAST,
        vld_out => regslice_both_out_V_last_V_U_vld_out,
        ack_out => out_r_TREADY,
        apdone_blk => regslice_both_out_V_last_V_U_apdone_blk);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_pp0_flush_enable)) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((icmp_ln9_1_fu_129_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)))) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                elsif (((icmp_ln9_1_fu_129_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i2_reg_118_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln9_1_fu_129_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                i2_reg_118 <= ap_const_lv32_0;
            elsif (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln9_reg_352 = ap_const_lv1_1))) then 
                i2_reg_118 <= i_reg_331;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                    empty_10_reg_308(31 downto 3) <= empty_10_fu_138_p2(31 downto 3);
                tmp_user_V_reg_325 <= tmp_user_V_fu_209_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                i_reg_331 <= i_fu_214_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                icmp_ln9_reg_352 <= icmp_ln9_fu_294_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                max_read_reg_298 <= max;
            end if;
        end if;
    end process;
    empty_10_reg_308(2 downto 0) <= "000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, icmp_ln9_1_fu_129_p2, ap_CS_fsm_state2, ap_block_pp0_stage1_subdone, ap_block_pp0_stage0_subdone, ap_CS_fsm_state6, regslice_both_out_V_data_V_U_apdone_blk)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln9_1_fu_129_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                elsif (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage1_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when ap_ST_fsm_state6 => 
                if (((regslice_both_out_V_data_V_U_apdone_blk = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state6))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(2);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(3);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state6 <= ap_CS_fsm(4);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;

    ap_ST_fsm_state6_blk_assign_proc : process(regslice_both_out_V_data_V_U_apdone_blk)
    begin
        if ((regslice_both_out_V_data_V_U_apdone_blk = ap_const_logic_1)) then 
            ap_ST_fsm_state6_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state6_blk <= ap_const_logic_0;
        end if; 
    end process;

        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, out_r_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_01001 <= (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (out_r_TREADY_int_regslice = ap_const_logic_0)) or ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (out_r_TREADY_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, out_r_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_11001 <= (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (out_r_TREADY_int_regslice = ap_const_logic_0)) or ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (out_r_TREADY_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, out_r_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_subdone <= (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (out_r_TREADY_int_regslice = ap_const_logic_0)) or ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (out_r_TREADY_int_regslice = ap_const_logic_0)));
    end process;

        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage1_01001_assign_proc : process(ap_enable_reg_pp0_iter0, out_r_TREADY_int_regslice)
    begin
                ap_block_pp0_stage1_01001 <= ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (out_r_TREADY_int_regslice = ap_const_logic_0));
    end process;


    ap_block_pp0_stage1_11001_assign_proc : process(ap_enable_reg_pp0_iter0, out_r_TREADY_int_regslice)
    begin
                ap_block_pp0_stage1_11001 <= ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (out_r_TREADY_int_regslice = ap_const_logic_0));
    end process;


    ap_block_pp0_stage1_subdone_assign_proc : process(ap_enable_reg_pp0_iter0, out_r_TREADY_int_regslice)
    begin
                ap_block_pp0_stage1_subdone <= ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (out_r_TREADY_int_regslice = ap_const_logic_0));
    end process;


    ap_block_state3_pp0_stage0_iter0_assign_proc : process(out_r_TREADY_int_regslice)
    begin
                ap_block_state3_pp0_stage0_iter0 <= (out_r_TREADY_int_regslice = ap_const_logic_0);
    end process;


    ap_block_state4_pp0_stage1_iter0_assign_proc : process(out_r_TREADY_int_regslice)
    begin
                ap_block_state4_pp0_stage1_iter0 <= (out_r_TREADY_int_regslice = ap_const_logic_0);
    end process;


    ap_block_state5_pp0_stage0_iter1_assign_proc : process(out_r_TREADY_int_regslice)
    begin
                ap_block_state5_pp0_stage0_iter1 <= (out_r_TREADY_int_regslice = ap_const_logic_0);
    end process;


    ap_condition_pp0_flush_enable_assign_proc : process(ap_CS_fsm_pp0_stage1, icmp_ln9_fu_294_p2, ap_block_pp0_stage1_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (icmp_ln9_fu_294_p2 = ap_const_lv1_0))) then 
            ap_condition_pp0_flush_enable <= ap_const_logic_1;
        else 
            ap_condition_pp0_flush_enable <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_state6, regslice_both_out_V_data_V_U_apdone_blk)
    begin
        if (((regslice_both_out_V_data_V_U_apdone_blk = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_i2_phi_fu_122_p4_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_enable_reg_pp0_iter1, i2_reg_118, i_reg_331, icmp_ln9_reg_352)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln9_reg_352 = ap_const_lv1_1))) then 
            ap_phi_mux_i2_phi_fu_122_p4 <= i_reg_331;
        else 
            ap_phi_mux_i2_phi_fu_122_p4 <= i2_reg_118;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state6, regslice_both_out_V_data_V_U_apdone_blk)
    begin
        if (((regslice_both_out_V_data_V_U_apdone_blk = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    empty_10_fu_138_p2 <= std_logic_vector(shift_left(unsigned(ap_phi_mux_i2_phi_fu_122_p4),to_integer(unsigned('0' & ap_const_lv32_3(31-1 downto 0)))));
    empty_fu_134_p1 <= ap_phi_mux_i2_phi_fu_122_p4(29 - 1 downto 0);
    i_fu_214_p2 <= std_logic_vector(unsigned(ap_phi_mux_i2_phi_fu_122_p4) + unsigned(ap_const_lv32_2));
    icmp_ln9_1_fu_129_p2 <= "1" when (max_read_reg_298 = ap_const_lv32_0) else "0";
    icmp_ln9_fu_294_p2 <= "1" when (unsigned(i_reg_331) < unsigned(max_read_reg_298)) else "0";
    mul121_fu_220_p2 <= (empty_10_reg_308 or ap_const_lv32_8);
    or_ln13_1_fu_150_p2 <= (empty_10_fu_138_p2 or ap_const_lv32_2);
    or_ln13_2_fu_156_p2 <= (empty_10_fu_138_p2 or ap_const_lv32_3);
    or_ln13_3_fu_162_p2 <= (empty_10_fu_138_p2 or ap_const_lv32_4);
    or_ln13_4_fu_168_p2 <= (empty_10_fu_138_p2 or ap_const_lv32_5);
    or_ln13_5_fu_174_p2 <= (empty_10_fu_138_p2 or ap_const_lv32_6);
    or_ln13_6_fu_180_p2 <= (empty_10_fu_138_p2 or ap_const_lv32_7);
    or_ln13_fu_144_p2 <= (empty_10_fu_138_p2 or ap_const_lv32_1);
    or_ln18_1_fu_230_p2 <= (empty_10_reg_308 or ap_const_lv32_A);
    or_ln18_2_fu_235_p2 <= (empty_10_reg_308 or ap_const_lv32_B);
    or_ln18_3_fu_240_p2 <= (empty_10_reg_308 or ap_const_lv32_C);
    or_ln18_4_fu_245_p2 <= (empty_10_reg_308 or ap_const_lv32_D);
    or_ln18_5_fu_250_p2 <= (empty_10_reg_308 or ap_const_lv32_E);
    or_ln18_6_fu_255_p2 <= (empty_10_reg_308 or ap_const_lv32_F);
    or_ln18_fu_225_p2 <= (empty_10_reg_308 or ap_const_lv32_9);

    out_r_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1, ap_enable_reg_pp0_iter1, out_r_TREADY_int_regslice)
    begin
        if ((((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)) or ((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            out_r_TDATA_blk_n <= out_r_TREADY_int_regslice;
        else 
            out_r_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    out_r_TDATA_int_regslice_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, p_Result_7_fu_186_p10, p_Result_1_7_fu_260_p9, ap_block_pp0_stage0_01001, ap_block_pp0_stage1_01001)
    begin
        if ((ap_enable_reg_pp0_iter0 = ap_const_logic_1)) then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_01001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                out_r_TDATA_int_regslice <= p_Result_1_7_fu_260_p9;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                out_r_TDATA_int_regslice <= p_Result_7_fu_186_p10;
            else 
                out_r_TDATA_int_regslice <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            out_r_TDATA_int_regslice <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    out_r_TLAST_int_regslice_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, tmp_last_V_fu_287_p2, ap_block_pp0_stage0_01001, ap_block_pp0_stage1_01001)
    begin
        if ((ap_enable_reg_pp0_iter0 = ap_const_logic_1)) then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_01001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                out_r_TLAST_int_regslice <= tmp_last_V_fu_287_p2;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                out_r_TLAST_int_regslice <= ap_const_lv1_0;
            else 
                out_r_TLAST_int_regslice <= "X";
            end if;
        else 
            out_r_TLAST_int_regslice <= "X";
        end if; 
    end process;


    out_r_TUSER_int_regslice_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, tmp_user_V_fu_209_p1, tmp_user_V_1_fu_281_p2, ap_block_pp0_stage0_01001, ap_block_pp0_stage1_01001)
    begin
        if ((ap_enable_reg_pp0_iter0 = ap_const_logic_1)) then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_01001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                out_r_TUSER_int_regslice <= tmp_user_V_1_fu_281_p2;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                out_r_TUSER_int_regslice <= tmp_user_V_fu_209_p1;
            else 
                out_r_TUSER_int_regslice <= "XXXXXXXX";
            end if;
        else 
            out_r_TUSER_int_regslice <= "XXXXXXXX";
        end if; 
    end process;

    out_r_TVALID <= regslice_both_out_V_data_V_U_vld_out;

    out_r_TVALID_int_regslice_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage0_11001, ap_block_pp0_stage1_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)))) then 
            out_r_TVALID_int_regslice <= ap_const_logic_1;
        else 
            out_r_TVALID_int_regslice <= ap_const_logic_0;
        end if; 
    end process;

    p_Result_1_7_fu_260_p9 <= (((((((or_ln18_6_fu_255_p2 & or_ln18_5_fu_250_p2) & or_ln18_4_fu_245_p2) & or_ln18_3_fu_240_p2) & or_ln18_2_fu_235_p2) & or_ln18_1_fu_230_p2) & or_ln18_fu_225_p2) & mul121_fu_220_p2);
    p_Result_7_fu_186_p10 <= ((((((((or_ln13_6_fu_180_p2 & or_ln13_5_fu_174_p2) & or_ln13_4_fu_168_p2) & or_ln13_3_fu_162_p2) & or_ln13_2_fu_156_p2) & or_ln13_1_fu_150_p2) & or_ln13_fu_144_p2) & empty_fu_134_p1) & ap_const_lv3_0);
    tmp_last_V_fu_287_p2 <= "1" when (tmp_user_V_1_fu_281_p2 = ap_const_lv8_FF) else "0";
    tmp_user_V_1_fu_281_p2 <= (tmp_user_V_reg_325 or ap_const_lv8_1);
    tmp_user_V_fu_209_p1 <= ap_phi_mux_i2_phi_fu_122_p4(8 - 1 downto 0);
end behav;