locals {
  project = {
    "axels-eci-project" = {
      description = "Example description of project"
    }
  }

  workspace = {
    "axels-eci-tfe" = {
        description         = "Example description of workspace"
        execution_mode      = "remote"
        project_id          = module.project["axels-eci-project"].id
        vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-tfe"
    }
    "axels-eci-github" = {
        description         = "Example automation workspace for GitHub resources"
        execution_mode      = "remote"
        project_id          = module.project["axels-eci-project"].id
        vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-github"
    }

    "axels-eci-aws-network" = {
      description         = "Automation for AWS network resources."
      execution_mode      = "remote"
      project_id          = module.project["axels-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-aws-network"

      variables = [
        {
          category = "terraform"
          hcl      = true
          key      = "azs"
          value    = jsonencode(["us-west-2a", "us-west-2b"])
        },
        {
          category = "terraform"
          key      = "cidr"
          value    = "10.0.0.0/16"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "fem-eci"
        },
      ]
    }

    "axels-eci-aws-cluster-prod" = {
      description         = "Automation for AWS cluster resources."
      execution_mode      = "remote"
      project_id          = module.project["axels-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-aws-cluster"

      variables = [
        {
          category = "terraform"
          key      = "domain"
          value    = "cosmogony.mx"
        },
        {
          category = "terraform"
          key      = "environment"
          value    = "prod"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "fem-eci-axels-cluster"
        },
        {
          category = "terraform"
          key      = "vpc_name"
          value    = "fem-eci"
        },
      ]
    }
  }
}