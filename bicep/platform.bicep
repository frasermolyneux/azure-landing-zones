targetScope = 'tenant'

// Parameters
param parLocation string
param parEnvironment string
param parManagementSubscriptionId string
param parTags object

// Variables
var varLoggingResourceGroupName = 'rg-platform-logging-${parEnvironment}-${parLocation}'
var varLogAnalyticsWorkspaceName = 'log-platform-${parEnvironment}-${parLocation}'
var varAutomationAccountName = 'aa-platform-${parEnvironment}-${parLocation}'

// Platform
module managementGroups 'managementGroups/managementGroups.bicep' = {
  name: 'managementGroups'
  scope: tenant()
  params: {
    parTopLevelManagementGroupPrefix: 'alz'
    parLandingZoneMgAlzDefaultsEnable: false
    parTelemetryOptOut: true
  }
}

module customPolicyDefinitions 'policy/definitions/customPolicyDefinitions.bicep' = {
  dependsOn: [
    managementGroups
  ]
  name: 'customPolicyDefinitions'
  scope: managementGroup('alz')
  params: {
    parTelemetryOptOut: true
  }
}

module customRoleDefinitions 'customRoleDefinitions/customRoleDefinitions.bicep' = {
  dependsOn: [
    managementGroups
  ]
  name: 'customRoleDefinitions'
  scope: managementGroup('alz')
  params: {
    parAssignableScopeManagementGroupId: 'alz'
    parTelemetryOptOut: true
  }
}

module loggingResourceGroup 'resourceGroup/resourceGroup.bicep' = {
  name: 'loggingResourceGroup'
  scope: subscription(parManagementSubscriptionId)
  params: {
    parLocation: parLocation
    parResourceGroupName: varLoggingResourceGroupName
    parTags: parTags
    parTelemetryOptOut: true
  }
}

module platformLogging 'logging/logging.bicep' = {
  dependsOn: [
    loggingResourceGroup
  ]
  name: 'platformLogging'
  scope: resourceGroup(parManagementSubscriptionId, varLoggingResourceGroupName)
  params: {
    parLogAnalyticsWorkspaceName: varLogAnalyticsWorkspaceName
    parLogAnalyticsWorkspaceLocation: parLocation
    parLogAnalyticsWorkspaceLogRetentionInDays: 30
    parAutomationAccountName: varAutomationAccountName
    parAutomationAccountLocation: parLocation
    parTags: parTags
    parTelemetryOptOut: true
  }
}

module subscriptionPlacementManagement 'subscriptionPlacement/subscriptionPlacement.bicep' = {
  dependsOn: [
    managementGroups
  ]
  name: 'subscriptionPlacementManagement'
  scope: managementGroup('alz')
  params: {
    parSubscriptionIds: [
      '7760848c-794d-4a19-8cb2-52f71a21ac2b' //sub-platform-management
    ]
    parTargetManagementGroupId: managementGroups.outputs.outPlatformManagementGroupName
    parTelemetryOptOut: true
  }
}

module subscriptionPlacementConnectivity 'subscriptionPlacement/subscriptionPlacement.bicep' = {
  dependsOn: [
    managementGroups
  ]
  name: 'subscriptionPlacementConnectivity'
  scope: managementGroup('alz')
  params: {
    parSubscriptionIds: [
      'db34f572-8b71-40d6-8f99-f29a27612144' //sub-platform-connectivity
    ]
    parTargetManagementGroupId: managementGroups.outputs.outPlatformConnectivityManagementGroupName
    parTelemetryOptOut: true
  }
}

module subscriptionPlacementIdentity 'subscriptionPlacement/subscriptionPlacement.bicep' = {
  dependsOn: [
    managementGroups
  ]
  name: 'subscriptionPlacementIdentity'
  scope: managementGroup('alz')
  params: {
    parSubscriptionIds: [
      'c391a150-f992-41a6-bc81-ebc22bc64376' //sub-platform-identity
    ]
    parTargetManagementGroupId: managementGroups.outputs.outPlatformIdentityManagementGroupName
    parTelemetryOptOut: true
  }
}

module subscriptionPlacementLandingZones 'subscriptionPlacement/subscriptionPlacement.bicep' = {
  dependsOn: [
    managementGroups
  ]
  name: 'subscriptionPlacementLandingZones'
  scope: managementGroup('alz')
  params: {
    parSubscriptionIds: [
      '655da25d-da46-40c0-8e81-5debe2dcd024' //MX-Pay-As-You-Go
      '845766d6-b73f-49aa-a9f6-eaf27e20b7a8' //Pay-As-You-Go
      'f857cea2-c7c0-4aef-b6b6-0c1ed18aafde' //Personal-Pay-As-You-Go
      'd3b204ab-7c2b-47f7-8d5a-de19e85591e7' //sub-fm-geolocation-prd
      '903b6685-c12a-4703-ac54-7ec1ff15ca43' //sub-platform-strategic
      '32444f38-32f4-409f-889c-8e8aa2b5b4d1' //XI-Pay-As-You-Go
    ]
    parTargetManagementGroupId: managementGroups.outputs.outLandingZonesManagementGroupName
    parTelemetryOptOut: true
  }
}

module subscriptionPlacementSandbox 'subscriptionPlacement/subscriptionPlacement.bicep' = {
  dependsOn: [
    managementGroups
  ]
  name: 'subscriptionPlacementSandbox'
  scope: managementGroup('alz')
  params: {
    parSubscriptionIds: [
      '4ebd4bf2-7dd9-40b0-b2a4-e687ded49112' //Pay-As-You-Go Dev/Test
    ]
    parTargetManagementGroupId: managementGroups.outputs.outSandboxManagementGroupName
    parTelemetryOptOut: true
  }
}

module customPolicyAssignments 'policyAssignments/policyAssignments.bicep' = {
  dependsOn: [
    customPolicyDefinitions
  ]
  name: 'customPolicyAssignments'
  scope: managementGroup('alz')
  params: {
    parTopLevelManagementGroupPrefix: 'alz'
    parLogAnalyticsWorkspaceResourceID: platformLogging.outputs.outLogAnalyticsWorkspaceId
    parTelemetryOptOut: true
  }
}
