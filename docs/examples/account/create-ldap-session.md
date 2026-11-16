```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setSession("") // The user session to authenticate with

let account = Account(client)

let session = try await account.createLDAPSession(
    username: "<USERNAME>",
    password: "password",
    duration: 60 // optional
)

```
