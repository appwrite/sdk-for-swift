# Appwrite Swift SDK

![Swift Package Manager](https://img.shields.io/badge/swift%20package%20manager-23.0.0-green.svg?style=flat-square)
![License](https://img.shields.io/badge/license-BSD--3--Clause-blue.svg?style=flat-square)
![Version](https://img.shields.io/badge/api%20version-2.5.0-blue.svg?style=flat-square)
[![X Account](https://img.shields.io/badge/follow-%40appwrite-000000?logo=x&style=flat-square)](https://x.com/appwrite)
[![Discord](https://img.shields.io/discord/564160730845151244?label=discord&style=flat-square)](https://appwrite.io/discord)

**This SDK targets Appwrite server version 2.5.x as shipped on Appwrite Cloud.** Self-hosted releases can lag behind Cloud — if you run an older self-hosted build, use a matching older SDK from [previous releases](https://github.com/appwrite/sdk-for-swift/releases) when APIs differ.

 > This is the Swift SDK for integrating with Appwrite from your Swift server-side code. If you're looking for the Apple SDK you should check [appwrite/sdk-for-apple](https://github.com/appwrite/sdk-for-apple)

Appwrite is an open-source backend as a service server that abstracts and simplifies complex and repetitive development tasks behind a very simple to use REST API. Appwrite aims to help you develop your apps faster and in a more secure way. Use the Swift SDK to integrate your app with the Appwrite server to easily start interacting with all of Appwrite backend APIs and tools. For full API documentation and tutorials go to [https://appwrite.io/docs](https://appwrite.io/docs)

![Appwrite](https://github.com/appwrite/appwrite/raw/main/public/images/github.png)

## Installation

Requires Swift 6.1 or later (Xcode 16.3 or later). Supported platforms are iOS 15, macOS 12, tvOS 15 and watchOS 8 or later, plus Linux.

### Xcode

1. In Xcode, select **File > Add Package Dependencies...**
2. Enter `https://github.com/appwrite/sdk-for-swift` in the search field and select `sdk-for-swift`.
3. Choose a dependency rule, for example **Up to Next Major Version** from `23.0.0`, and click **Add Package**.
4. Add the `Appwrite` library to your app target and click **Add Package**.

### Swift Package Manager

Add the package to the dependencies in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/appwrite/sdk-for-swift", from: "23.0.0"),
],
```

Then add the `Appwrite` product to your target:

```swift
targets: [
    .target(
        name: "YourAppTarget",
        dependencies: [
            .product(name: "Appwrite", package: "sdk-for-swift"),
        ]
    ),
],
```

## Getting Started

### Init your SDK

Initialize the SDK with your Appwrite API endpoint, project ID and an API key. You can find your project ID on your project's **Settings** page in the Appwrite Console. Create an [API key](https://appwrite.io/docs/advanced/platform/api-keys) in the Console with the scopes your code needs. API keys grant access to your project's data, so only use this SDK in server-side code and never ship a key in a client app.

```swift
import Appwrite

let client = Client()
    .setEndpoint("https://<REGION>.cloud.appwrite.io/v1") // Your API endpoint
    .setProject("<PROJECT_ID>") // Your project ID
    .setKey("<API_KEY>") // Your secret API key
```

If you are self-hosting Appwrite, set the endpoint to `https://<HOSTNAME_OR_IP>/v1`. Call `.setSelfSigned()` only during development, when your server uses a self-signed SSL certificate.

### Make your first request

Once your client is initialized, create a service object and call any of its methods. Every method is `async` and `throws`. Full documentation for each method is in the [API references](https://appwrite.io/docs/references).

```swift
let users = Users(client)

let user = try await users.create(
    userId: ID.unique(),
    email: "email@example.com",
    password: "password",
    name: "Walter O'Brien"
)

print(user.name)
```

### Type safety with models

Methods that return rows, such as `listRows` and `getRow`, accept a `nestedType` parameter so you can decode each row's data into your own `Codable` type.

```swift
struct Book: Codable {
    let name: String
    let author: String
    let releaseYear: Int?
    let genre: [String]?
    let isCheckedOut: Bool
}

let tablesDB = TablesDB(client)

let result = try await tablesDB.listRows(
    databaseId: "<DATABASE_ID>",
    tableId: "<TABLE_ID>",
    nestedType: Book.self
)

for row in result.rows {
    let book = row.data
    print("\(book.name) by \(book.author)")
}
```

You can use the `appwrite types` command of the [Appwrite CLI](https://appwrite.io/docs/tooling/command-line/installation) to generate these models from your database schema. Learn more about [type generation](https://appwrite.io/docs/products/databases/type-generation).

### Working with model methods

All models provide helpers for converting data:

- `toMap()` converts a model to a dictionary, which is useful for debugging or manual data manipulation.
- `from(map:)` creates a model from a dictionary.
- Models conform to `Codable`, so you can encode them with `JSONEncoder`.

```swift
let user = try await users.get(userId: "<USER_ID>")

print(user.toMap())

let copy = User<[String: AnyCodable]>.from(map: user.toMap())

let json = try JSONEncoder().encode(user)
print(String(decoding: json, as: UTF8.self))
```

### Error handling

When a request fails, the SDK throws an `AppwriteError` with `message`, `code`, `type` and `response` properties.

```swift
do {
    let list = try await users.list()
    print(list.total)
} catch let error as AppwriteError {
    print(error.message)
    print(error.code ?? 0)
    print(error.type ?? "")
}
```

### Learn more

- [Swift quick start](https://appwrite.io/docs/quick-starts/swift)
- [Swift API references](https://appwrite.io/docs/references/cloud/server-swift/users)
- [Appwrite documentation](https://appwrite.io/docs)
- [Swift playground](https://github.com/appwrite/playground-for-swift)
- [Discord community](https://appwrite.io/discord)

## Contribution

This library is auto-generated by Appwrite custom [SDK Generator](https://github.com/appwrite/sdk-generator). To learn more about how you can help us improve this SDK, please check the [contribution guide](https://github.com/appwrite/sdk-generator/blob/main/CONTRIBUTING.md) before sending a pull-request.

## License

Please see the [BSD-3-Clause license](https://raw.githubusercontent.com/appwrite/appwrite/master/LICENSE) file for more information.