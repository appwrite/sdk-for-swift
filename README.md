# Appwrite Swift SDK

![Swift Package Manager](https://img.shields.io/github/v/release/appwrite/sdk-for-swift.svg?color=green&style=flat-square)
![License](https://img.shields.io/github/license/appwrite/sdk-for-swift.svg?style=flat-square)
![Version](https://img.shields.io/badge/api%20version-1.6.2-blue.svg?style=flat-square)
[![Build Status](https://img.shields.io/travis/com/appwrite/sdk-generator?style=flat-square)](https://travis-ci.com/appwrite/sdk-generator)
[![Twitter Account](https://img.shields.io/twitter/follow/appwrite?color=00acee&label=twitter&style=flat-square)](https://twitter.com/appwrite)
[![Discord](https://img.shields.io/discord/564160730845151244?label=discord&style=flat-square)](https://appwrite.io/discord)

**This SDK is compatible with Appwrite server version 1.6.x. For older versions, please check [previous releases](https://github.com/appwrite/sdk-for-swift/releases).**

 > This is the Swift SDK for integrating with Appwrite from your Swift server-side code. If you're looking for the Apple SDK you should check [appwrite/sdk-for-apple](https://github.com/appwrite/sdk-for-apple)

Appwrite is an open-source backend as a service server that abstract and simplify complex and repetitive development tasks behind a very simple to use REST API. Appwrite aims to help you develop your apps faster and in a more secure way. Use the Swift SDK to integrate your app with the Appwrite server to easily start interacting with all of Appwrite backend APIs and tools. For full API documentation and tutorials go to [https://appwrite.io/docs](https://appwrite.io/docs)

![Appwrite](https://github.com/appwrite/appwrite/raw/main/public/images/github.png)

## Installation

### Xcode with Swift Package Manager

The Appwrite Swift SDK is available via Swift Package Manager. In order to use the Appwrite Swift SDK from Xcode, select File > **Add Packages**

In the dialog that appears, enter the Appwrite Swift SDK [package URL](git@github.com:appwrite/sdk-for-swift.git) in the search field. Once found, select `sdk-for-apple`.

On the right, select your version rules and ensure your desired target is selected in the **Add to Project** field.

Now click add package and you're done!

### Swift Package Manager

Add the package to your `Package.swift` dependencies:

```swift
    dependencies: [
        .package(url: "git@github.com:appwrite/sdk-for-swift.git", from: "9.0.0"),
    ],
```

Then add it to your target:

```swift
    targets: [
        .target(
            name: "YourAppTarget",
            dependencies: [
                .product(name: "", package: "sdk-for-swift")
            ]
        ),
```


## Getting Started

### Init your SDK

Initialize your SDK with your Appwrite server API endpoint and project ID which can be found in your project settings page and your new API secret Key project API keys section.

```swift
import Appwrite

func main() {
    let client = Client()
        .setEndpoint("https://[HOSTNAME_OR_IP]/v1") // Your API Endpoint
        .setProject("5df5acd0d48c2") // Your project ID
        .setKey("919c2d184...a2ae413dad2") // Your secret API key
        .setSelfSigned() // Use only on dev mode with a self-signed SSL cert
}
```

### Make Your First Request

Once your SDK object is initialized, create any of the Appwrite service objects and choose any request to send. Full documentation for any service method you would like to use can be found in your SDK documentation or in the [API References](https://appwrite.io/docs) section.

```swift
let users = Users(client)

do {
    let user = try await users.create(
        userId: ID.unique(),
        email: "email@example.com",
        phone: "+123456789",
        password: "password",
        name: "Walter O'Brien"
    )
    print(String(describing: user.toMap()))
} catch {
    print(error.localizedDescription)
}
```

### Full Example

```swift
import Appwrite

func main() {
    let client = Client()
        .setEndpoint("https://[HOSTNAME_OR_IP]/v1") // Your API Endpoint
        .setProject("5df5acd0d48c2") // Your project ID
        .setKey("919c2d18fb5d4...a2ae413da83346ad2") // Your secret API key
        .setSelfSigned() // Use only on dev mode with a self-signed SSL cert

    let users = Users(client)
    
    do {
        let user = try await users.create(
            userId: ID.unique(),
            email: "email@example.com",
            phone: "+123456789",
            password: "password",
            name: "Walter O'Brien"
        )
        print(String(describing: user.toMap()))
    } catch {
        print(error.localizedDescription)
    }
}
```

### Error Handling

When an error occurs, the Appwrite Swift SDK throws an `AppwriteError` object with `message` and `code` properties. You can handle any errors in a catch block and present the `message` or `localizedDescription` to the user or handle it yourself based on the provided error information. Below is an example.

```swift
import Appwrite

func main() {
    let users = Users(client)
    
    do {
        let users = try await users.list()
        print(String(describing: users.toMap()))
    } catch {
        print(error.localizedDescription)
    }
}
```

### Learn more

You can use the following resources to learn more and get help

- 🚀 [Getting Started Tutorial](https://appwrite.io/docs/getting-started-for-server)
- 📜 [Appwrite Docs](https://appwrite.io/docs)
- 💬 [Discord Community](https://appwrite.io/discord)
- 🚂 [Appwrite Swift Playground](https://github.com/appwrite/playground-for-swift-server)


## Contribution

This library is auto-generated by Appwrite custom [SDK Generator](https://github.com/appwrite/sdk-generator). To learn more about how you can help us improve this SDK, please check the [contribution guide](https://github.com/appwrite/sdk-generator/blob/master/CONTRIBUTING.md) before sending a pull-request.

## License

Please see the [BSD-3-Clause license](https://raw.githubusercontent.com/appwrite/appwrite/master/LICENSE) file for more information.