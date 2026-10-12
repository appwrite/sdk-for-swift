```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let waf = Waf(client)

let wafRuleChallenge = try await waf.createChallengeRule(
    ruleId: "<RULE_ID>",
    resourceType: "api",
    name: "<NAME>",
    resourceId: "<RESOURCE_ID>", // optional
    description: "<DESCRIPTION>", // optional
    challengeType: "compute", // optional
    priority: -100000, // optional
    enabled: false, // optional
    conditions: [], // optional
    difficulty: 1, // optional
    ttl: 900 // optional
)

```
