import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let users = Users(client)

let user = try await users.create(
    userId: "<USER_ID>",
    email: "email@example.com", // optional
    phone: "+12065550100", // optional
    password: "", // optional
    name: "<NAME>" // optional
)

