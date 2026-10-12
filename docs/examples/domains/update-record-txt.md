```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let domains = Domains(client)

let dnsRecord = try await domains.updateRecordTXT(
    domainId: "<DOMAIN_ID>",
    recordId: "<RECORD_ID>",
    name: "",
    value: "<VALUE>",
    ttl: 1,
    comment: "<COMMENT>" // optional
)

```
