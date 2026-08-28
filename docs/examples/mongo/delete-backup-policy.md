```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let mongo = Mongo(client)

let result = try await mongo.deleteBackupPolicy(
    databaseId: "<DATABASE_ID>",
    policyId: "<POLICY_ID>"
)

```
