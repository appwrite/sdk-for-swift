```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let project = Project(client)

let oAuth2Paypal = try await project.updateOAuth2Paypal(
    clientId: "<CLIENT_ID>", // optional
    secretKey: "<SECRET_KEY>", // optional
    enabled: false // optional
)

```
