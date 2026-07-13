```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let project = Project(client)

let project = try await project.updateSMTP(
    host: "", // optional
    port: 0, // optional
    username: "<USERNAME>", // optional
    password: "password", // optional
    senderEmail: "email@example.com", // optional
    senderName: "<SENDER_NAME>", // optional
    replyToEmail: "email@example.com", // optional
    replyToName: "<REPLY_TO_NAME>", // optional
    secure: .tls, // optional
    enabled: false // optional
)

```
