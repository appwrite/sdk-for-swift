```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let postgresql = Postgresql(client)

let dedicatedDatabaseBackup = try await postgresql.getBackup(
    databaseId: "<DATABASE_ID>",
    backupId: "<BACKUP_ID>"
)

```
