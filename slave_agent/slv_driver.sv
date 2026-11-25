class slv_driver extends uvm_driver;
    `uvm_component_utils(slv_driver)

    function new(string name = "slv_driver",uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass
