```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setSession("") // The user session to authenticate with

let oauth2 = Oauth2(client)

let oauth2Reject = try await oauth2.reject(
    grant_id: "<GRANT_ID>"
)

```
