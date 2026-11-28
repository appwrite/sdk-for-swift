```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let analytics = Analytics(client)

let analyticsMetricList = try await analytics.listMetrics(
    propertyId: "<PROPERTY_ID>",
    queries: [], // optional
    interval: .oneHour, // optional
    dimensions: [.country], // optional
    propKey: "<PROP_KEY>", // optional
    dateRange: "<DATE_RANGE>", // optional
    startAt: "2020-10-15T06:38:00.000+00:00", // optional
    endAt: "2020-10-15T06:38:00.000+00:00", // optional
    limit: 1, // optional
    total: false // optional
)

```
