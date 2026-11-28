```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let analytics = Analytics(client)

let analyticsAnnotation = try await analytics.getAnnotation(
    propertyId: "<PROPERTY_ID>",
    annotationId: "<ANNOTATION_ID>"
)

```
