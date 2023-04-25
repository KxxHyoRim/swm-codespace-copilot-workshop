// add parameters for name and location that defaults to the resourcegroup's location
param name string
param location string = resourceGroup().location

// add a resource for a app service plan
resource asplan 'Microsoft.Web/serverfarms@2021-02-01' = {
  // add name with the prefix of 'asplan-'
  name: 'asplan-${name}'
  location: location
  kind: 'linux'
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
}

resource appsvc 'Microsoft.Web/sites@2021-02-01' = {
  // add name with the prefix of 'appsvc-'
  name: 'appsvc-${name}'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: asplan.id
    siteConfig: {
      appSettings: [
        {
          name: 'key1'
          value: 'value1'
        }
      ]
    }
  }
}
