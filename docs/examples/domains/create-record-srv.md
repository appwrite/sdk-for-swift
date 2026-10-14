```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let domains = Domains(client)

let dnsRecord = try await domains.createRecordSRV(
    domainId: "<DOMAIN_ID>",
    name: "",
    value: "<VALUE>",
    ttl: 1,
    priority: 0,
    weight: 0,
    port: 0,
    comment: "<COMMENT>" // optional
)

```
