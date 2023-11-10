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

-- Generated by Quartus II Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition
-- Created on Mon Nov 06 16:55:31 2023

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control_tiempo IS
    PORT (
        reset_A : IN STD_LOGIC := '0';
        clock : IN STD_LOGIC;
        S : IN STD_LOGIC := '0';
        R2 : IN STD_LOGIC := '0';
        stop_and_go : OUT STD_LOGIC;
        Resultado : OUT STD_LOGIC;
        contador : OUT STD_LOGIC
    );
END control_tiempo;

ARCHITECTURE BEHAVIOR OF control_tiempo IS
    TYPE type_fstate IS (Parar,vuelta_0,marcha,vuelta_1,vuelta_2,vuelta_3);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
    SIGNAL reg_stop_and_go : STD_LOGIC := '0';
    SIGNAL reg_Resultado : STD_LOGIC := '0';
BEGIN
    PROCESS (clock,reg_fstate)
    BEGIN
        IF (clock='1' AND clock'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,reset_A,S,R2,reg_stop_and_go,reg_Resultado)
    BEGIN
        IF (reset_A='0') THEN
            reg_fstate <= Parar;
            reg_stop_and_go <= '0';
            reg_Resultado <= '0';
            stop_and_go <= '0';
            Resultado <= '0';
            contador <= '0';
        ELSE
            reg_stop_and_go <= '0';
            reg_Resultado <= '0';
            contador <= '0';
            stop_and_go <= '0';
            Resultado <= '0';
            CASE fstate IS
                WHEN Parar =>
                    IF ((R2 = '1')) THEN
                        reg_fstate <= marcha;
                    ELSIF ((R2 = '0')) THEN
                        reg_fstate <= Parar;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= Parar;
                    END IF;

                    reg_stop_and_go <= '0';

                    reg_Resultado <= '1';

                    contador <= '0';
                WHEN vuelta_0 =>
                    IF (((S = '0') AND (R2 = '0'))) THEN
                        reg_fstate <= vuelta_1;
                    ELSIF (((R2 = '0') AND (S = '1'))) THEN
                        reg_fstate <= vuelta_0;
                    ELSIF ((R2 = '1')) THEN
                        reg_fstate <= Parar;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= vuelta_0;
                    END IF;

                    reg_stop_and_go <= '1';

                    reg_Resultado <= '0';

                    contador <= '1';
                    contador <= '1';
                WHEN marcha =>
                    IF (((S = '0') AND (R2 = '0'))) THEN
                        reg_fstate <= vuelta_0;
                    ELSIF (((R2 = '0') AND (S = '1'))) THEN
                        reg_fstate <= marcha;
                    ELSIF ((R2 = '1')) THEN
                        reg_fstate <= Parar;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= marcha;
                    END IF;

                    reg_stop_and_go <= '1';

                    reg_Resultado <= '0';

                    contador <= '0';
                WHEN vuelta_1 =>
                    IF (((S = '0') AND (R2 = '0'))) THEN
                        reg_fstate <= vuelta_2;
                    ELSIF (((R2 = '0') AND (S = '1'))) THEN
                        reg_fstate <= vuelta_1;
                    ELSIF ((R2 = '1')) THEN
                        reg_fstate <= Parar;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= vuelta_1;
                    END IF;

                    reg_stop_and_go <= '1';
                    reg_stop_and_go <= '1';

                    reg_Resultado <= '0';
                    reg_Resultado <= '0';

                    contador <= '1';
                WHEN vuelta_2 =>
                    IF (((S = '0') AND (R2 = '0'))) THEN
                        reg_fstate <= vuelta_3;
                    ELSIF (((R2 = '0') AND (S = '1'))) THEN
                        reg_fstate <= vuelta_2;
                    ELSIF ((R2 = '1')) THEN
                        reg_fstate <= Parar;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= vuelta_2;
                    END IF;

                    reg_stop_and_go <= '1';

                    reg_Resultado <= '0';

                    contador <= '1';
                WHEN vuelta_3 =>
                    IF (((R2 = '0') AND (S = '1'))) THEN
                        reg_fstate <= vuelta_3;
                    ELSIF ((S = '0')) THEN
                        reg_fstate <= Parar;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= vuelta_3;
                    END IF;

                    reg_stop_and_go <= '1';

                    reg_Resultado <= '0';

                    contador <= '1';
                WHEN OTHERS => 
                    reg_stop_and_go <= 'X';
                    reg_Resultado <= 'X';
                    contador <= 'X';
                    report "Reach undefined state";
            END CASE;
            stop_and_go <= reg_stop_and_go;
            Resultado <= reg_Resultado;
        END IF;
    END PROCESS;
END BEHAVIOR;
