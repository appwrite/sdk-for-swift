import Appwrite

let client = Client()
    .setEndpoint("https://cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("5df5acd0d48c2") // Your project ID
    .setKey("919c2d18fb5d4...a2ae413da83346ad2") // Your secret API key

let messaging = Messaging(client)

let message = try await messaging.createEmail(
    messageId: "<MESSAGE_ID>",
    subject: "<SUBJECT>",
    content: "<CONTENT>",
    topics: [], // optional
    users: [], // optional
    targets: [], // optional
    cc: [], // optional
    bcc: [], // optional
    attachments: [], // optional
    draft: false, // optional
    html: false, // optional
    scheduledAt: "" // optional
)

