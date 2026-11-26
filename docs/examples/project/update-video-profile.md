```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let project = Project(client)

let videoProfile = try await project.updateVideoProfile(
    profileId: "<PROFILE_ID>",
    name: "<NAME>", // optional
    videoBitRate: 32000, // optional
    audioBitRate: 32000, // optional
    width: 16, // optional
    height: 16 // optional
)

```
