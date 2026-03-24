```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let webhooks = Webhooks(client)

let webhook = try await webhooks.create(
    webhookId: "<WEBHOOK_ID>",
    url: "",
    name: "<NAME>",
    events: [],
    enabled: false, // optional
    security: false, // optional
    httpUser: "<HTTP_USER>", // optional
    httpPass: "<HTTP_PASS>" // optional
)

```
