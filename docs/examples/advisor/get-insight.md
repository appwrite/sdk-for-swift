```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setSession("") // The user session to authenticate with

let advisor = Advisor(client)

let insight = try await advisor.getInsight(
    reportId: "<REPORT_ID>",
    insightId: "<INSIGHT_ID>"
)

```
