targetScope = 'resourceGroup'

@description('Nombre del Storage Account. Debe ser único en todo Azure y solo puede contener letras minúsculas y números.')
param storageAccountName string

@description('Ubicación del Storage Account.')
param location string = resourceGroup().location

@description('Tipo de replicación para el Storage Account.')
param skuName string = 'Standard_LRS'

@description('Tipo de cuenta de almacenamiento.')
param kind string = 'StorageV2'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: skuName
  }
  kind: kind
  properties: {
    accessTier: 'Hot' // Puede ser 'Hot' o 'Cool'
  }
}

output storageAccountId string = storageAccount.id
output storageAccountEndpoint string = storageAccount.properties.primaryEndpoints.blob
