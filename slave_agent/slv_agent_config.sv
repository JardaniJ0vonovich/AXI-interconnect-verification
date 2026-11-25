class slv_agent_config extends uvm_object;
	`uvm_object_utils(slv_agent_config)

	function new(string name = "slv_agent_config");
		super.new(name);
	endfunction

	uvm_active_passive_enum is_active = UVM_ACTIVE;
endclass
