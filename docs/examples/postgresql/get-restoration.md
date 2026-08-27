```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let postgresql = Postgresql(client)

let dedicatedDatabaseRestoration = try await postgresql.getRestoration(
    databaseId: "<DATABASE_ID>",
    restorationId: "<RESTORATION_ID>"
)

```
