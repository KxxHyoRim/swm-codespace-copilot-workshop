// add target scope to subscription
targetScope = 'subscription'

param name string
param location string = 'koreacentral'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'myResourceGroup'
  location: location
}

module appsvc './resources.bicep' = {
  name: 'AppService'
  scope: rg
  params: {
    name: name
    location: location
  }
}
