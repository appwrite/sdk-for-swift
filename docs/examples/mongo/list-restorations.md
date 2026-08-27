```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let mongo = Mongo(client)

let dedicatedDatabaseRestorationList = try await mongo.listRestorations(
    databaseId: "<DATABASE_ID>",
    status: "pending", // optional
    type: "backup", // optional
    limit: 1, // optional
    offset: 0 // optional
)

```
