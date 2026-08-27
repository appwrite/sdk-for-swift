```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let vectorsDB = VectorsDB(client)

let documentList = try await vectorsDB.updateDocuments(
    databaseId: "<DATABASE_ID>",
    collectionId: "<COLLECTION_ID>",
    data: [:], // optional
    queries: [], // optional
    transactionId: "<TRANSACTION_ID>" // optional
)

```
