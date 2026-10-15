```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setSession("") // The user session to authenticate with

let oauth2 = Oauth2(client)

let result = try await oauth2.revoke(
    token: "<TOKEN>",
    tokenTypeHint: "access_token", // optional
    clientId: "<CLIENT_ID>", // optional
    clientSecret: "<CLIENT_SECRET>" // optional
)

```
