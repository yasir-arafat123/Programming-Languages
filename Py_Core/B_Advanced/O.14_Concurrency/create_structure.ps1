# PowerShell script to create Python Concurrency module structure
# Base path
$basePath = "e:\MIU\codes\Python_Programming\Python_Core\B_Advanced\O.14_Concurrency"

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
    
    # Create directory if it doesn't exist
    if (-not (Test-Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
        Write-Host "Created directory: $path"
    }
    
    # Create each notebook
    foreach ($notebook in $notebooks) {
        $notebookPath = Join-Path $path $notebook
        if (-not (Test-Path $notebookPath)) {
            $notebookTemplate | Out-File -FilePath $notebookPath -Encoding utf8
            Write-Host "Created notebook: $notebook"
        }
    }
}

# 01_Threads_GIL_Concepts
$path1 = Join-Path $basePath "01_Threads_GIL_Concepts\01_Basics"
Create-NotebookStructure -path $path1 -notebooks @(
    "1.1_concurrency_vs_parallelism_cpu_bound_vs_io_bound.ipynb",
    "1.2_threads_vs_processes_vs_asyncio_mental_models.ipynb",
    "1.3_the_gil_what_it_means_in_cpython.ipynb",
    "1.4_race_conditions_atomicity_and_shared_state_intro.ipynb",
    "1.5_when_threads_help_io_wait_and_blocking_calls.ipynb"
)

$path2 = Join-Path $basePath "01_Threads_GIL_Concepts\02_Common_Patterns"
Create-NotebookStructure -path $path2 -notebooks @(
    "2.1_message_passing_vs_shared_memory_design_choices.ipynb",
    "2.2_thread_pool_overview_with_concurrent_futures.ipynb",
    "2.3_how_blocking_io_releases_the_gil_practically.ipynb",
    "2.4_shutdown_timeouts_and_cooperative_stop_signals.ipynb"
)

$path3 = Join-Path $basePath "01_Threads_GIL_Concepts\03_Pro_Tips"
Create-NotebookStructure -path $path3 -notebooks @(
    "3.1_debugging_concurrency_bugs_deadlocks_starvation_races.ipynb",
    "3.2_free_threaded_cpython_pep703_preview_and_implications.ipynb",
    "3.3_interpreterpoolexecutor_preview_and_when_it_helps.ipynb"
)

# 02_threading_Locks_Events
$path4 = Join-Path $basePath "02_threading_Locks_Events\01_Basics"
Create-NotebookStructure -path $path4 -notebooks @(
    "1.1_thread_lifecycle_start_join_daemon_naming.ipynb",
    "1.2_lock_vs_rlock_and_with_statement.ipynb",
    "1.3_event_for_signaling_and_shutdown.ipynb",
    "1.4_condition_wait_notify_for_coordination.ipynb",
    "1.5_semaphore_bounded_semaphore_for_limits.ipynb",
    "1.6_barrier_for_phase_coordination.ipynb"
)

$path5 = Join-Path $basePath "02_threading_Locks_Events\02_Common_Patterns"
Create-NotebookStructure -path $path5 -notebooks @(
    "2.1_protecting_shared_state_read_modify_write.ipynb",
    "2.2_lock_ordering_to_avoid_deadlocks.ipynb",
    "2.3_worker_shutdown_patterns_event_sentinel.ipynb",
    "2.4_exception_handling_in_threads_and_reporting.ipynb"
)

$path6 = Join-Path $basePath "02_threading_Locks_Events\03_Pro_Tips"
Create-NotebookStructure -path $path6 -notebooks @(
    "3.1_thread_local_state_with_threading_local.ipynb",
    "3.2_deadlock_diagnostics_and_dumping_thread_stacks_preview.ipynb",
    "3.3_when_not_to_use_threads_and_how_to_refactor.ipynb"
)

# 03_Queues_Producer_Consumer
$path7 = Join-Path $basePath "03_Queues_Producer_Consumer\01_Basics"
Create-NotebookStructure -path $path7 -notebooks @(
    "1.1_queue_queue_put_get_task_done_join.ipynb",
    "1.2_single_producer_single_consumer_worker.ipynb",
    "1.3_multi_producer_multi_consumer_worker_pool.ipynb",
    "1.4_timeouts_put_get_and_nonblocking_checks.ipynb"
)

$path8 = Join-Path $basePath "03_Queues_Producer_Consumer\02_Common_Patterns"
Create-NotebookStructure -path $path8 -notebooks @(
    "2.1_sentinel_values_for_graceful_shutdown.ipynb",
    "2.2_bounded_queues_for_backpressure.ipynb",
    "2.3_priorityqueue_and_lifoqueue_use_cases.ipynb",
    "2.4_pipeline_pattern_multi_stage_processing.ipynb"
)

