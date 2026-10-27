```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let migrations = Migrations(client)

let migration = try await migrations.createAppwriteMigration(
    resources: [.user],
    endpoint: "https://example.com",
    projectId: "<PROJECT_ID>",
    apiKey: "<API_KEY>",
    onDuplicate: .fail // optional
)

```
