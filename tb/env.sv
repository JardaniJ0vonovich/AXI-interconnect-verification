class env extends uvm_env;

    	`uvm_component_utils(env)

    	env_config e_cfg;

    	mstr_agent_top mstr_top[];
    	slv_agent_top  slv_top[];

    	function new(string name = "env", uvm_component parent = null);
        	super.new(name, parent);
    	endfunction

    	function void build_phase(uvm_phase phase);
        	super.build_phase(phase);

        	if (!uvm_config_db #(env_config)::get(this, "", "env_config", e_cfg))
            		`uvm_fatal("ENV", "Unable to get env_config")

        	mstr_top = new[e_cfg.no_of_masters];

        	slv_top = new[e_cfg.no_of_slaves];

        	foreach(mstr_top[i]) 
		begin
            		uvm_config_db #(mstr_agent_config)::set( this, $sformatf("mstr_top_%0d", i), "mstr_agent_config", e_cfg.m_cfg[i] );

            		mstr_top[i] = mstr_agent_top::type_id::create($sformatf("mstr_top_%0d", i), this);
        	end

        	foreach(slv_top[i]) 
		begin
            		uvm_config_db #(slv_agent_config)::set( this, $sformatf("slv_top_%0d", i), "slv_agent_config", e_cfg.s_cfg[i] );

            		slv_top[i] = slv_agent_top::type_id::create($sformatf("slv_top_%0d", i), this);
        	end

    endfunction

endclass
