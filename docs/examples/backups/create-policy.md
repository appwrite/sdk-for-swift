```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let backups = Backups(client)

let backupPolicy = try await backups.createPolicy(
    policyId: "<POLICY_ID>",
    services: [.databases],
    retention: 1,
    schedule: "",
    name: "<NAME>", // optional
    resourceId: "<RESOURCE_ID>", // optional
    enabled: false // optional
)

```
