```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let mysql = Mysql(client)

let backupPolicy = try await mysql.createBackupPolicy(
    databaseId: "<DATABASE_ID>",
    policyId: "<POLICY_ID>",
    name: "<NAME>",
    schedule: "",
    retention: 1,
    type: "full", // optional
    enabled: false // optional
)

```
