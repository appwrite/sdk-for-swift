```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let monitors = Monitors(client)

let monitor = try await monitors.createSmtpMonitor(
    monitorId: "<MONITOR_ID>",
    name: "<NAME>",
    host: "smtp.example.com",
    port: 587,
    tlsMode: .none, // optional
    rules: [
        Query.or([
            Query.lessThan("certificateDays", value: 14),
            Query.greaterThan("latency", value: 2000)
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
