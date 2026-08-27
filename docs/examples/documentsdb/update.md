```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let documentsDB = DocumentsDB(client)

let database = try await documentsDB.update(
    databaseId: "<DATABASE_ID>",
    name: "<NAME>",
    enabled: false, // optional
    specification: "serverless", // optional
    replicas: 0, // optional
    syncMode: "async" // optional
)

```
