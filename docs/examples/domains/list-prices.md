```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let domains = Domains(client)

let domainPricesList = try await domains.listPrices(
    domains: [],
    periodYears: 0, // optional
    registrationType: .new // optional
)

```
