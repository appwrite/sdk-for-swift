```swift
import Appwrite
import AppwriteEnums

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API Endpoint
    .setProject("<YOUR_PROJECT_ID>") // Your project ID
    .setKey("<YOUR_API_KEY>") // Your secret API key

let project = Project(client)

let result = try await project.updateLDAP(
    enabled: false, // optional
    hosts: [
        "ldap.example.com"
    ], // optional
    port: 636, // optional
    encryption: .none, // optional
    verification: false, // optional
    certificate: "<CERTIFICATE>", // optional
    timeout: 10, // optional
    baseDn: "ou=people,dc=example,dc=com", // optional
    bindDn: "cn=appwrite,ou=services,dc=example,dc=com", // optional
    bindPassword: "password", // optional
    userFilter: "(uid={username})", // optional
    requiredGroupDn: "cn=staff,ou=groups,dc=example,dc=com", // optional
    idAttribute: "entryUUID", // optional
    emailAttribute: "mail", // optional
    nameAttribute: "cn", // optional
    phoneAttribute: "mobile" // optional
)

```
