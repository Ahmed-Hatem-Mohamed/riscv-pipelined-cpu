RTL_DIR = rtl
TB_DIR  = tb

RTL = \
	$(RTL_DIR)/instruction_fetch.sv \
	$(RTL_DIR)/instruction_memory.sv \
	$(RTL_DIR)/if_stage.sv

TB_IF = $(TB_DIR)/tb_if_stage.sv
TOP   = tb_if_stage

.PHONY: if clean

if:
	verilator -Wno-fatal --binary --trace \
		--top-module $(TOP) \
		$(RTL) \
		$(TB_IF)
	./obj_dir/V$(TOP)

clean:
	rm -rf obj_dir