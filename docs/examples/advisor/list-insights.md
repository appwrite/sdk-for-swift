```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setSession("") // The user session to authenticate with

let advisor = Advisor(client)

let insightList = try await advisor.listInsights(
    reportId: "<REPORT_ID>",
    queries: [], // optional
    total: false // optional
)

```
