```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let postgresql = Postgresql(client)

let dedicatedDatabase = try await postgresql.deleteExtension(
    databaseId: "<DATABASE_ID>",
    extensionName: "<EXTENSION_NAME>"
)

```