$path9 = Join-Path $basePath "03_Queues_Producer_Consumer\03_Pro_Tips"
Create-NotebookStructure -path $path9 -notebooks @(
    "3.1_exception_propagation_from_workers_to_main_thread.ipynb",
    "3.2_queue_depth_metrics_and_throughput_tuning_preview.ipynb",
    "3.3_poison_pills_vs_events_vs_cancellation_tradeoffs.ipynb"
)

# 04_multiprocessing_Pools
$path10 = Join-Path $basePath "04_multiprocessing_Pools\01_Basics"
Create-NotebookStructure -path $path10 -notebooks @(
    "1.1_process_lifecycle_start_join_exitcode.ipynb",
    "1.2_the_main_guard_if_name_main.ipynb",
    "1.3_pool_map_starmap_imap_basics.ipynb",
    "1.4_pickling_constraints_functions_data_and_errors.ipynb"
)

$path11 = Join-Path $basePath "04_multiprocessing_Pools\02_Common_Patterns"
Create-NotebookStructure -path $path11 -notebooks @(
    "2.1_start_methods_spawn_fork_forkserver_and_defaults.ipynb",
    "2.2_pool_apply_async_callbacks_error_callbacks.ipynb",
    "2.3_chunksize_and_work_partitioning.ipynb",
    "2.4_ipc_with_multiprocessing_queue_pipe.ipynb",
    "2.5_processpoolexecutor_vs_pool_selection_guide.ipynb"
)

$path12 = Join-Path $basePath "04_multiprocessing_Pools\03_Pro_Tips"
Create-NotebookStructure -path $path12 -notebooks @(
    "3.1_shared_state_manager_value_array_tradeoffs.ipynb",
    "3.2_shared_memory_for_large_data_preview.ipynb",
    "3.3_avoiding_fork_hazards_with_threads_and_locks.ipynb",
    "3.4_process_safe_logging_and_results_collection_patterns.ipynb"
)

# 05_AsyncIO_Event_Loop
$path13 = Join-Path $basePath "05_AsyncIO_Event_Loop\01_Basics"
Create-NotebookStructure -path $path13 -notebooks @(
    "1.1_coroutines_async_await_and_asyncio_run.ipynb",
    "1.2_create_task_vs_await_directly.ipynb",
    "1.3_gather_wait_and_as_completed_overview.ipynb",
    "1.4_run_blocking_code_with_to_thread_and_executors.ipynb"
)

$path14 = Join-Path $basePath "05_AsyncIO_Event_Loop\02_Common_Patterns"
Create-NotebookStructure -path $path14 -notebooks @(
    "2.1_event_loop_concepts_get_running_loop_and_callbacks.ipynb",
    "2.2_asyncio_timeouts_wait_for_and_wait.ipynb",
    "2.3_asyncio_sync_primitives_lock_event_semaphore.ipynb",
    "2.4_context_propagation_with_contextvars_preview.ipynb"
)

$path15 = Join-Path $basePath "05_AsyncIO_Event_Loop\03_Pro_Tips"
Create-NotebookStructure -path $path15 -notebooks @(
    "3.1_debug_mode_slow_callbacks_and_task_introspection_preview.ipynb",
    "3.2_integrating_threads_processes_with_asyncio_preview.ipynb",
    "3.3_structured_concurrency_overview_taskgroup_preview.ipynb"
)

# 06_Async_Tasks_Cancellation
$path16 = Join-Path $basePath "06_Async_Tasks_Cancellation\01_Basics"
Create-NotebookStructure -path $path16 -notebooks @(
    "1.1_task_lifecycle_states_and_scheduling.ipynb",
    "1.2_task_cancel_cancellederror_and_finally_cleanup.ipynb",
    "1.3_timeout_patterns_wait_for_and_time_budgets.ipynb",
    "1.4_shielding_from_cancellation_basics.ipynb"
)

$path17 = Join-Path $basePath "06_Async_Tasks_Cancellation\02_Common_Patterns"
Create-NotebookStructure -path $path17 -notebooks @(
    "2.1_cancellation_propagation_with_gather_and_taskgroup.ipynb",
    "2.2_graceful_shutdown_stop_accepting_finish_inflight.ipynb",
    "2.3_retry_with_timeouts_and_cancellation_safety_preview.ipynb",
    "2.4_handling_partial_failures_return_exceptions_tradeoffs.ipynb"
)

$path18 = Join-Path $basePath "06_Async_Tasks_Cancellation\03_Pro_Tips"
Create-NotebookStructure -path $path18 -notebooks @(
    "3.1_taskgroup_exception_groups_and_except_star_preview.ipynb",
    "3.2_designing_cancellation_scopes_and_boundaries_preview.ipynb",
    "3.3_avoiding_cancellation_storms_and_resource_leaks_preview.ipynb"
)

