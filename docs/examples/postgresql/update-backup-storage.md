```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let postgresql = Postgresql(client)

let dedicatedDatabaseBackupStorage = try await postgresql.updateBackupStorage(
    databaseId: "<DATABASE_ID>",
    provider: "s3",
    bucket: "<BUCKET>",
    accessKey: "<ACCESS_KEY>",
    secretKey: "<SECRET_KEY>",
    region: "<REGION>", // optional
    prefix: "<PREFIX>", // optional
    endpoint: "<ENDPOINT>" // optional
)

```
