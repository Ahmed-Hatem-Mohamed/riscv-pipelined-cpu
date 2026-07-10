// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_if_stage.h for the primary calling header

#include "Vtb_if_stage__pch.h"
#include "Vtb_if_stage___024root.h"

VL_ATTR_COLD void Vtb_if_stage___024root___eval_initial__TOP(Vtb_if_stage___024root* vlSelf);
VlCoroutine Vtb_if_stage___024root___eval_initial__TOP__Vtiming__0(Vtb_if_stage___024root* vlSelf);
VlCoroutine Vtb_if_stage___024root___eval_initial__TOP__Vtiming__1(Vtb_if_stage___024root* vlSelf);

void Vtb_if_stage___024root___eval_initial(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___eval_initial\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vtb_if_stage___024root___eval_initial__TOP(vlSelf);
    Vtb_if_stage___024root___eval_initial__TOP__Vtiming__0(vlSelf);
    Vtb_if_stage___024root___eval_initial__TOP__Vtiming__1(vlSelf);
    vlSelfRef.__Vtrigprevexpr___TOP__tb_if_stage__DOT__clk__0 
        = vlSelfRef.tb_if_stage__DOT__clk;
}

VL_INLINE_OPT VlCoroutine Vtb_if_stage___024root___eval_initial__TOP__Vtiming__1(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___eval_initial__TOP__Vtiming__1\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    while (1U) {
        co_await vlSelfRef.__VdlySched.delay(0x1388ULL, 
                                             nullptr, 
                                             "tb/tb_if_stage.sv", 
                                             24);
        vlSelfRef.tb_if_stage__DOT__clk = (1U & (~ (IData)(vlSelfRef.tb_if_stage__DOT__clk)));
    }
}

void Vtb_if_stage___024root___act_sequent__TOP__0(Vtb_if_stage___024root* vlSelf);

void Vtb_if_stage___024root___eval_act(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___eval_act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((2ULL & vlSelfRef.__VactTriggered.word(0U))) {
        Vtb_if_stage___024root___act_sequent__TOP__0(vlSelf);
    }
}

VL_INLINE_OPT void Vtb_if_stage___024root___act_sequent__TOP__0(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___act_sequent__TOP__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.tb_if_stage__DOT__DUT__DOT__IF_UNIT__DOT__next_pc 
        = ((IData)(vlSelfRef.tb_if_stage__DOT__branch_taken)
            ? vlSelfRef.tb_if_stage__DOT__branch_target
            : ((IData)(4U) + vlSelfRef.tb_if_stage__DOT__DUT__DOT__pc_wire));
}

void Vtb_if_stage___024root___nba_sequent__TOP__0(Vtb_if_stage___024root* vlSelf);

void Vtb_if_stage___024root___eval_nba(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___eval_nba\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vtb_if_stage___024root___nba_sequent__TOP__0(vlSelf);
    }
    if ((3ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vtb_if_stage___024root___act_sequent__TOP__0(vlSelf);
    }
}

VL_INLINE_OPT void Vtb_if_stage___024root___nba_sequent__TOP__0(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___nba_sequent__TOP__0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.tb_if_stage__DOT__DUT__DOT__pc_wire = 
        ((IData)(vlSelfRef.tb_if_stage__DOT__rst) ? 0U
          : vlSelfRef.tb_if_stage__DOT__DUT__DOT__IF_UNIT__DOT__next_pc);
}

void Vtb_if_stage___024root___timing_resume(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___timing_resume\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((2ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VdlySched.resume();
    }
}

void Vtb_if_stage___024root___eval_triggers__act(Vtb_if_stage___024root* vlSelf);

bool Vtb_if_stage___024root___eval_phase__act(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___eval_phase__act\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<2> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vtb_if_stage___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        Vtb_if_stage___024root___timing_resume(vlSelf);
        Vtb_if_stage___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vtb_if_stage___024root___eval_phase__nba(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___eval_phase__nba\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vtb_if_stage___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_if_stage___024root___dump_triggers__nba(Vtb_if_stage___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_if_stage___024root___dump_triggers__act(Vtb_if_stage___024root* vlSelf);
#endif  // VL_DEBUG

void Vtb_if_stage___024root___eval(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___eval\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            Vtb_if_stage___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("tb/tb_if_stage.sv", 3, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelfRef.__VactIterCount))) {
#ifdef VL_DEBUG
                Vtb_if_stage___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("tb/tb_if_stage.sv", 3, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (Vtb_if_stage___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (Vtb_if_stage___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vtb_if_stage___024root___eval_debug_assertions(Vtb_if_stage___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root___eval_debug_assertions\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
