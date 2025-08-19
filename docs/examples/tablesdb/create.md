import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let tablesDb = TablesDb(client)

let database = try await tablesDb.create(
    databaseId: "<DATABASE_ID>",
    name: "<NAME>",
    enabled: false, // optional
    type: .tablesdb // optional
)

