terraform { 
  cloud {
    
    organization = "axels-personal-organization"

    workspaces { 
      name = "fem-eci-tfe-axel"
    } 
  } 
}