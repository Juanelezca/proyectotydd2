library verilog;
use verilog.vl_types.all;
entity control_tiempo is
    port(
        reset_A         : in     vl_logic;
        clock           : in     vl_logic;
        S               : in     vl_logic;
        R2              : in     vl_logic;
        stop_and_go     : out    vl_logic;
        Resultado       : out    vl_logic;
        contador        : out    vl_logic
    );
end control_tiempo;
