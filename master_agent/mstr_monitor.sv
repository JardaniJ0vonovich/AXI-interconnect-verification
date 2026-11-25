class mstr_monitor extends uvm_monitor;
    `uvm_component_utils(mstr_monitor)

    function new(string name = "mstr_monitor",
                 uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass
