import Appwrite

let client = Client()
    .setEndpoint("https://cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setSession("") // The user session to authenticate with

let functions = Functions(client)

let bytes = try await functions.getDeploymentDownload(
    functionId: "<FUNCTION_ID>",
    deploymentId: "<DEPLOYMENT_ID>"
)

