```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let project = Project(client)

let oAuth2Tradeshift = try await project.updateOAuth2TradeshiftSandbox(
    oauth2ClientId: "<OAUTH2_CLIENT_ID>", // optional
    oauth2ClientSecret: "<OAUTH2_CLIENT_SECRET>", // optional
    enabled: false // optional
)

```
