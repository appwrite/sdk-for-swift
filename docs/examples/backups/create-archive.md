```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let backups = Backups(client)

let backupArchive = try await backups.createArchive(
    services: [.databases],
    resourceId: "<RESOURCE_ID>" // optional
)

```
