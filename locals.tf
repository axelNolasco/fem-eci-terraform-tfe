locals {
  project = {
    "axels-eci-project" = {
      description = "Example description of project"
    }
  }

  workspace = {
    "axels-eci-tfe" = {
        description = "Example description of workspace"
        execution_mode = "remote"
        project_id = module.project["axels-eci-project"].id
        vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-tfe"
    }
    "axels-eci-github" = {
        description = "Example automation workspace for GitHub resources"
        execution_mode = "local"
        project_id = module.project["axels-eci-project"].id
        vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-github"
    }
  }
}