```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let mongo = Mongo(client)

let dedicatedDatabaseBackupStorage = try await mongo.updateBackupStorage(
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
