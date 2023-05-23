terraform {
  // The `backend` block below configures the azurerm backend
  // (docs:
  // https://www.terraform.io/language/settings/backends/azurerm and
  // https://learn.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage)
  // for storing Terraform state in Azure Blob Storage.
  // You can run the setup scripts in mlops-setup-scripts/terraform to provision the Azure Blob Storage container
  // referenced below and store appropriate credentials for accessing the container from CI/CD.
  //
  backend "azurerm" {
    resource_group_name  = "srijitmlopsstackdemo"
    storage_account_name = "srijitmlopsstackdemo"
    container_name       = "tfstate"
    key                  = "staging.terraform.tfstate"
  }
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}
