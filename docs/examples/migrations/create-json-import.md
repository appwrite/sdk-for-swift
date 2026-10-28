```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let migrations = Migrations(client)

let migration = try await migrations.createJSONImport(
    bucketId: "<BUCKET_ID>",
    fileId: "<FILE_ID>",
    databaseId: "<DATABASE_ID>",
    collectionId: "<COLLECTION_ID>",
    internalFile: false, // optional
    onDuplicate: .fail // optional
)

```
