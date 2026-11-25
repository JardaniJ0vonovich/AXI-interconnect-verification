class base_test extends uvm_test;

    	`uvm_component_utils(base_test)

    	env_config e_cfg;
    	env env_h;

    	function new(string name = "base_test", uvm_component parent = null);
        	super.new(name, parent);
    	endfunction

    	function void build_phase(uvm_phase phase);
        	super.build_phase(phase);

        	e_cfg = env_config::type_id::create("e_cfg");

        	e_cfg.no_of_masters = 2;
        	e_cfg.no_of_slaves  = 3;

        	e_cfg.m_cfg = new[e_cfg.no_of_masters];
        	e_cfg.s_cfg = new[e_cfg.no_of_slaves];

        	foreach(e_cfg.m_cfg[i]) 
		begin

            		e_cfg.m_cfg[i] = mstr_agent_config::type_id::create( $sformatf("m_cfg_%0d", i));

            		e_cfg.m_cfg[i].is_active = UVM_ACTIVE;

        	end

        	foreach(e_cfg.s_cfg[i]) 
		begin
			e_cfg.s_cfg[i] = slv_agent_config::type_id::create( $sformatf("s_cfg_%0d", i));

            		e_cfg.s_cfg[i].is_active = UVM_ACTIVE;

        	end

        	uvm_config_db #(env_config)::set(this, "env", "env_config", e_cfg );

        	env_h = env::type_id::create("env", this);

    	endfunction


    	function void end_of_elaboration_phase(uvm_phase phase);
        	super.end_of_elaboration_phase(phase);

        	uvm_top.print_topology();

    	endfunction

endclass
