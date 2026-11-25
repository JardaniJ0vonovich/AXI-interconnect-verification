class mstr_sequencer extends uvm_sequencer;
    `uvm_component_utils(mstr_sequencer)

    function new(string name = "mstr_sequencer",
                 uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass
