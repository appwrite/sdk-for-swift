```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let proxy = Proxy(client)

let proxyRule = try await proxy.createRedirectRule(
    domain: "",
    url: "https://example.com",
    statusCode: .movedPermanently301,
    resourceId: "<RESOURCE_ID>",
    resourceType: .site
)

```
