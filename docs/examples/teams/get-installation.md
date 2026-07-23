```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setSession("") // The user session to authenticate with

let teams = Teams(client)

let appInstallation = try await teams.getInstallation(
    teamId: "<TEAM_ID>",
    installationId: "<INSTALLATION_ID>"
)

```
