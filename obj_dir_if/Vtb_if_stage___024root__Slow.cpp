// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_if_stage.h for the primary calling header

#include "Vtb_if_stage__pch.h"
#include "Vtb_if_stage__Syms.h"
#include "Vtb_if_stage___024root.h"

void Vtb_if_stage___024root___ctor_var_reset(Vtb_if_stage___024root* vlSelf);

Vtb_if_stage___024root::Vtb_if_stage___024root(Vtb_if_stage__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , __VdlySched{*symsp->_vm_contextp__}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vtb_if_stage___024root___ctor_var_reset(this);
}

void Vtb_if_stage___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vtb_if_stage___024root::~Vtb_if_stage___024root() {
}
