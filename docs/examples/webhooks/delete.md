```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let webhooks = Webhooks(client)

let result = try await webhooks.delete(
    webhookId: "<WEBHOOK_ID>"
)

```
