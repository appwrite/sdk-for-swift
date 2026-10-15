```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let embeddings = Embeddings(client)

let embeddingList = try await embeddings.createTextEmbeddings(
    texts: [
        "Appwrite helps developers build applications.",
        "Find documents with semantic search."
    ],
    model: .nomicEmbedText // optional
)

```
