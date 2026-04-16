```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let project = Project(client)

let platformWindows = try await project.updateWindowsPlatform(
    platformId: "<PLATFORM_ID>",
    name: "<NAME>",
    packageIdentifierName: "<PACKAGE_IDENTIFIER_NAME>"
)

```
