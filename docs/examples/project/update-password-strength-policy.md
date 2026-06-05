```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let project = Project(client)

let policyPasswordStrength = try await project.updatePasswordStrengthPolicy(
    min: 8, // optional
    uppercase: false, // optional
    lowercase: false, // optional
    number: false, // optional
    symbols: false // optional
)

```
