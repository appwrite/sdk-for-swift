```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let project = Project(client)

let key = try await project.updateKey(
    keyId: "<KEY_ID>",
    name: "<NAME>",
    scopes: [.sessionsWrite],
    expire: "2020-10-15T06:38:00.000+00:00" // optional
)

```
