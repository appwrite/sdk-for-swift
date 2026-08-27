```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let documentsDB = DocumentsDB(client)

let dedicatedDatabase = try await documentsDB.createFailover(
    databaseId: "<DATABASE_ID>",
    targetReplicaId: "<TARGET_REPLICA_ID>" // optional
)

```
