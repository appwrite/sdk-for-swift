```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let organization = Organization(client)

let escalation = try await organization.createEscalation(
    escalationId: "<ESCALATION_ID>",
    name: "<NAME>",
    steps: [
        [
            "delay": 0,
            "roles": [
                "owner"
            ]
        ],
        [
            "delay": 900,
            "roles": [
                "developer"
            ],
            "userIds": [
                "<USER_ID>"
            ]
        ]
    ],
    repeat: 1 // optional
)

```
