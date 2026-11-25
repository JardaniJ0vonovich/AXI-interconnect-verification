class env_config extends uvm_object;

    	`uvm_object_utils(env_config)

    	mstr_agent_config m_cfg[];
    	slv_agent_config  s_cfg[];

    	int no_of_masters = 1;
    	int no_of_slaves  = 1;

    	function new(string name = "env_config");
        	super.new(name);
    	endfunction

endclass
