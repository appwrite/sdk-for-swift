```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let project = Project(client)

let videoProfile = try await project.createVideoProfile(
    profileId: "<PROFILE_ID>",
    name: "<NAME>",
    videoBitRate: 32000,
    audioBitRate: 32000,
    width: 16,
    height: 16,
    codec: .h264 // optional
)

```
