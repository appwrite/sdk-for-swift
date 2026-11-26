```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let videos = Videos(client)

let videoRendition = try await videos.createRendition(
    videoId: "<VIDEO_ID>",
    profileId: "<PROFILE_ID>",
    output: .hls
)

```
