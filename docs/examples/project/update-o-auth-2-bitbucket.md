```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let project = Project(client)

let oAuth2Bitbucket = try await project.updateOAuth2Bitbucket(
    key: "<KEY>", // optional
    secret: "<SECRET>", // optional
    enabled: false // optional
)

```
