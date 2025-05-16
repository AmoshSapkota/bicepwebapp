param location string = resourceGroup().location
param appServiceName string
param appServicePlanName string
param appInsightsName string
param postgresServerName string
@secure()
param postgresAdminPassword string
param postgresDbName string

module postgresServer 'modules/postgres.bicep' = {
  name: 'deployPostgres'
  params: {
    location: location
    postgresServerName: postgresServerName
    postgresAdminPassword: postgresAdminPassword
    postgresDbName: postgresDbName
  }
}

module appService 'modules/appservices.bicep' = {
  name: 'deployAppService'
  params: {
    location: location
    appServiceName: appServiceName
    appServicePlanName: appServicePlanName
    appInsightsName: appInsightsName
  }
}
