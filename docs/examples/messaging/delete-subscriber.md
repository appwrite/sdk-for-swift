import Appwrite

let client = Client()
    .setEndpoint("https://cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("&lt;YOUR_PROJECT_ID&gt;") // Your project ID
    .setJWT("&lt;YOUR_JWT&gt;") // Your secret JSON Web Token

let messaging = Messaging(client)

let result = try await messaging.deleteSubscriber(
    topicId: "<TOPIC_ID>",
    subscriberId: "<SUBSCRIBER_ID>"
)

