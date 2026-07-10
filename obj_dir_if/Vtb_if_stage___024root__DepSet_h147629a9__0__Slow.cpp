// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_if_stage.h for the primary calling header

#include "Vtb_if_stage__pch.h"
#include "Vtb_if_stage___024root.h"

VL_ATTR_COLD void Vtb_if_stage___024root___eval_static(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___eval_static\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vtb_if_stage___024root___eval_initial__TOP(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___eval_initial__TOP\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlWide<3>/*95:0*/ __Vtemp_1;
    // Body
    __Vtemp_1[0U] = 0x2e686578U;
    __Vtemp_1[1U] = 0x6772616dU;
    __Vtemp_1[2U] = 0x70726fU;
    VL_READMEM_N(true, 32, 1024, 0, VL_CVT_PACK_STR_NW(3, __Vtemp_1)
                 ,  &(vlSelfRef.tb_if_stage__DOT__DUT__DOT__IMEM_UNIT__DOT__imem)
                 , 0, ~0ULL);
}

VL_ATTR_COLD void Vtb_if_stage___024root___eval_final(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___eval_final\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_if_stage___024root___dump_triggers__stl(Vtb_if_stage___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vtb_if_stage___024root___eval_phase__stl(Vtb_if_stage___024root* vlSelf);

VL_ATTR_COLD void Vtb_if_stage___024root___eval_settle(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___eval_settle\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VstlIterCount;
    CData/*0:0*/ __VstlContinue;
    // Body
    __VstlIterCount = 0U;
    vlSelfRef.__VstlFirstIteration = 1U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        if (VL_UNLIKELY((0x64U < __VstlIterCount))) {
#ifdef VL_DEBUG
            Vtb_if_stage___024root___dump_triggers__stl(vlSelf);
#endif
            VL_FATAL_MT("tb/tb_if_stage.sv", 3, "", "Settle region did not converge.");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        __VstlContinue = 0U;
        if (Vtb_if_stage___024root___eval_phase__stl(vlSelf)) {
            __VstlContinue = 1U;
        }
        vlSelfRef.__VstlFirstIteration = 0U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_if_stage___024root___dump_triggers__stl(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___dump_triggers__stl\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VstlTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VstlTriggered.word(0U))) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

void Vtb_if_stage___024root___act_sequent__TOP__0(Vtb_if_stage___024root* vlSelf);

VL_ATTR_COLD void Vtb_if_stage___024root___eval_stl(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___eval_stl\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VstlTriggered.word(0U))) {
        Vtb_if_stage___024root___act_sequent__TOP__0(vlSelf);
    }
}

VL_ATTR_COLD void Vtb_if_stage___024root___eval_triggers__stl(Vtb_if_stage___024root* vlSelf);

VL_ATTR_COLD bool Vtb_if_stage___024root___eval_phase__stl(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___eval_phase__stl\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VstlExecute;
    // Body
    Vtb_if_stage___024root___eval_triggers__stl(vlSelf);
    __VstlExecute = vlSelfRef.__VstlTriggered.any();
    if (__VstlExecute) {
        Vtb_if_stage___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_if_stage___024root___dump_triggers__act(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___dump_triggers__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VactTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge tb_if_stage.clk)\n");
    }
    if ((2ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 1 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_if_stage___024root___dump_triggers__nba(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___dump_triggers__nba\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VnbaTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge tb_if_stage.clk)\n");
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 1 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vtb_if_stage___024root___ctor_var_reset(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___ctor_var_reset\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelf->tb_if_stage__DOT__clk = VL_RAND_RESET_I(1);
    vlSelf->tb_if_stage__DOT__rst = VL_RAND_RESET_I(1);
    vlSelf->tb_if_stage__DOT__branch_target = VL_RAND_RESET_I(32);
    vlSelf->tb_if_stage__DOT__branch_taken = VL_RAND_RESET_I(1);
    vlSelf->tb_if_stage__DOT__DUT__DOT__pc_wire = VL_RAND_RESET_I(32);
    vlSelf->tb_if_stage__DOT__DUT__DOT__IF_UNIT__DOT__next_pc = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 1024; ++__Vi0) {
        vlSelf->tb_if_stage__DOT__DUT__DOT__IMEM_UNIT__DOT__imem[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->__Vtrigprevexpr___TOP__tb_if_stage__DOT__clk__0 = VL_RAND_RESET_I(1);
}
