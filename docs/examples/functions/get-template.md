import Appwrite

let client = Client()
    .setEndpoint("https://cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID

let functions = Functions(client)

let templateFunction = try await functions.getTemplate(
    templateId: "<TEMPLATE_ID>"
)

