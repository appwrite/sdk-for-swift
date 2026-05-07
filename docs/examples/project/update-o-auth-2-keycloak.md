```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let project = Project(client)

let oAuth2Keycloak = try await project.updateOAuth2Keycloak(
    clientId: "<CLIENT_ID>", // optional
    clientSecret: "<CLIENT_SECRET>", // optional
    endpoint: "<ENDPOINT>", // optional
    realmName: "<REALM_NAME>", // optional
    enabled: false // optional
)

```
