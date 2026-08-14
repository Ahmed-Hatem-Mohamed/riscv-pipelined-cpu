RTL_DIR = rtl
TB_DIR  = tb

RTL_IF = \
	$(RTL_DIR)/instruction_fetch.sv \
	$(RTL_DIR)/instruction_memory.sv \
	$(RTL_DIR)/if_stage.sv
TB_IF  = $(TB_DIR)/tb_if_stage.sv
TOP_IF = tb_if_stage

RTL_IMMGEN = $(RTL_DIR)/immediate_generator.sv
TB_IMMGEN  = $(TB_DIR)/tb_immediate_generator.sv
TOP_IMMGEN = tb_immediate_generator

.PHONY: if immgen clean

if:
	verilator -Wno-fatal --binary --trace \
		--top-module $(TOP_IF) \
		$(RTL_IF) \
		$(TB_IF)
	./obj_dir/V$(TOP_IF)

immgen:
	verilator -Wno-fatal --binary --trace \
		--top-module $(TOP_IMMGEN) \
		$(RTL_IMMGEN) \
		$(TB_IMMGEN)
	./obj_dir/V$(TOP_IMMGEN)

RTL_CU = $(RTL_DIR)/control_unit.sv
TB_CU  = $(TB_DIR)/tb_control_unit.sv
TOP_CU = tb_control_unit

.PHONY: if immgen cu clean

cu:
	verilator -Wno-fatal --binary --trace \
		--top-module $(TOP_CU) \
		$(RTL_CU) \
		$(TB_CU)
	./obj_dir/V$(TOP_CU)

RTL_ALUCTRL = $(RTL_DIR)/alu_control.sv
TB_ALUCTRL  = $(TB_DIR)/tb_alu_control.sv
TOP_ALUCTRL = tb_alu_control

.PHONY: if immgen cu aluctrl clean

aluctrl:
	verilator -Wno-fatal --binary --trace \
		--top-module $(TOP_ALUCTRL) \
		$(RTL_ALUCTRL) \
		$(TB_ALUCTRL)
	./obj_dir/V$(TOP_ALUCTRL)

RTL_ALU = $(RTL_DIR)/alu.sv
TB_ALU  = $(TB_DIR)/tb_alu.sv
TOP_ALU = tb_alu

.PHONY: if immgen cu aluctrl alu clean

alu:
	verilator -Wno-fatal --binary --trace \
		--top-module $(TOP_ALU) \
		$(RTL_ALU) \
		$(TB_ALU)
	./obj_dir/V$(TOP_ALU)
clean:
	rm -rf obj_dir
	