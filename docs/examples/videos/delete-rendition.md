```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setSession("") // The user session to authenticate with

let videos = Videos(client)

let result = try await videos.deleteRendition(
    videoId: "<VIDEO_ID>",
    renditionId: "<RENDITION_ID>"
)

```
