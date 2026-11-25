class mstr_agent extends uvm_agent;

    `uvm_component_utils(mstr_agent)

    mstr_sequencer seqr;
    mstr_driver    drv;
    mstr_monitor   mon;

    mstr_agent_config m_cfg;

    function new(string name = "mstr_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

	 if (!uvm_config_db #(mstr_agent_config)::get(this, "", "m_cfg", m_cfg))
            	`uvm_fatal("CONFIG", "Unable to get master config")

         mon  = mstr_monitor::type_id::create("mon", this);

	 if(m_cfg.is_active == UVM_ACTIVE)
	 begin
		 seqr = mstr_sequencer::type_id::create("seqr", this);
        	 drv  = mstr_driver::type_id::create("drv", this);
	 end

    endfunction

endclass
