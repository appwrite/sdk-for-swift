```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let project = Project(client)

let oAuth2Salesforce = try await project.updateOAuth2Salesforce(
    customerKey: "<CUSTOMER_KEY>", // optional
    customerSecret: "<CUSTOMER_SECRET>", // optional
    enabled: false // optional
)

```
