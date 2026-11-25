class mstr_driver extends uvm_driver;
    `uvm_component_utils(mstr_driver)

    function new(string name = "mstr_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass
