```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let vectorsDB = VectorsDB(client)

let embeddingList = try await vectorsDB.createTextEmbeddings(
    texts: [],
    model: .embeddinggemma // optional
)

```
