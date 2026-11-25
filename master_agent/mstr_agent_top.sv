class mstr_agent_top extends uvm_env;
	`uvm_component_utils(mstr_agent_top)

	mstr_agent mstr_agt;

	mstr_agent_config m_cfg;

	function new (string name = "mstr_agent_top",uvm_component parent = null);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		if(!uvm_config_db#(mstr_agent_config)::get(this,"","mstr_agent_config",m_cfg))
			`uvm_fatal("master agent top","unable to get config")

		mstr_agt = mstr_agent::type_id::create("mstr_agt",this);

		uvm_config_db#(mstr_agent_config)::set(this,"mstr_agt","m_cfg",m_cfg);
	endfunction
endclass
