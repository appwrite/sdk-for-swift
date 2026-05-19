```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setSession("") // The user session to authenticate with

let advisor = Advisor(client)

let report = try await advisor.getReport(
    reportId: "<REPORT_ID>"
)

```
