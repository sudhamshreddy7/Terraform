terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.0.1"
    }
    aws = {
     source  = "hashicorp/aws"
     version = "~> 4.0"
   }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.0.1"
    }

  }
}
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  
}
provider "aws" {
 region = "us-east-2"
}
provider "google" {
  # Configuration options
  project = "terraform-demo-434320"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "/Users/sudhamshreddy/Desktop/Terraform/keys.json"
}
