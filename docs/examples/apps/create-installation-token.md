```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let apps = Apps(client)

let oauth2Token = try await apps.createInstallationToken(
    appId: "<APP_ID>",
    installationId: "<INSTALLATION_ID>"
)

```
