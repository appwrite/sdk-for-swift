import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("5df5acd0d48c2") // Your project ID
    .setSession("") // The user session to authenticate with

let avatars = Avatars(client)

let bytes = try await avatars.getBrowser(
    code: .avantBrowser,
    width: 0, // optional
    height: 0, // optional
    quality: 0 // optional
)

