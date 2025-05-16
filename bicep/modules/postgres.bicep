param location string
param postgresServerName string
@secure()
param postgresAdminPassword string
param postgresDbName string

resource postgresServer 'Microsoft.DBforPostgreSQL/flexibleServers@2022-12-01' = {
  name: postgresServerName
  location: location
  sku: {
    name: 'Standard_B1ms'  // example sku name, must be valid SKU
    tier: 'Burstable'       // tier can be Burstable, GeneralPurpose, MemoryOptimized
    capacity: 1
    family: 'Gen5'
  }
  properties: {
    version: '13'
    storage: {
      storageSizeGB: 32
    }
    administratorLogin: 'pgadmin'
    administratorLoginPassword: postgresAdminPassword
  }
}

resource postgresDb 'Microsoft.DBforPostgreSQL/flexibleServers/databases@2022-01-20-preview' = {
  parent: postgresServer
  name: postgresDbName
  properties: {}
}
