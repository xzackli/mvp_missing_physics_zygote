
The file `missing_physics.jl` is just the pasted first third of the (missing physics)[https://docs.sciml.ai/Overview/stable/showcase/missing_physics/] showcase example. It should run to completion,

```
julia --project=. missing_physics.jl
```

The file `missing_physics_larger.jl` just increases the width of the layers,
```julia
NETWORK_SIZE::Int = 8  # is 5 in the example
U = Lux.Chain(
    Lux.Dense(2, NETWORK_SIZE, rbf), 
    Lux.Dense(NETWORK_SIZE, NETWORK_SIZE, rbf), 
    Lux.Dense(NETWORK_SIZE, NETWORK_SIZE, rbf),
    Lux.Dense(NETWORK_SIZE, 2))
```

You can confirm this by running `diff missing_physics.jl missing_physics_larger.jl `. 

```
julia --project=. missing_physics_larger.jl
```

I get an Enzyme coredump!

```
Warning: Using fallback BLAS replacements, performance may be degraded
└ @ Enzyme.Compiler ~/.julia/packages/GPUCompiler/cy24l/src/utils.jl:56

[1433292] signal (11.1): Segmentation fault
in expression starting at /home/zack/src/mvp_missing_physics_zygote/missing_physics_larger.jl:89
gc_mark_loop at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gc.c:2819
_jl_gc_collect at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gc.c:3400
ijl_gc_collect at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gc.c:3707
maybe_collect at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gc.c:1078 [inlined]
jl_gc_pool_alloc_inner at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gc.c:1443 [inlined]
jl_gc_pool_alloc_noinline at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gc.c:1504 [inlined]
jl_gc_alloc_ at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/julia_internal.h:460 [inlined]
jl_gc_alloc at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gc.c:3754
_new_array_ at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/array.c:134
ijl_array_copy at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/array.c:1181
copy at ./array.jl:365 [inlined]
update_bbstate! at ./compiler/abstractinterpretation.jl:2694 [inlined]
typeinf_local at ./compiler/abstractinterpretation.jl:2910
typeinf_nocycle at ./compiler/abstractinterpretation.jl:2957
_typeinf at ./compiler/typeinfer.jl:246
typeinf at ./compiler/typeinfer.jl:216
abstract_call_method_with_const_args at ./compiler/abstractinterpretation.jl:1008
abstract_call_method_with_const_args at ./compiler/abstractinterpretation.jl:954
abstract_call_gf_by_type at ./compiler/abstractinterpretation.jl:160
abstract_call_known at ./compiler/abstractinterpretation.jl:1949
abstract_call at ./compiler/abstractinterpretation.jl:2020
abstract_call at ./compiler/abstractinterpretation.jl:1999
abstract_eval_statement_expr at ./compiler/abstractinterpretation.jl:2183
abstract_eval_statement at ./compiler/abstractinterpretation.jl:2396
abstract_eval_basic_statement at ./compiler/abstractinterpretation.jl:2684
typeinf_local at ./compiler/abstractinterpretation.jl:2869
typeinf_nocycle at ./compiler/abstractinterpretation.jl:2957
_typeinf at ./compiler/typeinfer.jl:246
typeinf at ./compiler/typeinfer.jl:216
typeinf_edge at ./compiler/typeinfer.jl:933
abstract_call_method at ./compiler/abstractinterpretation.jl:611
abstract_call_gf_by_type at ./compiler/abstractinterpretation.jl:152
abstract_call_known at ./compiler/abstractinterpretation.jl:1949
abstract_call at ./compiler/abstractinterpretation.jl:2020
abstract_call at ./compiler/abstractinterpretation.jl:1999
abstract_eval_statement_expr at ./compiler/abstractinterpretation.jl:2183
abstract_eval_statement at ./compiler/abstractinterpretation.jl:2396
abstract_eval_basic_statement at ./compiler/abstractinterpretation.jl:2660
typeinf_local at ./compiler/abstractinterpretation.jl:2869
typeinf_nocycle at ./compiler/abstractinterpretation.jl:2957
_typeinf at ./compiler/typeinfer.jl:246
typeinf at ./compiler/typeinfer.jl:216
typeinf_edge at ./compiler/typeinfer.jl:933
abstract_call_method at ./compiler/abstractinterpretation.jl:611
abstract_call_gf_by_type at ./compiler/abstractinterpretation.jl:152
abstract_call_known at ./compiler/abstractinterpretation.jl:1949
abstract_call at ./compiler/abstractinterpretation.jl:2020
abstract_call at ./compiler/abstractinterpretation.jl:1999
abstract_eval_statement_expr at ./compiler/abstractinterpretation.jl:2183
abstract_eval_statement at ./compiler/abstractinterpretation.jl:2396
abstract_eval_basic_statement at ./compiler/abstractinterpretation.jl:2660
typeinf_local at ./compiler/abstractinterpretation.jl:2869
typeinf_nocycle at ./compiler/abstractinterpretation.jl:2957
_typeinf at ./compiler/typeinfer.jl:246
typeinf at ./compiler/typeinfer.jl:216
typeinf_edge at ./compiler/typeinfer.jl:933
abstract_call_method at ./compiler/abstractinterpretation.jl:611
abstract_call_gf_by_type at ./compiler/abstractinterpretation.jl:152
abstract_call_known at ./compiler/abstractinterpretation.jl:1949
abstract_call at ./compiler/abstractinterpretation.jl:2020
abstract_call at ./compiler/abstractinterpretation.jl:1999
abstract_eval_statement_expr at ./compiler/abstractinterpretation.jl:2183
abstract_eval_statement at ./compiler/abstractinterpretation.jl:2396
abstract_eval_basic_statement at ./compiler/abstractinterpretation.jl:2660
typeinf_local at ./compiler/abstractinterpretation.jl:2869
typeinf_nocycle at ./compiler/abstractinterpretation.jl:2957
_typeinf at ./compiler/typeinfer.jl:246
typeinf at ./compiler/typeinfer.jl:216
typeinf_edge at ./compiler/typeinfer.jl:933
abstract_call_method at ./compiler/abstractinterpretation.jl:611
abstract_call_gf_by_type at ./compiler/abstractinterpretation.jl:152
abstract_call_known at ./compiler/abstractinterpretation.jl:1949
abstract_call at ./compiler/abstractinterpretation.jl:2020
abstract_apply at ./compiler/abstractinterpretation.jl:1566
abstract_call_known at ./compiler/abstractinterpretation.jl:1855
abstract_call at ./compiler/abstractinterpretation.jl:2020
abstract_call at ./compiler/abstractinterpretation.jl:1999
abstract_eval_statement_expr at ./compiler/abstractinterpretation.jl:2183
abstract_eval_statement at ./compiler/abstractinterpretation.jl:2396
abstract_eval_basic_statement at ./compiler/abstractinterpretation.jl:2684
typeinf_local at ./compiler/abstractinterpretation.jl:2869
typeinf_nocycle at ./compiler/abstractinterpretation.jl:2957
_typeinf at ./compiler/typeinfer.jl:246
typeinf at ./compiler/typeinfer.jl:216
typeinf_edge at ./compiler/typeinfer.jl:933
abstract_call_method at ./compiler/abstractinterpretation.jl:611
abstract_call_gf_by_type at ./compiler/abstractinterpretation.jl:152
abstract_call_known at ./compiler/abstractinterpretation.jl:1949
abstract_call at ./compiler/abstractinterpretation.jl:2020
abstract_apply at ./compiler/abstractinterpretation.jl:1566
abstract_call_known at ./compiler/abstractinterpretation.jl:1855
abstract_call at ./compiler/abstractinterpretation.jl:2020
abstract_call at ./compiler/abstractinterpretation.jl:1999
abstract_eval_statement_expr at ./compiler/abstractinterpretation.jl:2183
abstract_eval_statement at ./compiler/abstractinterpretation.jl:2396
abstract_eval_basic_statement at ./compiler/abstractinterpretation.jl:2684
typeinf_local at ./compiler/abstractinterpretation.jl:2869
typeinf_nocycle at ./compiler/abstractinterpretation.jl:2957
_typeinf at ./compiler/typeinfer.jl:246
typeinf at ./compiler/typeinfer.jl:216
typeinf_edge at ./compiler/typeinfer.jl:933
abstract_call_method at ./compiler/abstractinterpretation.jl:611
abstract_call_gf_by_type at ./compiler/abstractinterpretation.jl:152
abstract_call_known at ./compiler/abstractinterpretation.jl:1949
abstract_call at ./compiler/abstractinterpretation.jl:2020
abstract_apply at ./compiler/abstractinterpretation.jl:1566
abstract_call_known at ./compiler/abstractinterpretation.jl:1855
abstract_call at ./compiler/abstractinterpretation.jl:2020
abstract_call at ./compiler/abstractinterpretation.jl:1999
abstract_eval_statement_expr at ./compiler/abstractinterpretation.jl:2183
abstract_eval_statement at ./compiler/abstractinterpretation.jl:2396
abstract_eval_basic_statement at ./compiler/abstractinterpretation.jl:2684
typeinf_local at ./compiler/abstractinterpretation.jl:2869
typeinf_nocycle at ./compiler/abstractinterpretation.jl:2957
_typeinf at ./compiler/typeinfer.jl:246
typeinf at ./compiler/typeinfer.jl:216
typeinf_edge at ./compiler/typeinfer.jl:933
abstract_call_method at ./compiler/abstractinterpretation.jl:611
abstract_call_gf_by_type at ./compiler/abstractinterpretation.jl:152
abstract_call_known at ./compiler/abstractinterpretation.jl:1949
abstract_call at ./compiler/abstractinterpretation.jl:2020
abstract_apply at ./compiler/abstractinterpretation.jl:1566
abstract_call_known at ./compiler/abstractinterpretation.jl:1855
abstract_call at ./compiler/abstractinterpretation.jl:2020
abstract_call at ./compiler/abstractinterpretation.jl:1999
abstract_eval_statement_expr at ./compiler/abstractinterpretation.jl:2183
abstract_eval_statement at ./compiler/abstractinterpretation.jl:2396
abstract_eval_basic_statement at ./compiler/abstractinterpretation.jl:2684
typeinf_local at ./compiler/abstractinterpretation.jl:2869
typeinf_nocycle at ./compiler/abstractinterpretation.jl:2957
_typeinf at ./compiler/typeinfer.jl:246
typeinf at ./compiler/typeinfer.jl:216
typeinf_ext at ./compiler/typeinfer.jl:1058
typeinf_ext_toplevel at ./compiler/typeinfer.jl:1091
typeinf_ext_toplevel at ./compiler/typeinfer.jl:1087
jfptr_typeinf_ext_toplevel_14294.clone_1 at /home/zack/.julia/juliaup/julia-1.9.0+0.x64.linux.gnu/lib/julia/sys.so (unknown line)
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
jl_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/julia.h:1879 [inlined]
jl_type_infer at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:320
jl_generate_fptr_impl at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/jitlayers.cpp:444
jl_compile_method_internal at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2348 [inlined]
jl_compile_method_internal at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2237
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2750 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
jl_nthfield_fwd at /home/zack/.julia/packages/Enzyme/EncRR/src/compiler.jl:2322
jl_nthfield_augfwd at /home/zack/.julia/packages/Enzyme/EncRR/src/compiler.jl:2357
unknown function (ip: 0x7fd8b31b939b)
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
unknown function (ip: 0x7fd9b13b7115)
unknown function (ip: 0x7fd9b13b6f05)
operator() at /workspace/srcdir/Enzyme/enzyme/Enzyme/CApi.cpp:267 [inlined]
_M_invoke at /opt/x86_64-linux-gnu/x86_64-linux-gnu/include/c++/8.1.0/bits/std_function.h:297
operator() at /opt/x86_64-linux-gnu/x86_64-linux-gnu/include/c++/8.1.0/bits/std_function.h:687 [inlined]
visitCallInst at /workspace/srcdir/Enzyme/enzyme/Enzyme/AdjointGenerator.h:10314
delegateCallInst at /opt/x86_64-linux-gnu/x86_64-linux-gnu/sys-root/usr/local/include/llvm/IR/InstVisitor.h:302 [inlined]
visitCall at /opt/x86_64-linux-gnu/x86_64-linux-gnu/sys-root/usr/local/include/llvm/IR/Instruction.def:209 [inlined]
visit at /opt/x86_64-linux-gnu/x86_64-linux-gnu/sys-root/usr/local/include/llvm/IR/Instruction.def:209
visit at /opt/x86_64-linux-gnu/x86_64-linux-gnu/sys-root/usr/local/include/llvm/IR/InstVisitor.h:112 [inlined]
CreateAugmentedPrimal at /workspace/srcdir/Enzyme/enzyme/Enzyme/EnzymeLogic.cpp:2237
EnzymeCreateAugmentedPrimal at /workspace/srcdir/Enzyme/enzyme/Enzyme/CApi.cpp:506
EnzymeCreateAugmentedPrimal at /home/zack/.julia/packages/Enzyme/EncRR/src/api.jl:160
enzyme! at /home/zack/.julia/packages/Enzyme/EncRR/src/compiler.jl:6640
unknown function (ip: 0x7fd8b31b35b9)
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
#codegen#146 at /home/zack/.julia/packages/Enzyme/EncRR/src/compiler.jl:7921
codegen at /home/zack/.julia/packages/Enzyme/EncRR/src/compiler.jl:7547 [inlined]
_thunk at /home/zack/.julia/packages/Enzyme/EncRR/src/compiler.jl:8434
_thunk at /home/zack/.julia/packages/Enzyme/EncRR/src/compiler.jl:8431 [inlined]
cached_compilation at /home/zack/.julia/packages/Enzyme/EncRR/src/compiler.jl:8469 [inlined]
#s286#175 at /home/zack/.julia/packages/Enzyme/EncRR/src/compiler.jl:8527 [inlined]
#s286#175 at ./none:0
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
GeneratedFunctionStub at ./boot.jl:602
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
jl_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/julia.h:1879 [inlined]
jl_call_staged at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/method.c:530
ijl_code_for_staged at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/method.c:581
get_staged at ./compiler/utilities.jl:115
retrieve_code_info at ./compiler/utilities.jl:127 [inlined]
InferenceState at ./compiler/inferencestate.jl:354
typeinf_edge at ./compiler/typeinfer.jl:924
abstract_call_method at ./compiler/abstractinterpretation.jl:611
abstract_call_gf_by_type at ./compiler/abstractinterpretation.jl:152
abstract_call_known at ./compiler/abstractinterpretation.jl:1949
abstract_call at ./compiler/abstractinterpretation.jl:2020
abstract_call at ./compiler/abstractinterpretation.jl:1999
abstract_eval_statement_expr at ./compiler/abstractinterpretation.jl:2183
abstract_eval_statement at ./compiler/abstractinterpretation.jl:2396
abstract_eval_basic_statement at ./compiler/abstractinterpretation.jl:2684
typeinf_local at ./compiler/abstractinterpretation.jl:2869
typeinf_nocycle at ./compiler/abstractinterpretation.jl:2957
_typeinf at ./compiler/typeinfer.jl:246
typeinf at ./compiler/typeinfer.jl:216
typeinf_edge at ./compiler/typeinfer.jl:933
abstract_call_method at ./compiler/abstractinterpretation.jl:611
abstract_call_gf_by_type at ./compiler/abstractinterpretation.jl:152
abstract_call_known at ./compiler/abstractinterpretation.jl:1949
abstract_call at ./compiler/abstractinterpretation.jl:2020
abstract_call at ./compiler/abstractinterpretation.jl:1999
abstract_eval_statement_expr at ./compiler/abstractinterpretation.jl:2183
abstract_eval_statement at ./compiler/abstractinterpretation.jl:2396
abstract_eval_basic_statement at ./compiler/abstractinterpretation.jl:2684
typeinf_local at ./compiler/abstractinterpretation.jl:2869
typeinf_nocycle at ./compiler/abstractinterpretation.jl:2957
_typeinf at ./compiler/typeinfer.jl:246
typeinf at ./compiler/typeinfer.jl:216
typeinf_ext at ./compiler/typeinfer.jl:1058
typeinf_ext_toplevel at ./compiler/typeinfer.jl:1091
typeinf_ext_toplevel at ./compiler/typeinfer.jl:1087
jfptr_typeinf_ext_toplevel_14294.clone_1 at /home/zack/.julia/juliaup/julia-1.9.0+0.x64.linux.gnu/lib/julia/sys.so (unknown line)
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
jl_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/julia.h:1879 [inlined]
jl_type_infer at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:320
jl_generate_fptr_impl at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/jitlayers.cpp:444
jl_compile_method_internal at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2348 [inlined]
jl_compile_method_internal at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2237
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2750 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
unknown function (ip: 0x7fd9d101b6df)
macro expansion at /home/zack/.julia/packages/Enzyme/EncRR/src/compiler.jl:8383 [inlined]
enzyme_call at /home/zack/.julia/packages/Enzyme/EncRR/src/compiler.jl:8082 [inlined]
AugmentedForwardThunk at /home/zack/.julia/packages/Enzyme/EncRR/src/compiler.jl:8056 [inlined]
runtime_generic_augfwd at /home/zack/.julia/packages/Enzyme/EncRR/src/compiler.jl:1127
unknown function (ip: 0x7fd8b3154148)
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
unknown function (ip: 0x7fd9d1bd73de)
unknown function (ip: 0x7fd9d1bd7589)
unknown function (ip: 0x7fd8b312cdaa)
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
jl_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/julia.h:1879 [inlined]
do_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/builtins.c:730
CombinedAdjointThunk at /home/zack/.julia/packages/Enzyme/EncRR/src/compiler.jl:8045
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
jl_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/julia.h:1879 [inlined]
do_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/builtins.c:730
autodiff at /home/zack/.julia/packages/Enzyme/EncRR/src/Enzyme.jl:205
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
jl_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/julia.h:1879 [inlined]
do_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/builtins.c:730
autodiff at /home/zack/.julia/packages/Enzyme/EncRR/src/Enzyme.jl:228
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
autodiff at /home/zack/.julia/packages/Enzyme/EncRR/src/Enzyme.jl:214 [inlined]
inplace_vjp at /home/zack/.julia/packages/SciMLSensitivity/2kCYE/src/concrete_solve.jl:16
automatic_sensealg_choice at /home/zack/.julia/packages/SciMLSensitivity/2kCYE/src/concrete_solve.jl:159
#_concrete_solve_adjoint#267 at /home/zack/.julia/packages/SciMLSensitivity/2kCYE/src/concrete_solve.jl:206
_concrete_solve_adjoint at /home/zack/.julia/packages/SciMLSensitivity/2kCYE/src/concrete_solve.jl:195 [inlined]
#_solve_adjoint#54 at /home/zack/.julia/packages/DiffEqBase/HoOGI/src/solve.jl:1388 [inlined]
_solve_adjoint at /home/zack/.julia/packages/DiffEqBase/HoOGI/src/solve.jl:1357 [inlined]
#rrule#52 at /home/zack/.julia/packages/DiffEqBase/HoOGI/src/solve.jl:1341 [inlined]
rrule at /home/zack/.julia/packages/DiffEqBase/HoOGI/src/solve.jl:1337 [inlined]
rrule at /home/zack/.julia/packages/ChainRulesCore/0t04l/src/rules.jl:140 [inlined]
chain_rrule_kw at /home/zack/.julia/packages/Zygote/JeHtr/src/compiler/chainrules.jl:235 [inlined]
macro expansion at /home/zack/.julia/packages/Zygote/JeHtr/src/compiler/interface2.jl:101 [inlined]
_pullback at /home/zack/.julia/packages/Zygote/JeHtr/src/compiler/interface2.jl:101 [inlined]
_apply at ./boot.jl:838 [inlined]
adjoint at /home/zack/.julia/packages/Zygote/JeHtr/src/lib/lib.jl:203 [inlined]
_pullback at /home/zack/.julia/packages/ZygoteRules/OgCVT/src/adjoint.jl:66 [inlined]
_pullback at /home/zack/.julia/packages/DiffEqBase/HoOGI/src/solve.jl:882 [inlined]
_pullback at /home/zack/.julia/packages/Zygote/JeHtr/src/compiler/interface2.jl:0
unknown function (ip: 0x7fd8c39e6472)
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
jl_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/julia.h:1879 [inlined]
do_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/builtins.c:730
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
jl_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/julia.h:1879 [inlined]
do_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/builtins.c:730
_apply at ./boot.jl:838
adjoint at /home/zack/.julia/packages/Zygote/JeHtr/src/lib/lib.jl:203 [inlined]
_pullback at /home/zack/.julia/packages/ZygoteRules/OgCVT/src/adjoint.jl:66 [inlined]
_pullback at /home/zack/.julia/packages/DiffEqBase/HoOGI/src/solve.jl:872 [inlined]
_pullback at /home/zack/.julia/packages/Zygote/JeHtr/src/compiler/interface2.jl:0
unknown function (ip: 0x7fd8c39dddc2)
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
_pullback at /home/zack/src/mvp_missing_physics_zygote/missing_physics_larger.jl:66 [inlined]
_pullback at /home/zack/.julia/packages/Zygote/JeHtr/src/compiler/interface2.jl:0
unknown function (ip: 0x7fd8c398ee22)
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
_pullback at /home/zack/src/mvp_missing_physics_zygote/missing_physics_larger.jl:65 [inlined]
_pullback at /home/zack/.julia/packages/Zygote/JeHtr/src/compiler/interface2.jl:0
_pullback at /home/zack/src/mvp_missing_physics_zygote/missing_physics_larger.jl:71 [inlined]
_pullback at /home/zack/.julia/packages/Zygote/JeHtr/src/compiler/interface2.jl:0
_pullback at /home/zack/src/mvp_missing_physics_zygote/missing_physics_larger.jl:86 [inlined]
_pullback at /home/zack/.julia/packages/Zygote/JeHtr/src/compiler/interface2.jl:0
_apply at ./boot.jl:838 [inlined]
adjoint at /home/zack/.julia/packages/Zygote/JeHtr/src/lib/lib.jl:203 [inlined]
_pullback at /home/zack/.julia/packages/ZygoteRules/OgCVT/src/adjoint.jl:66 [inlined]
_pullback at /home/zack/.julia/packages/SciMLBase/0XOAI/src/scimlfunctions.jl:3626 [inlined]
_pullback at /home/zack/.julia/packages/Zygote/JeHtr/src/compiler/interface2.jl:0
unknown function (ip: 0x7fd8c398a0f6)
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
jl_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/julia.h:1879 [inlined]
do_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/builtins.c:730
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
jl_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/julia.h:1879 [inlined]
do_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/builtins.c:730
_apply at ./boot.jl:838
adjoint at /home/zack/.julia/packages/Zygote/JeHtr/src/lib/lib.jl:203 [inlined]
_pullback at /home/zack/.julia/packages/ZygoteRules/OgCVT/src/adjoint.jl:66 [inlined]
_pullback at /home/zack/.julia/packages/Optimization/q952d/ext/OptimizationZygoteExt.jl:13 [inlined]
_pullback at /home/zack/.julia/packages/Zygote/JeHtr/src/compiler/interface2.jl:0
unknown function (ip: 0x7fd8c3983726)
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
jl_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/julia.h:1879 [inlined]
do_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/builtins.c:730
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
jl_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/julia.h:1879 [inlined]
do_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/builtins.c:730
_apply at ./boot.jl:838
adjoint at /home/zack/.julia/packages/Zygote/JeHtr/src/lib/lib.jl:203 [inlined]
_pullback at /home/zack/.julia/packages/ZygoteRules/OgCVT/src/adjoint.jl:66 [inlined]
_pullback at /home/zack/.julia/packages/Optimization/q952d/ext/OptimizationZygoteExt.jl:17 [inlined]
_pullback at /home/zack/.julia/packages/Zygote/JeHtr/src/compiler/interface2.jl:0
unknown function (ip: 0x7fd8c3980876)
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
pullback at /home/zack/.julia/packages/Zygote/JeHtr/src/compiler/interface.jl:44
pullback at /home/zack/.julia/packages/Zygote/JeHtr/src/compiler/interface.jl:42 [inlined]
gradient at /home/zack/.julia/packages/Zygote/JeHtr/src/compiler/interface.jl:96
#2 at /home/zack/.julia/packages/Optimization/q952d/ext/OptimizationZygoteExt.jl:15
unknown function (ip: 0x7fd8c39804a6)
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
jl_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/julia.h:1879 [inlined]
do_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/builtins.c:730
macro expansion at /home/zack/.julia/packages/OptimizationOptimisers/FWIuf/src/OptimizationOptimisers.jl:31 [inlined]
macro expansion at /home/zack/.julia/packages/Optimization/q952d/src/utils.jl:37 [inlined]
#__solve#1 at /home/zack/.julia/packages/OptimizationOptimisers/FWIuf/src/OptimizationOptimisers.jl:30
__solve at /home/zack/.julia/packages/OptimizationOptimisers/FWIuf/src/OptimizationOptimisers.jl:7 [inlined]
__solve at /home/zack/.julia/packages/OptimizationOptimisers/FWIuf/src/OptimizationOptimisers.jl:7 [inlined]
#solve#553 at /home/zack/.julia/packages/SciMLBase/0XOAI/src/solve.jl:86 [inlined]
solve at /home/zack/.julia/packages/SciMLBase/0XOAI/src/solve.jl:80
unknown function (ip: 0x7fd8c393f56d)
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
jl_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/julia.h:1879 [inlined]
do_call at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/interpreter.c:126
eval_value at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/interpreter.c:226
eval_stmt_value at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/interpreter.c:177 [inlined]
eval_body at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/interpreter.c:624
jl_interpret_toplevel_thunk at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/interpreter.c:762
jl_toplevel_eval_flex at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/toplevel.c:912
jl_toplevel_eval_flex at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/toplevel.c:856
ijl_toplevel_eval_in at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/toplevel.c:971
eval at ./boot.jl:370 [inlined]
include_string at ./loading.jl:1864
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
_include at ./loading.jl:1924
include at ./Base.jl:457
jfptr_include_43521.clone_1 at /home/zack/.julia/juliaup/julia-1.9.0+0.x64.linux.gnu/lib/julia/sys.so (unknown line)
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
exec_options at ./client.jl:307
_start at ./client.jl:522
jfptr__start_37386.clone_1 at /home/zack/.julia/juliaup/julia-1.9.0+0.x64.linux.gnu/lib/julia/sys.so (unknown line)
_jl_invoke at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2758 [inlined]
ijl_apply_generic at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gf.c:2940
jl_apply at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/julia.h:1879 [inlined]
true_main at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/jlapi.c:573
jl_repl_entrypoint at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/jlapi.c:717
main at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/cli/loader_exe.c:59
unknown function (ip: 0x7fd9d2429d8f)
__libc_start_main at /lib/x86_64-linux-gnu/libc.so.6 (unknown line)
unknown function (ip: 0x401098)
Allocations: 280217385 (Pool: 280138940; Big: 78445); GC: 391
Segmentation fault (core dumped)
zack@hubble:~/src/mvp_missing_physics_zygote$ julia --project=. missing_physics_larger.jl┌ Warning: Using fallback BLAS replacements, performance may be degraded
└ @ Enzyme.Compiler ~/.julia/packages/GPUCompiler/cy24l/src/utils.jl:56

[1433292] signal (11.1): Segmentation fault
in expression starting at /home/zack/src/mvp_missing_physics_zygote/missing_physics_larger.jl:89
gc_mark_loop at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gc.c:2819
_jl_gc_collect at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gc.c:3400
ijl_gc_collect at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gc.c:3707
maybe_collect at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gc.c:1078 [inlined]
jl_gc_pool_alloc_inner at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gc.c:1443 [inlined]
jl_gc_pool_alloc_noinline at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gc.c:1504 [inlined]
jl_gc_alloc_ at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/julia_internal.h:460 [inlined]
jl_gc_alloc at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/gc.c:3754
_new_array_ at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/array.c:134
ijl_array_copy at /cache/build/default-amdci4-0/julialang/julia-release-1-dot-9/src/array.c:1181
copy at ./array.jl:365 [inlined]
update_bbstate! at ./compiler/abstractinterpretation.jl:2694 [inlined]
typeinf_local at ./compiler/abstractinterpretation.jl:2910
typeinf_nocycle at ./compiler/abstractinterpretation.jl:2957
_typeinf at ./compiler/typeinfer.jl:246
typeinf at ./compiler/typeinfer.jl:216
abstract_call_method_with_const_args at ./compiler/abstractinterpretation.jl:1008
```

