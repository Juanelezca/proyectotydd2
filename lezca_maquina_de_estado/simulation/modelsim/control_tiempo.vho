-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "11/06/2023 16:23:00"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	control_tiempo IS
    PORT (
	reset_A : IN std_logic;
	clock : IN std_logic;
	S : IN std_logic;
	R2 : IN std_logic;
	stop_and_go : OUT std_logic;
	Resultado : OUT std_logic;
	contador : OUT std_logic
	);
END control_tiempo;

-- Design Ports Information
-- stop_and_go	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Resultado	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- contador	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset_A	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF control_tiempo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_reset_A : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_S : std_logic;
SIGNAL ww_R2 : std_logic;
SIGNAL ww_stop_and_go : std_logic;
SIGNAL ww_Resultado : std_logic;
SIGNAL ww_contador : std_logic;
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reg_fstate.marcha~3_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \stop_and_go~output_o\ : std_logic;
SIGNAL \Resultado~output_o\ : std_logic;
SIGNAL \contador~output_o\ : std_logic;
SIGNAL \R2~input_o\ : std_logic;
SIGNAL \S~input_o\ : std_logic;
SIGNAL \reg_fstate.marcha~1_combout\ : std_logic;
SIGNAL \reg_fstate.marcha~2_combout\ : std_logic;
SIGNAL \fstate.marcha~q\ : std_logic;
SIGNAL \reg_fstate.vuelta_0~0_combout\ : std_logic;
SIGNAL \fstate.vuelta_0~q\ : std_logic;
SIGNAL \reg_fstate.vuelta_1~0_combout\ : std_logic;
SIGNAL \fstate.vuelta_1~q\ : std_logic;
SIGNAL \reg_fstate.vuelta_2~0_combout\ : std_logic;
SIGNAL \fstate.vuelta_2~q\ : std_logic;
SIGNAL \reg_fstate.Parar~0_combout\ : std_logic;
SIGNAL \reg_fstate.Parar~1_combout\ : std_logic;
SIGNAL \fstate.Parar~q\ : std_logic;
SIGNAL \reset_A~input_o\ : std_logic;
SIGNAL \stop_and_go~0_combout\ : std_logic;
SIGNAL \reg_fstate.marcha~0_combout\ : std_logic;
SIGNAL \contador~0_combout\ : std_logic;
SIGNAL \ALT_INV_contador~0_combout\ : std_logic;

BEGIN

ww_reset_A <= reset_A;
ww_clock <= clock;
ww_S <= S;
ww_R2 <= R2;
stop_and_go <= ww_stop_and_go;
Resultado <= ww_Resultado;
contador <= ww_contador;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);
\ALT_INV_contador~0_combout\ <= NOT \contador~0_combout\;

-- Location: LCCOMB_X1_Y4_N24
\reg_fstate.marcha~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg_fstate.marcha~3_combout\ = (\reset_A~input_o\ & !\R2~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset_A~input_o\,
	datac => \R2~input_o\,
	combout => \reg_fstate.marcha~3_combout\);

-- Location: IOIBUF_X0_Y16_N8
\clock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G2
\clock~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~inputclkctrl_outclk\);

-- Location: IOOBUF_X0_Y5_N23
\stop_and_go~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \stop_and_go~0_combout\,
	devoe => ww_devoe,
	o => \stop_and_go~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\Resultado~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg_fstate.marcha~0_combout\,
	devoe => ww_devoe,
	o => \Resultado~output_o\);

-- Location: IOOBUF_X0_Y4_N16
\contador~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_contador~0_combout\,
	devoe => ww_devoe,
	o => \contador~output_o\);

-- Location: IOIBUF_X0_Y4_N22
\R2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_R2,
	o => \R2~input_o\);

-- Location: IOIBUF_X1_Y0_N8
\S~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S,
	o => \S~input_o\);

-- Location: LCCOMB_X1_Y4_N18
\reg_fstate.marcha~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg_fstate.marcha~1_combout\ = (\reset_A~input_o\ & (\S~input_o\ & (!\R2~input_o\ & \fstate.marcha~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset_A~input_o\,
	datab => \S~input_o\,
	datac => \R2~input_o\,
	datad => \fstate.marcha~q\,
	combout => \reg_fstate.marcha~1_combout\);

-- Location: LCCOMB_X1_Y4_N2
\reg_fstate.marcha~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg_fstate.marcha~2_combout\ = (\reg_fstate.marcha~1_combout\) # ((\reset_A~input_o\ & (\R2~input_o\ & !\fstate.Parar~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset_A~input_o\,
	datab => \R2~input_o\,
	datac => \fstate.Parar~q\,
	datad => \reg_fstate.marcha~1_combout\,
	combout => \reg_fstate.marcha~2_combout\);

-- Location: FF_X1_Y4_N3
\fstate.marcha\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_fstate.marcha~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.marcha~q\);

