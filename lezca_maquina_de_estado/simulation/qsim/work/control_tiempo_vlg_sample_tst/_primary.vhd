library verilog;
use verilog.vl_types.all;
entity control_tiempo_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        R2              : in     vl_logic;
        reset_A         : in     vl_logic;
        S               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end control_tiempo_vlg_sample_tst;
