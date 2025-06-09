/*
--- Built-in Replacements ---
This file contains built-in replacements to avoid repeating the same hard-coded values.
Replacements are denoted by the dollar-dollar curly braces token (e.g. $${starter_location_01}). The following details each built-in replacemnets that you can use:
`starter_location_01`: This the primary an Azure location sourced from the `starter_locations` variable. This can be used to set the location of resources.
`starter_location_02` to `starter_location_10`: These are the secondary Azure locations sourced from the `starter_locations` variable. This can be used to set the location of resources.
`starter_location_01_availability_zones` to `starter_location_10_availability_zones`: These are the availability zones for the Azure locations sourced from the `starter_locations` variable. This can be used to set the availability zones of resources.
`starter_location_01_virtual_network_gateway_sku_express_route` to `starter_location_10_virtual_network_gateway_sku_express_route`: These are the default SKUs for the Express Route virtual network gateways based on the Azure locations sourced from the `starter_locations` variable. This can be used to set the SKU of the virtual network gateways.
`starter_location_01_virtual_network_gateway_sku_vpn` to `starter_location_10_virtual_network_gateway_sku_vpn`: These are the default SKUs for the VPN virtual network gateways based on the Azure locations sourced from the `starter_locations` variable. This can be used to set the SKU of the virtual network gateways.
`root_parent_management_group_id`: This is the id of the management group that the ALZ hierarchy will be nested under.
`subscription_id_identity`: The subscription ID of the subscription to deploy the identity resources to, sourced from the variable `subscription_id_identity`.
`subscription_id_connectivity`: The subscription ID of the subscription to deploy the connectivity resources to, sourced from the variable `subscription_id_connectivity`.
`subscription_id_management`: The subscription ID of the subscription to deploy the management resources to, sourced from the variable `subscription_id_management`.
*/

