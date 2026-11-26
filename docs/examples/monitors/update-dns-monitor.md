```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let monitors = Monitors(client)

let monitor = try await monitors.updateDnsMonitor(
    monitorId: "<MONITOR_ID>",
    name: "<NAME>", // optional
    domain: "example.com", // optional
    record: .a, // optional
    resolver: "1.1.1.1", // optional
    rules: [
        Query.or([
            Query.equal("answers", value: 0),
            Query.greaterThan("latency", value: 1000)
        ])
    ], // optional
    interval: 60, // optional
    timeout: 10, // optional
    cooldown: 300, // optional
    enabled: true, // optional
    notify: [
        "owner"
    ], // optional
    severity: .info, // optional
    escalationId: "<ESCALATION_ID>" // optional
)

```
