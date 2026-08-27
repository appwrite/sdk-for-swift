```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let mysql = Mysql(client)

let dedicatedDatabaseRestoration = try await mysql.getRestoration(
    databaseId: "<DATABASE_ID>",
    restorationId: "<RESTORATION_ID>"
)

```
