// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_if_stage.h for the primary calling header

#include "Vtb_if_stage__pch.h"
#include "Vtb_if_stage__Syms.h"
#include "Vtb_if_stage___024root.h"

VL_INLINE_OPT VlCoroutine Vtb_if_stage___024root___eval_initial__TOP__Vtiming__0(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___eval_initial__TOP__Vtiming__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlWide<4>/*127:0*/ __Vtemp_1;
    // Body
    __Vtemp_1[0U] = 0x2e766364U;
    __Vtemp_1[1U] = 0x74616765U;
    __Vtemp_1[2U] = 0x69665f73U;
    __Vtemp_1[3U] = 0x73696d2fU;
    vlSymsp->_vm_contextp__->dumpfile(VL_CVT_PACK_STR_NW(4, __Vtemp_1));
    vlSymsp->_traceDumpOpen();
    vlSelfRef.tb_if_stage__DOT__clk = 0U;
    vlSelfRef.tb_if_stage__DOT__rst = 1U;
    vlSelfRef.tb_if_stage__DOT__branch_taken = 0U;
    vlSelfRef.tb_if_stage__DOT__branch_target = 0U;
    co_await vlSelfRef.__VdlySched.delay(0x4e20ULL, 
                                         nullptr, "tb/tb_if_stage.sv", 
                                         39);
    vlSelfRef.tb_if_stage__DOT__rst = 0U;
    co_await vlSelfRef.__VdlySched.delay(0x9c40ULL, 
                                         nullptr, "tb/tb_if_stage.sv", 
                                         43);
    vlSelfRef.tb_if_stage__DOT__branch_target = 0x40U;
    vlSelfRef.tb_if_stage__DOT__branch_taken = 1U;
    co_await vlSelfRef.__VdlySched.delay(0x2710ULL, 
                                         nullptr, "tb/tb_if_stage.sv", 
                                         50);
    vlSelfRef.tb_if_stage__DOT__branch_taken = 0U;
    co_await vlSelfRef.__VdlySched.delay(0xc350ULL, 
                                         nullptr, "tb/tb_if_stage.sv", 
                                         56);
    VL_FINISH_MT("tb/tb_if_stage.sv", 58, "");
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_if_stage___024root___dump_triggers__act(Vtb_if_stage___024root* vlSelf);
#endif  // VL_DEBUG

void Vtb_if_stage___024root___eval_triggers__act(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___eval_triggers__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered.set(0U, ((IData)(vlSelfRef.tb_if_stage__DOT__clk) 
                                       & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__tb_if_stage__DOT__clk__0))));
    vlSelfRef.__VactTriggered.set(1U, vlSelfRef.__VdlySched.awaitingCurrentTime());
    vlSelfRef.__Vtrigprevexpr___TOP__tb_if_stage__DOT__clk__0 
        = vlSelfRef.tb_if_stage__DOT__clk;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vtb_if_stage___024root___dump_triggers__act(vlSelf);
    }
#endif
}
