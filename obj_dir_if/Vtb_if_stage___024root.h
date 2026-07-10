// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtb_if_stage.h for the primary calling header

#ifndef VERILATED_VTB_IF_STAGE___024ROOT_H_
#define VERILATED_VTB_IF_STAGE___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vtb_if_stage__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtb_if_stage___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ tb_if_stage__DOT__clk;
    CData/*0:0*/ tb_if_stage__DOT__rst;
    CData/*0:0*/ tb_if_stage__DOT__branch_taken;
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __Vtrigprevexpr___TOP__tb_if_stage__DOT__clk__0;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ tb_if_stage__DOT__branch_target;
    IData/*31:0*/ tb_if_stage__DOT__DUT__DOT__pc_wire;
    IData/*31:0*/ tb_if_stage__DOT__DUT__DOT__IF_UNIT__DOT__next_pc;
    IData/*31:0*/ __VactIterCount;
    VlUnpacked<IData/*31:0*/, 1024> tb_if_stage__DOT__DUT__DOT__IMEM_UNIT__DOT__imem;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<2> __VactTriggered;
    VlTriggerVec<2> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vtb_if_stage__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtb_if_stage___024root(Vtb_if_stage__Syms* symsp, const char* v__name);
    ~Vtb_if_stage___024root();
    VL_UNCOPYABLE(Vtb_if_stage___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
