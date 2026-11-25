class slv_monitor extends uvm_monitor;
    `uvm_component_utils(slv_monitor)

    function new(string name = "slv_monitor",
                 uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass
