library verilog;
use verilog.vl_types.all;
entity control_tiempo_vlg_check_tst is
    port(
        contador        : in     vl_logic;
        Resultado       : in     vl_logic;
        stop_and_go     : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end control_tiempo_vlg_check_tst;
