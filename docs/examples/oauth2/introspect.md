```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let oauth2 = Oauth2(client)

let oauth2Introspection = try await oauth2.introspect(
    token: "<TOKEN>",
    tokenTypeHint: "access_token", // optional
    clientId: "<CLIENT_ID>", // optional
    clientSecret: "<CLIENT_SECRET>" // optional
)

```
