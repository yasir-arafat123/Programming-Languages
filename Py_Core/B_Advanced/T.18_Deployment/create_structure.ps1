# PowerShell script to create Python Deployment module structure
# Base path
$basePath = "e:\MIU\codes\Python_Programming\Python_Core\B_Advanced\T.18_Deployment"

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

# 02_Environment_Variables_Config
$path1 = Join-Path $basePath "02_Environment_Variables_Config\01_Basics"
Create-NotebookStructure -path $path1 -notebooks @(
    "1.1_config_vs_code_12factor_overview.ipynb",
    "1.2_read_env_vars_os_getenv_defaults.ipynb",
    "1.3_required_vars_fail_fast_patterns.ipynb",
    "1.4_dotenv_for_local_dev_and_gitignore.ipynb"
)

$path2 = Join-Path $basePath "02_Environment_Variables_Config\02_Common_Patterns"
Create-NotebookStructure -path $path2 -notebooks @(
    "2.1_config_layers_env_file_defaults.ipynb",
    "2.2_config_validation_and_schema_like_checks.ipynb",
    "2.3_runtime_feature_flags_and_profiles.ipynb",
    "2.4_logging_safe_config_dump_redaction.ipynb"
)

$path3 = Join-Path $basePath "02_Environment_Variables_Config\03_Pro_Tips"
Create-NotebookStructure -path $path3 -notebooks @(
    "3.1_config_naming_conventions_prefixes_and_scoping.ipynb",
    "3.2_runtime_reload_vs_restart_tradeoffs_preview.ipynb",
    "3.3_config_attack_surface_and_injection_notes_preview.ipynb"
)

# 03_CI_CD_Pipelines_GitHub_Actions
$path4 = Join-Path $basePath "03_CI_CD_Pipelines_GitHub_Actions\01_Basics"
Create-NotebookStructure -path $path4 -notebooks @(
    "1.1_workflow_yaml_structure_triggers_jobs_steps.ipynb",
    "1.2_checkout_setup_python_install_deps_run_tests.ipynb",
    "1.3_matrix_builds_multiple_python_versions.ipynb",
    "1.4_artifacts_and_test_reports_basics.ipynb"
)

$path5 = Join-Path $basePath "03_CI_CD_Pipelines_GitHub_Actions\02_Common_Patterns"
Create-NotebookStructure -path $path5 -notebooks @(
    "2.1_dependency_caching_pip_poetry_pipenv.ipynb",
    "2.2_lint_format_typecheck_in_pipeline.ipynb",
    "2.3_coverage_upload_and_quality_gates.ipynb",
    "2.4_release_workflows_tags_and_version_bumps.ipynb"
)

$path6 = Join-Path $basePath "03_CI_CD_Pipelines_GitHub_Actions\03_Pro_Tips"
Create-NotebookStructure -path $path6 -notebooks @(
    "3.1_security_hardening_permissions_pin_actions_versions.ipynb",
    "3.2_environments_approvals_and_protected_branches_preview.ipynb",
    "3.3_reusable_workflows_and_composite_actions_preview.ipynb"
)

# 04_Package_Distribution_PyPI
$path7 = Join-Path $basePath "04_Package_Distribution_PyPI\01_Basics"
Create-NotebookStructure -path $path7 -notebooks @(
    "1.1_project_layout_and_pyproject_toml_basics.ipynb",
    "1.2_build_sdist_and_wheel_with_build.ipynb",
    "1.3_metadata_readme_license_classifiers.ipynb",
    "1.4_upload_to_testpypi_then_pypi_with_twine.ipynb"
)

$path8 = Join-Path $basePath "04_Package_Distribution_PyPI\02_Common_Patterns"
Create-NotebookStructure -path $path8 -notebooks @(
    "2.1_versioning_strategies_and_tags.ipynb",
    "2.2_include_package_data_and_manifest_in.ipynb",
    "2.3_private_indexes_and_internal_packages_preview.ipynb",
    "2.4_release_notes_changelog_and_artifacts.ipynb"
)

$path9 = Join-Path $basePath "04_Package_Distribution_PyPI\03_Pro_Tips"
Create-NotebookStructure -path $path9 -notebooks @(
    "3.1_trusted_publishing_oidc_from_github_actions.ipynb",
    "3.2_build_reproducibility_isolation_and_clean_envs.ipynb",
    "3.3_deprecation_policy_and_backward_compatibility_preview.ipynb"
)

# 05_Virtual_Environments_Production
$path10 = Join-Path $basePath "05_Virtual_Environments_Production\01_Basics"
Create-NotebookStructure -path $path10 -notebooks @(
    "1.1_venv_creation_and_layout_bin_lib_site_packages.ipynb",
    "1.2_install_deps_from_requirements_txt_or_lockfiles.ipynb",
    "1.3_freeze_constraints_and_repeatable_installs.ipynb",
    "1.4_where_venv_lives_in_deployments_patterns.ipynb"
)

$path11 = Join-Path $basePath "05_Virtual_Environments_Production\02_Common_Patterns"
Create-NotebookStructure -path $path11 -notebooks @(
    "2.1_build_wheels_then_install_wheels_only_preview.ipynb",
    "2.2_separating_runtime_and_dev_dependencies.ipynb",
    "2.3_pip_configuration_indexes_certs_timeouts.ipynb",
    "2.4_health_checks_and_smoke_tests_post_deploy.ipynb"
)

$path12 = Join-Path $basePath "05_Virtual_Environments_Production\03_Pro_Tips"
Create-NotebookStructure -path $path12 -notebooks @(
    "3.1_immutable_deploy_artifacts_and_rollbacks_preview.ipynb",
    "3.2_native_deps_manylinux_and_platform_wheels_preview.ipynb",
    "3.3_debugging_env_drift_sys_path_and_import_issues.ipynb"
)

# 06_Secrets_Management
$path13 = Join-Path $basePath "06_Secrets_Management\01_Basics"
Create-NotebookStructure -path $path13 -notebooks @(
    "1.1_secrets_vs_config_and_threat_model.ipynb",
    "1.2_github_actions_secrets_usage_and_scoping.ipynb",
    "1.3_local_dev_secrets_dotenv_do_and_dont.ipynb",
    "1.4_generate_tokens_with_python_secrets_module.ipynb"
)

$path14 = Join-Path $basePath "06_Secrets_Management\02_Common_Patterns"
Create-NotebookStructure -path $path14 -notebooks @(
    "2.1_rotation_expiry_and_break_glass_process.ipynb",
    "2.2_secret_redaction_in_logs_and_error_reports.ipynb",
    "2.3_managed_secret_stores_vault_kms_overview.ipynb",
    "2.4_least_privilege_and_auditability_checklist.ipynb"
)

$path15 = Join-Path $basePath "06_Secrets_Management\03_Pro_Tips"
Create-NotebookStructure -path $path15 -notebooks @(
    "3.1_oidc_federation_for_ci_tokens_no_long_lived_secrets.ipynb",
    "3.2_dynamic_credentials_and_short_lived_secrets_preview.ipynb",
    "3.3_incident_response_for_secret_leaks_preview.ipynb"
)

Write-Output ""
Write-Output "Structure creation complete!"
Write-Output "Total directories created: 15"
Write-Output "Total notebooks created: 55"