-- Location: LCCOMB_X1_Y4_N26
\reg_fstate.vuelta_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg_fstate.vuelta_0~0_combout\ = (\reg_fstate.marcha~3_combout\ & ((\S~input_o\ & (\fstate.vuelta_0~q\)) # (!\S~input_o\ & ((\fstate.marcha~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_fstate.marcha~3_combout\,
	datab => \S~input_o\,
	datac => \fstate.vuelta_0~q\,
	datad => \fstate.marcha~q\,
	combout => \reg_fstate.vuelta_0~0_combout\);

-- Location: FF_X1_Y4_N27
\fstate.vuelta_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_fstate.vuelta_0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.vuelta_0~q\);

-- Location: LCCOMB_X1_Y4_N12
\reg_fstate.vuelta_1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg_fstate.vuelta_1~0_combout\ = (\reg_fstate.marcha~3_combout\ & ((\S~input_o\ & (\fstate.vuelta_1~q\)) # (!\S~input_o\ & ((\fstate.vuelta_0~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_fstate.marcha~3_combout\,
	datab => \S~input_o\,
	datac => \fstate.vuelta_1~q\,
	datad => \fstate.vuelta_0~q\,
	combout => \reg_fstate.vuelta_1~0_combout\);

-- Location: FF_X1_Y4_N13
\fstate.vuelta_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_fstate.vuelta_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.vuelta_1~q\);

-- Location: LCCOMB_X1_Y4_N30
\reg_fstate.vuelta_2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg_fstate.vuelta_2~0_combout\ = (\reg_fstate.marcha~3_combout\ & ((\S~input_o\ & (\fstate.vuelta_2~q\)) # (!\S~input_o\ & ((\fstate.vuelta_1~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_fstate.marcha~3_combout\,
	datab => \S~input_o\,
	datac => \fstate.vuelta_2~q\,
	datad => \fstate.vuelta_1~q\,
	combout => \reg_fstate.vuelta_2~0_combout\);

-- Location: FF_X1_Y4_N31
\fstate.vuelta_2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_fstate.vuelta_2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.vuelta_2~q\);

-- Location: LCCOMB_X1_Y4_N28
\reg_fstate.Parar~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg_fstate.Parar~0_combout\ = (\fstate.vuelta_0~q\) # ((\fstate.marcha~q\) # ((\fstate.vuelta_2~q\) # (\fstate.vuelta_1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fstate.vuelta_0~q\,
	datab => \fstate.marcha~q\,
	datac => \fstate.vuelta_2~q\,
	datad => \fstate.vuelta_1~q\,
	combout => \reg_fstate.Parar~0_combout\);

-- Location: LCCOMB_X1_Y4_N20
\reg_fstate.Parar~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg_fstate.Parar~1_combout\ = (\reset_A~input_o\ & ((\R2~input_o\ & ((!\reg_fstate.Parar~0_combout\))) # (!\R2~input_o\ & (\fstate.Parar~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset_A~input_o\,
	datab => \R2~input_o\,
	datac => \fstate.Parar~q\,
	datad => \reg_fstate.Parar~0_combout\,
	combout => \reg_fstate.Parar~1_combout\);

-- Location: FF_X1_Y4_N21
\fstate.Parar\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \reg_fstate.Parar~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fstate.Parar~q\);

-- Location: IOIBUF_X1_Y0_N1
\reset_A~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_A,
	o => \reset_A~input_o\);

-- Location: LCCOMB_X1_Y4_N10
\stop_and_go~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \stop_and_go~0_combout\ = (\fstate.Parar~q\ & \reset_A~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fstate.Parar~q\,
	datac => \reset_A~input_o\,
	combout => \stop_and_go~0_combout\);

-- Location: LCCOMB_X1_Y4_N8
\reg_fstate.marcha~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg_fstate.marcha~0_combout\ = (!\fstate.Parar~q\ & \reset_A~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fstate.Parar~q\,
	datac => \reset_A~input_o\,
	combout => \reg_fstate.marcha~0_combout\);

-- Location: LCCOMB_X1_Y4_N16
\contador~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \contador~0_combout\ = ((\fstate.marcha~q\) # (!\fstate.Parar~q\)) # (!\reset_A~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset_A~input_o\,
	datab => \fstate.marcha~q\,
	datac => \fstate.Parar~q\,
	combout => \contador~0_combout\);

ww_stop_and_go <= \stop_and_go~output_o\;

ww_Resultado <= \Resultado~output_o\;

ww_contador <= \contador~output_o\;
END structure;


