class slv_agent extends uvm_agent;

    `uvm_component_utils(slv_agent)

    slv_sequencer seqr;
    slv_driver    drv;
    slv_monitor   mon;

    slv_agent_config m_cfg;

    function new(string name = "slv_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

	 if (!uvm_config_db #(slv_agent_config)::get(this, "", "m_cfg", m_cfg))
            	`uvm_fatal("CONFIG", "Unable to get slave config")

         mon  = slv_monitor::type_id::create("mon", this);

	 if(m_cfg.is_active == UVM_ACTIVE)
	 begin
		 seqr = slv_sequencer::type_id::create("seqr", this);
        	 drv  = slv_driver::type_id::create("drv", this);
	 end

    endfunction

endclass
