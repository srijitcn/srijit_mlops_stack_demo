# Project Overview

[(back to main README)](../README.md)

## ML pipeline structure
This project defines an ML pipeline for automated retraining and batch inference of an ML model
on tabular data.

See the full pipeline structure below. The [stacks README](https://github.com/databricks/mlops-stack/blob/main/Pipeline.md)
contains additional details on how ML pipelines are tested and deployed across each of the dev, staging, prod environments below.

![MLOps Stacks diagram](images/mlops-stack-summary.png)


## Code structure
This project contains the following components:

| Component                  | Description                                                                                                                                     |
|----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| ML Code                    | Example ML project code, with unit tested Python modules and notebooks using [MLflow recipes](https://mlflow.org/docs/latest/recipes.html)  |
| ML Resource Config as Code | ML pipeline resource config (training and batch inference job schedules, etc) defined through [Terraform](https://learn.microsoft.com/azure/databricks/dev-tools/terraform/index) |
| CI/CD                      | [GitHub Actions](https://github.com/actions) workflows to test and deploy ML code and resources                                                  |

contained in the following files:

```
srijit_mlops_stack_demo         <- Root directory. Both monorepo and polyrepo are supported.
│
├── srijit_mlops_stack_demo       <- Contains python code, notebooks and ML resources related to one ML project. 
│   │
│   ├── training                <- Training folder contains Notebook that trains and registers the model with feature store support.
│   │
│   ├── feature_engineering     <- Feature computation code (Python modules) that implements the feature transforms.
│   │                              The output of these transforms get persisted as Feature Store tables. Most development
│   │                              work happens here.
│   │
│   ├── validation              <- Optional model validation step before deploying a model.
│   │
│   ├── monitoring              <- Model monitoring, feature monitoring, etc.
│   │
│   ├── deployment              <- Deployment and Batch inference workflows
│   │   │
│   │   ├── batch_inference     <- Batch inference code that will run as part of scheduled workflow.
│   │   │
│   │   ├── model_deployment    <- As part of CD workflow, promote model to Production stage in model registry.
│   │
│   │
│   ├── tests                   <- Unit tests for the ML project, including the modules under `features`.
│   │
│   ├── terraform               <- ML resource (ML jobs, MLflow models) config definitions expressed as code, across staging/prod.
│       │
│       ├── staging             <- ML resource for staging workspace.
│       │
│       ├── prod                <- ML resource for prod workspace.
│
├── .github                     <- Configuration folder for CI/CD using GitHub Actions. The CI/CD workflows run the notebooks
│                                  under `notebooks` to test and deploy model training code
│ 
├── requirements.txt            <- Specifies Python dependencies for ML code (for example: model training, batch inference).
```

## Next Steps
See the [main README](../README.md#using-this-repo) for additional links on how to work with this repo.
