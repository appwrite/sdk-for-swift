```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let vectorsDB = VectorsDB(client)

let vectorsdbCollection = try await vectorsDB.createCollection(
    databaseId: "<DATABASE_ID>",
    collectionId: "<COLLECTION_ID>",
    name: "<NAME>",
    dimension: 1,
    permissions: [Permission.read(Role.any())], // optional
    documentSecurity: false, // optional
    enabled: false // optional
)

```
