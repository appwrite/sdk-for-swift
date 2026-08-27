```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let mysql = Mysql(client)

let dedicatedDatabaseExecution = try await mysql.createExecution(
    databaseId: "<DATABASE_ID>",
    sql: "<SQL>",
    bindings: [:], // optional
    timeoutSeconds: 1 // optional
)

```
