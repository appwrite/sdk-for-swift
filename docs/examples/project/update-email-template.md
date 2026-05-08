```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let project = Project(client)

let emailTemplate = try await project.updateEmailTemplate(
    templateId: .verification,
    locale: .af, // optional
    subject: "<SUBJECT>", // optional
    message: "<MESSAGE>", // optional
    senderName: "<SENDER_NAME>", // optional
    senderEmail: "email@example.com", // optional
    replyToEmail: "email@example.com", // optional
    replyToName: "<REPLY_TO_NAME>" // optional
)

```
