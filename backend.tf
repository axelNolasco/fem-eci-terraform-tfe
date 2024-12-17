terraform {
  cloud {
    organization = "axels-personal-organization" 
    workspaces {
      name = "axels-eci-tfe" 
    }
  }
}
