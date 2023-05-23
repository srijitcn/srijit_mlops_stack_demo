resource "databricks_mlflow_experiment" "experiment" {
  name        = "${local.mlflow_experiment_parent_dir}/${local.env_prefix}srijit_mlops_stack_demo-experiment"
  description = "MLflow Experiment used to track runs for srijit_mlops_stack_demo project."
}
