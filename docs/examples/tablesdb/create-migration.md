```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let tablesDB = TablesDB(client)

let databaseMigration = try await tablesDB.createMigration(
    databaseId: "<DATABASE_ID>",
    specification: "s-1vcpu-1gb",
    autoCutover: false // optional
)

```
