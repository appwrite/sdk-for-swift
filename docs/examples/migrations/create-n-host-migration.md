```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let migrations = Migrations(client)

let migration = try await migrations.createNHostMigration(
    resources: [.user],
    subdomain: "<SUBDOMAIN>",
    region: "<REGION>",
    adminSecret: "<ADMIN_SECRET>",
    database: "<DATABASE>",
    username: "<USERNAME>",
    password: "password",
    port: 5432 // optional
)

```
