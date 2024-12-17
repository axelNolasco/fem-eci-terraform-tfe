locals {
  project = {
    "axels-eci-project" = {
      description = "Example description of project"
    }
  }

  workspace = {
    "axels-eci-tfe" = {
        description = "Example description of workspace"
        execution_mode = "local"
        project_id = module.project["axels-eci-project"].id
        # vcs_repo_identifier = "axelNolasco/fem-eci-terraform-tfe"
    }
  }
}