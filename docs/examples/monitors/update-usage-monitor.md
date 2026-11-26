```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let monitors = Monitors(client)

let monitor = try await monitors.updateUsageMonitor(
    monitorId: "<MONITOR_ID>",
    name: "<NAME>", // optional
    rules: [
        Query.greaterThan("network.outbound", value: 5000000000)
    ], // optional
    window: 3600, // optional
    cooldown: 1800, // optional
    enabled: true, // optional
    notify: [
        "owner"
    ], // optional
    severity: .info, // optional
    escalationId: "<ESCALATION_ID>" // optional
)

```
