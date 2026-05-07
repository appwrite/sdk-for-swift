```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let project = Project(client)

let oAuth2Stripe = try await project.updateOAuth2Stripe(
    clientId: "<CLIENT_ID>", // optional
    apiSecretKey: "<API_SECRET_KEY>", // optional
    enabled: false // optional
)

```
