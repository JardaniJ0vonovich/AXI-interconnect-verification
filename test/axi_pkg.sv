package axi_pkg;

    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // Master Agent
    `include "mstr_agent_config.sv"
    `include "mstr_sequencer.sv"
    `include "mstr_seqs.sv"
    `include "mstr_driver.sv"
    `include "mstr_monitor.sv"
    `include "mstr_agent.sv"
    `include "mstr_agent_top.sv"

    // Slave Agent
    `include "slv_agent_config.sv"
    `include "slv_sequencer.sv"
    `include "slv_seqs.sv"
    `include "slv_driver.sv"
    `include "slv_monitor.sv"
    `include "slv_agent.sv"
    `include "slv_agent_top.sv"

    // Environment
    `include "env_config.sv"
    `include "env.sv"

    // Test
    `include "test.sv"

endpackage : axi_pkg