/*
--- Custom Replacements ---
You can define custom replacements to use throughout the configuration.
*/
custom_replacements = {
  /*
  --- Custom Name Replacements ---
  You can define custom names and other strings to use throughout the configuration.
  You can only use the built in replacements in this section.
  NOTE: You cannot refer to another custom name in this variable.
  */
  names = {
    # Defender email security contact
    defender_email_security_contact = "pimiralles@microsoft.com"

    # Resource group names
    management_resource_group_name               = "bdoalz-p-rg-management-$${starter_location_01}"
    #connectivity_hub_vwan_resource_group_name    = "bdoalz-p-rg-hub-vwan-$${starter_location_01}"
    #connectivity_hub_primary_resource_group_name = "bdoalz-p-rg-hub-$${starter_location_01}"
    #dns_resource_group_name                      = "bdoalz-p-rg-hub-dns-$${starter_location_01}"
    #ddos_resource_group_name                     = "bdoalz-p-rg-hub-ddos-$${starter_location_01}"
    asc_export_resource_group_name               = "bdoalz-p-rg-asc-export-$${starter_location_01}"

    # Resource names
    log_analytics_workspace_name            = "bdoalz-p-law-management-$${starter_location_01}"
    #ddos_protection_plan_name               = "bdoalz-p-ddos-$${starter_location_01}"
    ama_user_assigned_managed_identity_name = "bdoalz-p-uami-management-ama-$${starter_location_01}"
    dcr_change_tracking_name                = "bdoalz-p-dcr-change-tracking"
    dcr_defender_sql_name                   = "bdoalz-p-dcr-defender-sql"
    dcr_vm_insights_name                    = "bdoalz-p-dcr-vm-insights"

    # Resource provisioning global connectivity
    #ddos_protection_plan_enabled = false

    # Resource provisioning primary connectivity
    #primary_firewall_enabled                              = false
    #primary_virtual_network_gateway_express_route_enabled = false
    #primary_virtual_network_gateway_vpn_enabled           = false
    #primary_private_dns_zones_enabled                     = false
    #primary_private_dns_auto_registration_zone_enabled    = false
    #primary_private_dns_resolver_enabled                  = false # This setting currently has no effect, but will be implemented in a future release. To turn off the private DNS resolver, set the `primary_private_dns_zones_enabled` setting to `false`.
    #primary_bastion_enabled                               = true
    #primary_sidecar_virtual_network_enabled               = true

    # Resource names primary connectivity
    #primary_hub_name                                   = "bdoalz-p-vwan-hub-$${starter_location_01}"
    #primary_sidecar_virtual_network_name               = "bdoalz-p-vnet-sidecar-$${starter_location_01}"
    #primary_firewall_name                              = "bdoalz-p-fw-hub-$${starter_location_01}"
    #primary_firewall_policy_name                       = "bdoalz-p-fwp-hub-$${starter_location_01}"
    #primary_virtual_network_gateway_express_route_name = "bdoalz-p-vgw-hub-er-$${starter_location_01}"
    #primary_virtual_network_gateway_vpn_name           = "bdoalz-p-vgw-hub-vpn-$${starter_location_01}"
    #primary_private_dns_resolver_name                  = "bdoalz-p-pdr-hub-dns-$${starter_location_01}"
    #primary_bastion_host_name                          = "bdoalz-p-bas-hub-$${starter_location_01}"
    #primary_bastion_host_public_ip_name                = "bdoalz-p-pip-bastion-hub-$${starter_location_01}"

    # Private DNS Zones primary
    #primary_auto_registration_zone_name = "$${starter_location_01}.azure.local"

    # IP Ranges Primary
    # Regional Address Space: 10.0.0.0/16
    #primary_hub_address_space                          = "10.0.0.0/22"
    #primary_side_car_virtual_network_address_space     = "10.0.4.0/22"
    #primary_bastion_subnet_address_prefix              = "10.0.4.0/26"
    #primary_private_dns_resolver_subnet_address_prefix = "10.0.4.64/28"
  }

  /*
  --- Custom Resource Group Identifier Replacements ---
  You can define custom resource group identifiers to use throughout the configuration.
  You can only use the templated variables and custom names in this section.
  NOTE: You cannot refer to another custom resource group identifier in this variable.
  */
  resource_group_identifiers = {
    management_resource_group_id           = "/subscriptions/$${subscription_id_management}/resourcegroups/$${management_resource_group_name}"
    #ddos_protection_plan_resource_group_id = "/subscriptions/$${subscription_id_connectivity}/resourcegroups/$${ddos_resource_group_name}"
  }

  /*
  --- Custom Resource Identifier Replacements ---
  You can define custom resource identifiers to use throughout the configuration.
  You can only use the templated variables, custom names and customer resource group identifiers in this variable.
  NOTE: You cannot refer to another custom resource identifier in this variable.
  */
  resource_identifiers = {
    ama_change_tracking_data_collection_rule_id = "$${management_resource_group_id}/providers/Microsoft.Insights/dataCollectionRules/$${dcr_change_tracking_name}"
    ama_mdfc_sql_data_collection_rule_id        = "$${management_resource_group_id}/providers/Microsoft.Insights/dataCollectionRules/$${dcr_defender_sql_name}"
    ama_vm_insights_data_collection_rule_id     = "$${management_resource_group_id}/providers/Microsoft.Insights/dataCollectionRules/$${dcr_vm_insights_name}"
    ama_user_assigned_managed_identity_id       = "$${management_resource_group_id}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/$${ama_user_assigned_managed_identity_name}"
    log_analytics_workspace_id                  = "$${management_resource_group_id}/providers/Microsoft.OperationalInsights/workspaces/$${log_analytics_workspace_name}"
    #ddos_protection_plan_id                     = "$${ddos_protection_plan_resource_group_id}/providers/Microsoft.Network/ddosProtectionPlans/$${ddos_protection_plan_name}"
  }
}

enable_telemetry = true

/*
--- Tags ---
This variable can be used to apply tags to all resources that support it. Some resources allow overriding these tags.
*/
tags = {
  deployed_by = "terraform"
  source      = "Azure Landing Zones Accelerator"
}

