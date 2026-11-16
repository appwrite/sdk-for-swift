```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let project = Project(client)

let result = try await project.updateMembershipPrivacyPolicy(
    userId: false, // optional
    userEmail: false, // optional
    userPhone: false, // optional
    userName: false, // optional
    userMFA: false, // optional
    userAccessedAt: false // optional
)

```
