```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let project = Project(client)

let oAuth2Notion = try await project.updateOAuth2Notion(
    oauthClientId: "<OAUTH_CLIENT_ID>", // optional
    oauthClientSecret: "<OAUTH_CLIENT_SECRET>", // optional
    enabled: false // optional
)

```
