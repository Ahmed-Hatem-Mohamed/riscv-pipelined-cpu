// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vtb_if_stage__Syms.h"


void Vtb_if_stage___024root__trace_chg_0_sub_0(Vtb_if_stage___024root* vlSelf, VerilatedVcd::Buffer* bufp);

void Vtb_if_stage___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root__trace_chg_0\n"); );
    // Init
    Vtb_if_stage___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtb_if_stage___024root*>(voidSelf);
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    Vtb_if_stage___024root__trace_chg_0_sub_0((&vlSymsp->TOP), bufp);
}

void Vtb_if_stage___024root__trace_chg_0_sub_0(Vtb_if_stage___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    (void)vlSelf;  // Prevent unused variable warning
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root__trace_chg_0_sub_0\n"); );
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    // Body
    bufp->chgBit(oldp+0,(vlSelfRef.tb_if_stage__DOT__clk));
    bufp->chgBit(oldp+1,(vlSelfRef.tb_if_stage__DOT__rst));
    bufp->chgIData(oldp+2,(vlSelfRef.tb_if_stage__DOT__branch_target),32);
    bufp->chgBit(oldp+3,(vlSelfRef.tb_if_stage__DOT__branch_taken));
    bufp->chgIData(oldp+4,(((IData)(4U) + vlSelfRef.tb_if_stage__DOT__DUT__DOT__pc_wire)),32);
    bufp->chgIData(oldp+5,(vlSelfRef.tb_if_stage__DOT__DUT__DOT__IMEM_UNIT__DOT__imem
                           [(0x3ffU & (vlSelfRef.tb_if_stage__DOT__DUT__DOT__pc_wire 
                                       >> 2U))]),32);
    bufp->chgIData(oldp+6,(vlSelfRef.tb_if_stage__DOT__DUT__DOT__pc_wire),32);
    bufp->chgIData(oldp+7,(((IData)(vlSelfRef.tb_if_stage__DOT__branch_taken)
                             ? vlSelfRef.tb_if_stage__DOT__branch_target
                             : ((IData)(4U) + vlSelfRef.tb_if_stage__DOT__DUT__DOT__pc_wire))),32);
}

void Vtb_if_stage___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_if_stage___024root__trace_cleanup\n"); );
    // Init
    Vtb_if_stage___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtb_if_stage___024root*>(voidSelf);
    Vtb_if_stage__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VlUnpacked<CData/*0:0*/, 1> __Vm_traceActivity;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        __Vm_traceActivity[__Vi0] = 0;
    }
    // Body
    vlSymsp->__Vm_activity = false;
    __Vm_traceActivity[0U] = 0U;
}