/*
--- Management Resources ---
You can use this section to customize the management resources that will be deployed.
*/
management_resource_settings = {
  enabled                      = true
  location                     = "$${starter_location_01}"
  log_analytics_workspace_name = "$${log_analytics_workspace_name}"
  resource_group_name          = "$${management_resource_group_name}"
  user_assigned_managed_identities = {
    ama = {
      name = "$${ama_user_assigned_managed_identity_name}"
    }
  }
  data_collection_rules = {
    change_tracking = {
      name = "$${dcr_change_tracking_name}"
    }
    defender_sql = {
      name = "$${dcr_defender_sql_name}"
    }
    vm_insights = {
      name = "$${dcr_vm_insights_name}"
    }
  }
}

/*
--- Management Groups and Policy ---
You can use this section to customize the management groups and policies that will be deployed.
You can further configure management groups and policy by supplying a `lib` folder. This is detailed in the Accelerator documentation.
*/
management_group_settings = {
  enabled            = true
  location           = "$${starter_location_01}"
  parent_resource_id = "$${root_parent_management_group_id}"
  policy_default_values = {
    ama_change_tracking_data_collection_rule_id = "$${ama_change_tracking_data_collection_rule_id}"
    ama_mdfc_sql_data_collection_rule_id        = "$${ama_mdfc_sql_data_collection_rule_id}"
    ama_vm_insights_data_collection_rule_id     = "$${ama_vm_insights_data_collection_rule_id}"
    ama_user_assigned_managed_identity_id       = "$${ama_user_assigned_managed_identity_id}"
    ama_user_assigned_managed_identity_name     = "$${ama_user_assigned_managed_identity_name}"
    log_analytics_workspace_id                  = "$${log_analytics_workspace_id}"
    #ddos_protection_plan_id                     = "$${ddos_protection_plan_id}"
    #private_dns_zone_subscription_id            = "$${subscription_id_connectivity}"
    #private_dns_zone_region                     = "$${starter_location_01}"
    #private_dns_zone_resource_group_name        = "$${dns_resource_group_name}"
  }
  subscription_placement = {
    identity = {
      subscription_id       = "$${subscription_id_identity}"
      management_group_name = "mg-platform-identity-prd"
    }
    connectivity = {
      subscription_id       = "$${subscription_id_connectivity}"
      management_group_name = "mg-platform-connectivity-prd"
    }
    management = {
      subscription_id       = "$${subscription_id_management}"
      management_group_name = "mg-platform-management-prd"
    }
  }
  policy_assignments_to_modify = {
    mg-alz-root-prod = {
      policy_assignments = {
        Deploy-MDFC-Config-H224 = {
          parameters = {
            ascExportResourceGroupName                  = "$${asc_export_resource_group_name}"
            ascExportResourceGroupLocation              = "$${starter_location_01}"
            emailSecurityContact                        = "$${defender_email_security_contact}"
            enableAscForServers                         = "Disabled"
            enableAscForServersVulnerabilityAssessments = "Disabled"
            enableAscForSql                             = "Disabled"
            enableAscForAppServices                     = "Disabled"
            enableAscForStorage                         = "Disabled"
            enableAscForContainers                      = "Disabled"
            enableAscForKeyVault                        = "Disabled"
            enableAscForSqlOnVm                         = "Disabled"
            enableAscForArm                             = "Disabled"
            enableAscForOssDb                           = "Disabled"
            enableAscForCosmosDbs                       = "Disabled"
            enableAscForCspm                            = "Disabled"
          },
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-AzActivity-Log = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-MDEndpointsAMA = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-MDFC-OssDb = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-MDFC-SqlAtp = {
          enforcement_mode = "DoNotEnforce"
        },
        Enforce-ACSB = {
          enforcement_mode = "DoNotEnforce"
        },
        RE-01-Zonal-Residency = {
          enforcement_mode = "DoNotEnforce"
        },
        SO-01-Data-Residency = {
          enforcement_mode = "DoNotEnforce"
        },
        SO-04-CMK = {
          enforcement_mode = "DoNotEnforce"
        },
        TR-01-Logging = {
          enforcement_mode = "DoNotEnforce"
        }
      }
    }

    mg-platform-prd = {
      policy_assignments = {
        DenyAction-DeleteUAMIAMA = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-MDFC-DefSQL-AMA = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-VM-ChangeTrack = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-VM-Monitoring = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-VMSS-ChangeTrack = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-VMSS-Monitoring = {
          enforcement_mode = "DoNotEnforce"
        },
        Enable-AUM-CheckUpdates = {
          enforcement_mode = "DoNotEnforce"
        },
        Enforce-ASR = {
          enforcement_mode = "DoNotEnforce"
        },
        Enforce-GR-KeyVault = {
          enforcement_mode = "DoNotEnforce"
        },
        Enforce-Subnet-Private = {
          enforcement_mode = "DoNotEnforce"
        }
      }
    }

    mg-platform-connectivity-prd = {
      policy_assignments = {
        Enable-DDoS-VNET = {
          enforcement_mode = "DoNotEnforce"
        }
      }
    }

    mg-landing_zones_prd = {
      policy_assignments = {
        Deny-IP-forwarding = {
          enforcement_mode = "DoNotEnforce"
        },
        Deny-MgmtPorts-Internet = {
          enforcement_mode = "DoNotEnforce"
        },
        Deny-Priv-Esc-AKS = {
          enforcement_mode = "DoNotEnforce"
        },
        Deny-Privileged-AKS = {
          enforcement_mode = "DoNotEnforce"
        },
        Deny-Storage-http = {
          enforcement_mode = "DoNotEnforce"
        },
        Deny-Subnet-Without-Nsg = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-AzSqlDb-Auditing = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-MDFC-DefSQL-AMA = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-SQL-TDE = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-SQL-Threat = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-VM-Backup = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-VM-ChangeTrack = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-VM-Monitoring = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-VMSS-ChangeTrack = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-VMSS-Monitoring = {
          enforcement_mode = "DoNotEnforce"
        },
        Enable-AUM-CheckUpdates = {
          enforcement_mode = "DoNotEnforce"
        },
        Enable-DDoS-VNET = {
          enforcement_mode = "DoNotEnforce"
        },
        Enforce-AKS-HTTPS = {
          enforcement_mode = "DoNotEnforce"
        },
        Enforce-ASR = {
          enforcement_mode = "DoNotEnforce"
        },
        Enforce-GR-KeyVault = {
          enforcement_mode = "DoNotEnforce"
        },
        Enforce-Subnet-Private = {
          enforcement_mode = "DoNotEnforce"
        },
        Enforce-TLS-SSL-Q225 = {
          enforcement_mode = "DoNotEnforce"
        },
        Audit-PeDnsZones = {
          enforcement_mode = "DoNotEnforce"
        },
        Deny-HybridNetworking = {
          enforcement_mode = "DoNotEnforce"
        },
        Deny-Public-Endpoints = {
          enforcement_mode = "DoNotEnforce"
        },
        Deny-Public-IP-On-NIC = {
          enforcement_mode = "DoNotEnforce"
        },
        Deploy-Private-DNS-Zones = {
          enforcement_mode = "DoNotEnforce"
        },
        Enforce-Fsi-Conf = {
          enforcement_mode = "DoNotEnforce"
        }
      }
    }

    mg-decom-mgmt-prd = {
      policy_assignments = {
        Enforce-ALZ-Decomm = {
          enforcement_mode = "DoNotEnforce"
        }
      }
    }


    /*
    # Example of how to update a policy assignment enforcement mode for DDOS Protection Plan
    connectivity = {
      policy_assignments = {
        Enable-DDoS-VNET = {
          enforcement_mode = "DoNotEnforce"
        }
      }
    }
    */
    /*
    # Example of how to update a policy assignment enforcement mode for Private Link DNS Zones
    corp = {
      policy_assignments = {
        Deploy-Private-DNS-Zones = {
          enforcement_mode = "DoNotEnforce"
        }
      }
    }
    */
  }
  /*
  # Example of how to add management group role assignments
  management_group_role_assignments = {
    root_owner_role_assignment = {
      management_group_name      = "root"
      role_definition_id_or_name = "Owner"
      principal_id               = "00000000-0000-0000-0000-000000000000"
    }
  }
  */
}

/*
--- Connectivity - Virtual WAN ---
You can use this section to customize the virtual wan networking that will be deployed.
*/
connectivity_type = "none"

#connectivity_resource_groups = {
#  ddos = {
    name     = "$${ddos_resource_group_name}"
    location = "$${starter_location_01}"
    settings = {
     # enabled = "$${ddos_protection_plan_enabled}"
    }
#  }
 # vwan = {
  #  name     = "$${connectivity_hub_vwan_resource_group_name}"
 #   location = "$${starter_location_01}"
  #  settings = {
  #    enabled = true
  #  }
 # }
 # vwan_hub_primary = {
  #  name     = "$${connectivity_hub_primary_resource_group_name}"
  #  location = "$${starter_location_01}"
  #  settings = {
   #   enabled = true
 #   }
 # }
 # dns = {
 #   name     = "$${dns_resource_group_name}"
 #   location = "$${starter_location_01}"
 #   settings = {
 #     enabled = "$${primary_private_dns_zones_enabled}"
 #   }
 # }
#}

#virtual_wan_settings = {
#name                = "vwan-$${starter_location_01}"
#resource_group_name = "$${connectivity_hub_vwan_resource_group_name}"
#location            = "$${starter_location_01}"
#  ddos_protection_plan = {
#    enabled             = "$${ddos_protection_plan_enabled}"
#    name                = "$${ddos_protection_plan_name}"
#    resource_group_name = "$${ddos_resource_group_name}"
#    location            = "$${starter_location_01}"
# }
#}

#virtual_wan_virtual_hubs = {
  primary = {
    hub = {
      name = "$${primary_hub_name}"
      /*
      NOTE: We are defaulting to a separate resource group for the hub per best practice for resiliency
      However, there is a known limitation with the portal experience: https://learn.microsoft.com/en-us/azure/virtual-wan/virtual-wan-faq#can-hubs-be-created-in-different-resource-groups-in-virtual-wan
      If you prefer to use the same resource group as the vwan, then set this to `$${connectivity_hub_vwan_resource_group_name}`
      */
      resource_group = "$${connectivity_hub_primary_resource_group_name}"
     location       = "$${starter_location_01}"
      address_prefix = "$${primary_hub_address_space}"
    }
    firewall = {
      enabled  = "$${primary_firewall_enabled}"
      name     = "$${primary_firewall_name}"
      sku_name = "AZFW_Hub"
      sku_tier = "Standard"
      zones    = "$${starter_location_01_availability_zones}"
    }
    firewall_policy = {
      name = "$${primary_firewall_policy_name}"
    }
    virtual_network_gateways = {
      express_route = {
        enabled = "$${primary_virtual_network_gateway_express_route_enabled}"
        name    = "$${primary_virtual_network_gateway_express_route_name}"
      }
      vpn = {
        enabled = "$${primary_virtual_network_gateway_vpn_enabled}"
        name    = "$${primary_virtual_network_gateway_vpn_name}"
      }
    }
#    private_dns_zones = {
      enabled                        = "$${primary_private_dns_zones_enabled}"
     resource_group_name            = "$${dns_resource_group_name}"
      is_primary                     = true
      auto_registration_zone_enabled = "$${primary_private_dns_auto_registration_zone_enabled}"
      auto_registration_zone_name    = "$${primary_auto_registration_zone_name}"
      subnet_address_prefix          = "$${primary_private_dns_resolver_subnet_address_prefix}"
      private_dns_resolver = {
        enabled = "$${primary_private_dns_resolver_enabled}"
        name    = "$${primary_private_dns_resolver_name}"
      }
    }
#    bastion = {
#      enabled               = "$${primary_bastion_enabled}"
#      subnet_address_prefix = "$${primary_bastion_subnet_address_prefix}"
#      bastion_host = {
#        name  = "$${primary_bastion_host_name}"
        /*zones = "$${starter_location_01_availability_zones}"*/
#      }
#      bastion_public_ip = {
#        name  = "$${primary_bastion_host_public_ip_name}"
#        zones = "$${starter_location_01_availability_zones}"
#      }
#    }
#    side_car_virtual_network = {
#      enabled       = "$${primary_sidecar_virtual_network_enabled}"
#      name          = "$${primary_sidecar_virtual_network_name}"
#      address_space = ["$${primary_side_car_virtual_network_address_space}"]
#    }
#  }
#}