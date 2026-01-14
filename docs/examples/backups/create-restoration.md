import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let backups = Backups(client)

let backupRestoration = try await backups.createRestoration(
    archiveId: "<ARCHIVE_ID>",
    services: [],
    newResourceId: "<NEW_RESOURCE_ID>", // optional
    newResourceName: "<NEW_RESOURCE_NAME>" // optional
)

