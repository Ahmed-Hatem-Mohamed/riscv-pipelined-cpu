
## if_stage — verified via waveform
**Context:** Confirmed instruction_fetch + instruction_memory wired correctly as if_stage.
**Verification:** GTKWave inspection — pc increments by 4 each cycle under normal execution; correctly jumps to branch_target when branch_taken asserts.
**Outcome:** Passed. See docs/verification/if_stage/waveform.png.

## immediate_generator — RegWrite vs. immediate value vs. immediate offset
**Context:** Clarified that addi and lw use the identical I-type immediate encoding — the ALU always computes rs1 + immediate the same way. What differs is only what happens downstream: addi writes the ALU result back directly, lw treats that result as a memory address and writes back memory's output instead.
**Verification:** Self-checking testbench — I/S/B/U/J-type immediates all hand-verified against RV32I spec, all PASS.
**Outcome:** Passed. See docs/verification/immediate_generator/pass_output.png.

## control_unit — ResultSrc widened to 2 bits, ALUOp added, Branch/Jump split
**Context:** MemToReg couldn't stay 1-bit once jal needed a third writeback source (pc+4, alongside ALU result and memory data). Also needed a way to signal "look at funct3/funct7" for R-type/I-type ALU ops, and to distinguish beq's conditional branching from jal's unconditional jump.
**Decision:** ResultSrc widened to 2 bits (00=ALU, 01=memory, 10=pc+4). ALUOp added as a 2-bit coarse hint (00=add, 01=subtract, 10=defer to funct3/funct7, 11=pass-through for lui). Branch and Jump kept as two separate 1-bit signals rather than merged.
**Verification:** Self-checking testbench, all 7 instruction types (R, addi, lw, sw, beq, lui, jal), all PASS.
**Outcome:** Passed. See docs/verification/control_unit/pass_output.png.

## alu_control — resolving R-type sub-operations from funct3/funct7
**Context:** add, sub, and, or, slt all share opcode 0110011 — control_unit alone can't distinguish them, only emits alu_op=10 as a "look deeper" signal.
**Decision:** alu_op=00/01 force ADD/SUBTRACT unconditionally (lw/sw, beq). alu_op=10 triggers a nested case on funct3, with funct7[5] as the sole tiebreaker between add and sub (same funct3=000 for both).
**Verification:** Self-checking testbench, 8 cases including both funct7[5] states for funct3=000. All PASS.
**Outcome:** Passed. See docs/verification/alu_control/pass_output.png.

## alu_control — resolving R-type sub-operations from funct3/funct7
**Context:** add, sub, and, or, slt all share opcode 0110011 — control_unit alone can't distinguish them, only emits alu_op=10 as a "look deeper" signal.
**Decision:** alu_op=00/01 force ADD/SUBTRACT unconditionally (lw/sw, beq). alu_op=10 triggers a nested case on funct3, with funct7[5] as the sole tiebreaker between add and sub (same funct3=000 for both).
**Verification:** Self-checking testbench, 8 cases including both funct7[5] states for funct3=000. All PASS.
**Outcome:** Passed. See docs/verification/alu_control/pass_output.png.
