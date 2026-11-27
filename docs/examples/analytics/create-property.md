```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let analytics = Analytics(client)

let analyticsProperty = try await analytics.createProperty(
    propertyId: "<PROPERTY_ID>",
    name: "<NAME>",
    domain: "<DOMAIN>", // optional
    enabled: false, // optional
    allowedOrigins: [], // optional
    identifyUsers: false, // optional
    type: .web // optional
)

```
