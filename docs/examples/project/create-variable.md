```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let project = Project(client)

let variable = try await project.createVariable(
    variableId: "<VARIABLE_ID>",
    key: "<KEY>",
    value: "<VALUE>",
    secret: false // optional
)

```
