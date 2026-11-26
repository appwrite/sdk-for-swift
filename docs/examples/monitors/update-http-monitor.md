```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let monitors = Monitors(client)

let monitor = try await monitors.updateHttpMonitor(
    monitorId: "<MONITOR_ID>",
    name: "<NAME>", // optional
    url: "https://api.example.com/health", // optional
    method: .gET, // optional
    headers: [
        "Authorization": "Bearer <TOKEN>"
    ], // optional
    body: "<BODY>", // optional
    rules: [
        Query.or([
            Query.notBetween("statusCode", start: 200, end: 299),
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
