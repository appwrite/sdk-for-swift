```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let waf = Waf(client)

let wafRuleRateLimit = try await waf.updateRateLimitRule(
    ruleId: "<RULE_ID>",
    resourceType: "api", // optional
    resourceId: "<RESOURCE_ID>", // optional
    name: "<NAME>", // optional
    description: "<DESCRIPTION>", // optional
    limit: 1, // optional
    interval: 1, // optional
    key: "ip", // optional
    maxBucketSize: 1, // optional
    priority: -100000, // optional
    enabled: false, // optional
    conditions: [] // optional
)

```
