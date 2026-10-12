```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let waf = Waf(client)

let wafRuleRedirect = try await waf.createRedirectRule(
    ruleId: "<RULE_ID>",
    resourceType: "api",
    name: "<NAME>",
    location: "<LOCATION>",
    statusCode: 300,
    resourceId: "<RESOURCE_ID>", // optional
    description: "<DESCRIPTION>", // optional
    priority: -100000, // optional
    enabled: false, // optional
    conditions: [] // optional
)

```
