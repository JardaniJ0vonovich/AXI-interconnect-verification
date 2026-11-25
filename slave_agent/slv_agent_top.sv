class slv_agent_top extends uvm_env;
	`uvm_component_utils(slv_agent_top)

	slv_agent slv_agt;

	slv_agent_config m_cfg;

	function new (string name = "slv_agent_top",uvm_component parent = null);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		if(!uvm_config_db#(slv_agent_config)::get(this,"","slv_agent_config",m_cfg))
			`uvm_fatal("CONFIG","unable to get slave config")

		slv_agt = slv_agent::type_id::create("slv_agt",this);

		uvm_config_db#(slv_agent_config)::set(this,"slv_agt","m_cfg",m_cfg);
	endfunction
endclass
