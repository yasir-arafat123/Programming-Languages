# PowerShell script to create Python Internals module structure
# Base path
$basePath = "e:\MIU\codes\Python_Programming\Python_Core\B_Advanced\Q.16_Internals"

# Create a basic empty Jupyter notebook template
$notebookTemplate = @'
{
 "cells": [],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "name": "python",
   "version": "3.11.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
'@

# Function to create directory and notebooks
function Create-NotebookStructure {
    param(
        [string]$path,
        [string[]]$notebooks
    )
    
    if (-not (Test-Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
        Write-Output "Created directory: $path"
    }
    
    foreach ($notebook in $notebooks) {
        $notebookPath = Join-Path $path $notebook
        if (-not (Test-Path $notebookPath)) {
            $notebookTemplate | Out-File -FilePath $notebookPath -Encoding utf8
            Write-Output "Created notebook: $notebook"
        }
    }
}

# 01_Object_Model_identity_mutability
$path1 = Join-Path $basePath "01_Object_Model_identity_mutability\01_Basics"
Create-NotebookStructure -path $path1 -notebooks @(
    "1.1_everything_is_an_object_id_identity.ipynb",
    "1.2_mutable_vs_immutable_recap.ipynb",
    "1.3_references_aliasing_intro.ipynb",
    "1.4_object_lifecycle_overview.ipynb"
)

$path2 = Join-Path $basePath "01_Object_Model_identity_mutability\02_Under_the_Hood"
Create-NotebookStructure -path $path2 -notebooks @(
    "2.1_data_model_and_dunder_protocols.ipynb",
    "2.2_attribute_lookup_high_level.ipynb",
    "2.3_hashability_identity_and_mutability.ipynb"
)

$path3 = Join-Path $basePath "01_Object_Model_identity_mutability\03_Pro_Tips"
Create-NotebookStructure -path $path3 -notebooks @(
    "3.1_is_vs_eq_rules_of_thumb.ipynb",
    "3.2_common_identity_pitfalls.ipynb",
    "3.3_perf_notes_for_mutability.ipynb"
)

# 02_Descriptors_Detail
$path4 = Join-Path $basePath "02_Descriptors_Detail\01_Primer"
Create-NotebookStructure -path $path4 -notebooks @(
    "1.1_descriptor_protocol_get_set_delete.ipynb",
    "1.2_data_vs_nondata_descriptors.ipynb",
    "1.3_descriptor_lookup_order.ipynb"
)

$path5 = Join-Path $basePath "02_Descriptors_Detail\02_Builtins_as_Descriptors"
Create-NotebookStructure -path $path5 -notebooks @(
    "2.1_functions_and_bound_methods.ipynb",
    "2.2_property_staticmethod_classmethod.ipynb",
    "2.3_slots_member_descriptor_preview.ipynb"
)

$path6 = Join-Path $basePath "02_Descriptors_Detail\03_Advanced_Uses"
Create-NotebookStructure -path $path6 -notebooks @(
    "3.1_validated_attributes_pattern.ipynb",
    "3.2_cached_attribute_patterns.ipynb",
    "3.3_debugging_descriptors_with_inspect.ipynb"
)

# 03_Method_Resolution_Order
$path7 = Join-Path $basePath "03_Method_Resolution_Order\01_Basics"
Create-NotebookStructure -path $path7 -notebooks @(
    "1.1_mro_and_super_basics.ipynb",
    "1.2_c3_linearization_intuition.ipynb",
    "1.3_diamond_inheritance_walkthrough.ipynb"
)

$path8 = Join-Path $basePath "03_Method_Resolution_Order\02_Design_Patterns"
Create-NotebookStructure -path $path8 -notebooks @(
    "2.1_cooperative_multiple_inheritance.ipynb",
    "2.2_mixins_do_and_dont.ipynb",
    "2.3_debugging_mro_conflicts.ipynb"
)

$path9 = Join-Path $basePath "03_Method_Resolution_Order\03_Pro_Tips"
Create-NotebookStructure -path $path9 -notebooks @(
    "3.1_type_mro_and___mro__.ipynb",
    "3.2_super_edge_cases.ipynb",
    "3.3_when_to_avoid_multiple_inheritance.ipynb"
)

# 04_Name_Mangling_private_convention
$path10 = Join-Path $basePath "04_Name_Mangling_private_convention\01_Basics"
Create-NotebookStructure -path $path10 -notebooks @(
    "1.1_public_protected_private_conventions.ipynb",
    "1.2_double_underscore_mangling_rules.ipynb",
    "1.3_accessing_mangled_names.ipynb"
)

$path11 = Join-Path $basePath "04_Name_Mangling_private_convention\02_Practical_Use_Cases"
Create-NotebookStructure -path $path11 -notebooks @(
    "2.1_avoiding_name_clashes_in_inheritance.ipynb",
    "2.2_testing_and_mocking_mangled_attrs.ipynb",
    "2.3_dataclasses_and_name_mangling_notes.ipynb"
)

$path12 = Join-Path $basePath "04_Name_Mangling_private_convention\03_Pro_Tips"
Create-NotebookStructure -path $path12 -notebooks @(
    "3.1_mangling_is_not_security.ipynb",
    "3.2_double_underscore_gotchas.ipynb",
    "3.3_style_guidance_when_to_use.ipynb"
)

# 05_Slots_Impact
$path13 = Join-Path $basePath "05_Slots_Impact\01_Basics"
Create-NotebookStructure -path $path13 -notebooks @(
    "1.1_what___slots___is.ipynb",
    "1.2_slots_vs___dict___and_memory.ipynb",
    "1.3_slots_and_inheritance_rules.ipynb"
)

$path14 = Join-Path $basePath "05_Slots_Impact\02_Advanced"
Create-NotebookStructure -path $path14 -notebooks @(
    "2.1_slots_with_dataclasses.ipynb",
    "2.2_slots_and_weakref_support.ipynb",
    "2.3_attribute_access_tradeoffs.ipynb"
)

$path15 = Join-Path $basePath "05_Slots_Impact\03_Pro_Tips"
Create-NotebookStructure -path $path15 -notebooks @(
    "3.1_debugging_missing_attrs_with_slots.ipynb",
    "3.2_slots_anti_patterns.ipynb",
    "3.3_migrating_existing_classes_to_slots.ipynb"
)

# 06_String_and_Int_Interning
$path16 = Join-Path $basePath "06_String_and_Int_Interning\01_Basics"
Create-NotebookStructure -path $path16 -notebooks @(
    "1.1_string_interning_concept.ipynb",
    "1.2_sys_intern_usage.ipynb",
    "1.3_is_vs_eq_for_strings.ipynb"
)

$path17 = Join-Path $basePath "06_String_and_Int_Interning\02_Interning_in_Practice"
Create-NotebookStructure -path $path17 -notebooks @(
    "2.1_interning_identifiers_and_dict_keys.ipynb",
    "2.2_small_int_caching_cpython_notes.ipynb",
    "2.3_memory_tradeoffs_intern_tables.ipynb"
)

$path18 = Join-Path $basePath "06_String_and_Int_Interning\03_Pro_Tips"
Create-NotebookStructure -path $path18 -notebooks @(
    "3.1_safe_rules_never_use_is_for_values.ipynb",
    "3.2_measure_perf_before_interning.ipynb",
    "3.3_cross_implementation_behavior_notes.ipynb"
)

# 07_Reference_Counting_GC
$path19 = Join-Path $basePath "07_Reference_Counting_GC\01_Fundamentals"
Create-NotebookStructure -path $path19 -notebooks @(
    "1.1_reference_counting_basics.ipynb",
    "1.2_sys_getrefcount_caveats.ipynb",
    "1.3_cycles_and_gc_intro.ipynb"
)

$path20 = Join-Path $basePath "07_Reference_Counting_GC\02_gc_Module_Tools"
Create-NotebookStructure -path $path20 -notebooks @(
    "2.1_gc_enable_disable_thresholds.ipynb",
    "2.2_gc_debug_flags_and_garbage.ipynb",
    "2.3_weakref_to_break_cycles.ipynb"
)

$path21 = Join-Path $basePath "07_Reference_Counting_GC\03_Pro_Tips"
Create-NotebookStructure -path $path21 -notebooks @(
    "3.1_memory_leak_hunting_workflow.ipynb",
    "3.2_finalizers___del___pitfalls.ipynb",
    "3.3_gc_perf_tuning_guidelines.ipynb"
)

# 08_Bytecode_disassembly
$path22 = Join-Path $basePath "08_Bytecode_disassembly\01_Basics"
Create-NotebookStructure -path $path22 -notebooks @(
    "1.1_what_is_bytecode.ipynb",
    "1.2_dis_module_quickstart.ipynb",
    "1.3_code_objects_co_code_intro.ipynb"
)

$path23 = Join-Path $basePath "08_Bytecode_disassembly\02_Deeper_Dive"
Create-NotebookStructure -path $path23 -notebooks @(
    "2.1_opcode_basics_and_stack_effect.ipynb",
    "2.2_dis_Bytecode_api.ipynb",
    "2.3_line_number_mapping_and_positions.ipynb"
)

$path24 = Join-Path $basePath "08_Bytecode_disassembly\03_Pro_Tips"
Create-NotebookStructure -path $path24 -notebooks @(
    "3.1_using_dis_for_perf_reasoning.ipynb",
    "3.2_bytecode_version_differences.ipynb",
    "3.3_debugging_with_dis_and_profilers.ipynb"
)

# 09_Performance_Implications_of_Internals
$path25 = Join-Path $basePath "09_Performance_Implications_of_Internals\01_Basics"
Create-NotebookStructure -path $path25 -notebooks @(
    "1.1_attribute_lookup_cost_model.ipynb",
    "1.2_dict_hashing_and_interning_effects.ipynb",
    "1.3_allocation_caches_and_overheads.ipynb"
)

$path26 = Join-Path $basePath "09_Performance_Implications_of_Internals\02_Tools_and_Methods"
Create-NotebookStructure -path $path26 -notebooks @(
    "2.1_timeit_microbench_for_internals.ipynb",
    "2.2_sys_getsizeof_and_memory_limits.ipynb",
    "2.3_profile_call_overhead_and_dispatch.ipynb"
)

$path27 = Join-Path $basePath "09_Performance_Implications_of_Internals\03_Pro_Tips"
Create-NotebookStructure -path $path27 -notebooks @(
    "3.1_readability_over_microopts.ipynb",
    "3.2_when_slots_help_when_not.ipynb",
    "3.3_interpreter_specific_optimizations.ipynb"
)

# 10_Implementation_Differences
$path28 = Join-Path $basePath "10_Implementation_Differences\01_Basics"
Create-NotebookStructure -path $path28 -notebooks @(
    "1.1_cpython_what_it_is.ipynb",
    "1.2_pypy_and_jit_overview.ipynb",
    "1.3_jython_ironpython_jvm_dotnet.ipynb",
    "1.4_micropython_constraints.ipynb"
)

$path29 = Join-Path $basePath "10_Implementation_Differences\02_Compatibility_and_Runtime_Detection"
Create-NotebookStructure -path $path29 -notebooks @(
    "2.1_sys_implementation_and_feature_detection.ipynb",
    "2.2_c_extensions_abi_portability.ipynb",
    "2.3_bytecode_cache_tags_and_pyc_notes.ipynb"
)

$path30 = Join-Path $basePath "10_Implementation_Differences\03_Pro_Tips"
Create-NotebookStructure -path $path30 -notebooks @(
    "3.1_writing_portable_python.ipynb",
    "3.2_perf_expectations_across_vms.ipynb",
    "3.3_testing_across_implementations_strategy.ipynb"
)

Write-Output ""
Write-Output "Structure creation complete!"
Write-Output "Total directories created: 30"
Write-Output "Total notebooks created: 92"
