import Appwrite

let client = Client()
    .setEndpoint("https://cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("5df5acd0d48c2") // Your project ID
    .setKey("919c2d18fb5d4...a2ae413da83346ad2") // Your secret API key

let users = Users(client)

let user = try await users.create(
    userId: "<USER_ID>",
    email: "email@example.com", // optional
    phone: "+12065550100", // optional
    password: "", // optional
    name: "<NAME>" // optional
)