# 07_Async_Streams_async_generators
$path19 = Join-Path $basePath "07_Async_Streams_async_generators\01_Async_Generators_Basics"
Create-NotebookStructure -path $path19 -notebooks @(
    "1.1_async_generators_intro_and_use_cases.ipynb",
    "1.2_async_for_and_async_iteration_protocol.ipynb",
    "1.3_async_generator_cleanup_aclose_and_finalization.ipynb",
    "1.4_async_generator_backpressure_by_design_preview.ipynb"
)

$path20 = Join-Path $basePath "07_Async_Streams_async_generators\02_Asyncio_Streams_Basics"
Create-NotebookStructure -path $path20 -notebooks @(
    "2.1_open_connection_and_start_server_reader_writer.ipynb",
    "2.2_readexactly_readuntil_and_line_protocols.ipynb",
    "2.3_writer_drain_and_backpressure.ipynb",
    "2.4_timeouts_and_cancellation_with_streams.ipynb"
)

$path21 = Join-Path $basePath "07_Async_Streams_async_generators\03_Common_Patterns"
Create-NotebookStructure -path $path21 -notebooks @(
    "3.1_streaming_parsers_framing_and_delimiters.ipynb",
    "3.2_async_pipeline_transform_filter_sink.ipynb",
    "3.3_bridging_sync_iterators_to_async_preview.ipynb",
    "3.4_resource_management_async_with_and_exitstack_preview.ipynb"
)

$path22 = Join-Path $basePath "07_Async_Streams_async_generators\04_Pro_Tips"
Create-NotebookStructure -path $path22 -notebooks @(
    "4.1_designing_async_iterators_for_testability_preview.ipynb",
    "4.2_stream_error_handling_half_open_connections_preview.ipynb",
    "4.3_finalizing_async_generators_on_shutdown_preview.ipynb"
)

# 08_Concurrency_Patterns
$path23 = Join-Path $basePath "08_Concurrency_Patterns\01_Core_Patterns"
Create-NotebookStructure -path $path23 -notebooks @(
    "1.1_worker_pool_pattern_threads_processes_asyncio.ipynb",
    "1.2_fan_out_fan_in_gather_and_result_collection.ipynb",
    "1.3_pipeline_pattern_with_backpressure.ipynb",
    "1.4_map_reduce_style_parallel_map_preview.ipynb"
)

$path24 = Join-Path $basePath "08_Concurrency_Patterns\02_Bounded_Concurrency_Rate_Limits"
Create-NotebookStructure -path $path24 -notebooks @(
    "2.1_bounded_semaphore_limit_inflight_work.ipynb",
    "2.2_queue_bounded_buffers_and_load_shedding_preview.ipynb",
    "2.3_token_bucket_and_leaky_bucket_preview.ipynb",
    "2.4_timeout_budgets_deadlines_and_cancellation.ipynb"
)

$path25 = Join-Path $basePath "08_Concurrency_Patterns\03_Pro_Tips"
Create-NotebookStructure -path $path25 -notebooks @(
    "3.1_structured_concurrency_taskgroup_as_default_preview.ipynb",
    "3.2_idempotency_and_safe_retries_in_concurrent_systems_preview.ipynb",
    "3.3_observability_for_concurrency_queue_depth_latency_inflight.ipynb"
)

# 09_Performance_Comparison
$path26 = Join-Path $basePath "09_Performance_Comparison\01_Benchmarking_Basics"
Create-NotebookStructure -path $path26 -notebooks @(
    "1.1_measuring_correctly_timeit_perf_counter_warmups.ipynb",
    "1.2_cpu_bound_vs_io_bound_microbenchmarks.ipynb",
    "1.3_overheads_context_switch_pickling_event_loop.ipynb"
)

$path27 = Join-Path $basePath "09_Performance_Comparison\02_Model_Comparisons"
Create-NotebookStructure -path $path27 -notebooks @(
    "2.1_threads_vs_asyncio_for_io_bound_work.ipynb",
    "2.2_processes_vs_threads_for_cpu_bound_work.ipynb",
    "2.3_threadpool_vs_processpool_executor_tradeoffs.ipynb",
    "2.4_scaling_limits_file_descriptors_memory_and_backpressure.ipynb"
)

$path28 = Join-Path $basePath "09_Performance_Comparison\03_Pro_Tips"
Create-NotebookStructure -path $path28 -notebooks @(
    "3.1_profiling_concurrent_programs_and_finding_contention_preview.ipynb",
    "3.2_tuning_pool_sizes_queue_sizes_and_chunksize_preview.ipynb",
    "3.3_free_threaded_builds_and_future_parallelism_notes_preview.ipynb"
)

Write-Output ""
Write-Output "Structure creation complete!"
Write-Output "Total directories created: 27"
Write-Output "Total notebooks created: 113"
