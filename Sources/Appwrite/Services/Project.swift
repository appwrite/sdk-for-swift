import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Project service allows you to manage all the projects in your Appwrite server.
open class Project: Service {

    ///
    /// Get a list of all API keys from the current project.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.KeyList
    ///
    open func listKeys(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.KeyList {
        let apiPath: String = "/project/keys"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.KeyList = { response in
            return AppwriteModels.KeyList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create a new API key. It's recommended to have multiple API keys with
    /// strict scopes for separate functions within your project.
    ///
    /// - Parameters:
    ///   - keyId: String
    ///   - name: String
    ///   - scopes: [AppwriteEnums.Scopes]
    ///   - expire: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Key
    ///
    open func createKey(
        keyId: String,
        name: String,
        scopes: [AppwriteEnums.Scopes],
        expire: String? = nil
    ) async throws -> AppwriteModels.Key {
        let apiPath: String = "/project/keys"

        let apiParams: [String: Any?] = [
            "keyId": keyId,
            "name": name,
            "scopes": scopes,
            "expire": expire
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Key = { response in
            return AppwriteModels.Key.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Get a key by its unique ID. 
    ///
    /// - Parameters:
    ///   - keyId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Key
    ///
    open func getKey(
        keyId: String
    ) async throws -> AppwriteModels.Key {
        let apiPath: String = "/project/keys/{keyId}"
            .replacingOccurrences(of: "{keyId}", with: keyId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.Key = { response in
            return AppwriteModels.Key.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update a key by its unique ID. Use this endpoint to update the name,
    /// scopes, or expiration time of an API key.
    ///
    /// - Parameters:
    ///   - keyId: String
    ///   - name: String
    ///   - scopes: [AppwriteEnums.Scopes]
    ///   - expire: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Key
    ///
    open func updateKey(
        keyId: String,
        name: String,
        scopes: [AppwriteEnums.Scopes],
        expire: String? = nil
    ) async throws -> AppwriteModels.Key {
        let apiPath: String = "/project/keys/{keyId}"
            .replacingOccurrences(of: "{keyId}", with: keyId)

        let apiParams: [String: Any?] = [
            "name": name,
            "scopes": scopes,
            "expire": expire
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Key = { response in
            return AppwriteModels.Key.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Delete a key by its unique ID. Once deleted, the key can no longer be used
    /// to authenticate API calls.
    ///
    /// - Parameters:
    ///   - keyId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteKey(
        keyId: String
    ) async throws -> Any {
        let apiPath: String = "/project/keys/{keyId}"
            .replacingOccurrences(of: "{keyId}", with: keyId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Update the project labels. Labels can be used to easily filter projects in
    /// an organization.
    ///
    /// - Parameters:
    ///   - labels: [String]
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func updateLabels(
        labels: [String]
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/project/labels"

        let apiParams: [String: Any?] = [
            "labels": labels
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Project = { response in
            return AppwriteModels.Project.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Get a list of all platforms in the project. This endpoint returns an array
    /// of all platforms and their configurations.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.PlatformList
    ///
    open func listPlatforms(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.PlatformList {
        let apiPath: String = "/project/platforms"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.PlatformList = { response in
            return AppwriteModels.PlatformList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create a new Android platform for your project. Use this endpoint to
    /// register a new Android platform where your users will run your application
    /// which will interact with the Appwrite API.
    ///
    /// - Parameters:
    ///   - platformId: String
    ///   - name: String
    ///   - applicationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.PlatformAndroid
    ///
    open func createAndroidPlatform(
        platformId: String,
        name: String,
        applicationId: String
    ) async throws -> AppwriteModels.PlatformAndroid {
        let apiPath: String = "/project/platforms/android"

        let apiParams: [String: Any?] = [
            "platformId": platformId,
            "name": name,
            "applicationId": applicationId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.PlatformAndroid = { response in
            return AppwriteModels.PlatformAndroid.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update an Android platform by its unique ID. Use this endpoint to update
    /// the platform's name or application ID.
    ///
    /// - Parameters:
    ///   - platformId: String
    ///   - name: String
    ///   - applicationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.PlatformAndroid
    ///
    open func updateAndroidPlatform(
        platformId: String,
        name: String,
        applicationId: String
    ) async throws -> AppwriteModels.PlatformAndroid {
        let apiPath: String = "/project/platforms/android/{platformId}"
            .replacingOccurrences(of: "{platformId}", with: platformId)

        let apiParams: [String: Any?] = [
            "name": name,
            "applicationId": applicationId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.PlatformAndroid = { response in
            return AppwriteModels.PlatformAndroid.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create a new Apple platform for your project. Use this endpoint to register
    /// a new Apple platform where your users will run your application which will
    /// interact with the Appwrite API.
    ///
    /// - Parameters:
    ///   - platformId: String
    ///   - name: String
    ///   - bundleIdentifier: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.PlatformApple
    ///
    open func createApplePlatform(
        platformId: String,
        name: String,
        bundleIdentifier: String
    ) async throws -> AppwriteModels.PlatformApple {
        let apiPath: String = "/project/platforms/apple"

        let apiParams: [String: Any?] = [
            "platformId": platformId,
            "name": name,
            "bundleIdentifier": bundleIdentifier
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.PlatformApple = { response in
            return AppwriteModels.PlatformApple.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update an Apple platform by its unique ID. Use this endpoint to update the
    /// platform's name or bundle identifier.
    ///
    /// - Parameters:
    ///   - platformId: String
    ///   - name: String
    ///   - bundleIdentifier: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.PlatformApple
    ///
    open func updateApplePlatform(
        platformId: String,
        name: String,
        bundleIdentifier: String
    ) async throws -> AppwriteModels.PlatformApple {
        let apiPath: String = "/project/platforms/apple/{platformId}"
            .replacingOccurrences(of: "{platformId}", with: platformId)

        let apiParams: [String: Any?] = [
            "name": name,
            "bundleIdentifier": bundleIdentifier
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.PlatformApple = { response in
            return AppwriteModels.PlatformApple.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create a new Linux platform for your project. Use this endpoint to register
    /// a new Linux platform where your users will run your application which will
    /// interact with the Appwrite API.
    ///
    /// - Parameters:
    ///   - platformId: String
    ///   - name: String
    ///   - packageName: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.PlatformLinux
    ///
    open func createLinuxPlatform(
        platformId: String,
        name: String,
        packageName: String
    ) async throws -> AppwriteModels.PlatformLinux {
        let apiPath: String = "/project/platforms/linux"

        let apiParams: [String: Any?] = [
            "platformId": platformId,
            "name": name,
            "packageName": packageName
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.PlatformLinux = { response in
            return AppwriteModels.PlatformLinux.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update a Linux platform by its unique ID. Use this endpoint to update the
    /// platform's name or package name.
    ///
    /// - Parameters:
    ///   - platformId: String
    ///   - name: String
    ///   - packageName: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.PlatformLinux
    ///
    open func updateLinuxPlatform(
        platformId: String,
        name: String,
        packageName: String
    ) async throws -> AppwriteModels.PlatformLinux {
        let apiPath: String = "/project/platforms/linux/{platformId}"
            .replacingOccurrences(of: "{platformId}", with: platformId)

        let apiParams: [String: Any?] = [
            "name": name,
            "packageName": packageName
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.PlatformLinux = { response in
            return AppwriteModels.PlatformLinux.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create a new web platform for your project. Use this endpoint to register a
    /// new platform where your users will run your application which will interact
    /// with the Appwrite API.
    ///
    /// - Parameters:
    ///   - platformId: String
    ///   - name: String
    ///   - hostname: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.PlatformWeb
    ///
    open func createWebPlatform(
        platformId: String,
        name: String,
        hostname: String
    ) async throws -> AppwriteModels.PlatformWeb {
        let apiPath: String = "/project/platforms/web"

        let apiParams: [String: Any?] = [
            "platformId": platformId,
            "name": name,
            "hostname": hostname
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.PlatformWeb = { response in
            return AppwriteModels.PlatformWeb.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update a web platform by its unique ID. Use this endpoint to update the
    /// platform's name or hostname.
    ///
    /// - Parameters:
    ///   - platformId: String
    ///   - name: String
    ///   - hostname: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.PlatformWeb
    ///
    open func updateWebPlatform(
        platformId: String,
        name: String,
        hostname: String
    ) async throws -> AppwriteModels.PlatformWeb {
        let apiPath: String = "/project/platforms/web/{platformId}"
            .replacingOccurrences(of: "{platformId}", with: platformId)

        let apiParams: [String: Any?] = [
            "name": name,
            "hostname": hostname
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.PlatformWeb = { response in
            return AppwriteModels.PlatformWeb.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create a new Windows platform for your project. Use this endpoint to
    /// register a new Windows platform where your users will run your application
    /// which will interact with the Appwrite API.
    ///
    /// - Parameters:
    ///   - platformId: String
    ///   - name: String
    ///   - packageIdentifierName: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.PlatformWindows
    ///
    open func createWindowsPlatform(
        platformId: String,
        name: String,
        packageIdentifierName: String
    ) async throws -> AppwriteModels.PlatformWindows {
        let apiPath: String = "/project/platforms/windows"

        let apiParams: [String: Any?] = [
            "platformId": platformId,
            "name": name,
            "packageIdentifierName": packageIdentifierName
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.PlatformWindows = { response in
            return AppwriteModels.PlatformWindows.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update a Windows platform by its unique ID. Use this endpoint to update the
    /// platform's name or package identifier name.
    ///
    /// - Parameters:
    ///   - platformId: String
    ///   - name: String
    ///   - packageIdentifierName: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.PlatformWindows
    ///
    open func updateWindowsPlatform(
        platformId: String,
        name: String,
        packageIdentifierName: String
    ) async throws -> AppwriteModels.PlatformWindows {
        let apiPath: String = "/project/platforms/windows/{platformId}"
            .replacingOccurrences(of: "{platformId}", with: platformId)

        let apiParams: [String: Any?] = [
            "name": name,
            "packageIdentifierName": packageIdentifierName
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.PlatformWindows = { response in
            return AppwriteModels.PlatformWindows.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Get a platform by its unique ID. This endpoint returns the platform's
    /// details, including its name, type, and key configurations.
    ///
    /// - Parameters:
    ///   - platformId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func getPlatform(
        platformId: String
    ) async throws -> Any {
        let apiPath: String = "/project/platforms/{platformId}"
            .replacingOccurrences(of: "{platformId}", with: platformId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> Any = { response in
            return AppwriteModels.PlatformWeb.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Delete a platform by its unique ID. This endpoint removes the platform and
    /// all its configurations from the project.
    ///
    /// - Parameters:
    ///   - platformId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deletePlatform(
        platformId: String
    ) async throws -> Any {
        let apiPath: String = "/project/platforms/{platformId}"
            .replacingOccurrences(of: "{platformId}", with: platformId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Update the status of a specific protocol. Use this endpoint to enable or
    /// disable a protocol in your project. 
    ///
    /// - Parameters:
    ///   - protocolId: AppwriteEnums.ProtocolId
    ///   - enabled: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func updateProtocolStatus(
        protocolId: AppwriteEnums.ProtocolId,
        enabled: Bool
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/project/protocols/{protocolId}/status"
            .replacingOccurrences(of: "{protocolId}", with: protocolId.rawValue)

        let apiParams: [String: Any?] = [
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Project = { response in
            return AppwriteModels.Project.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update the status of a specific service. Use this endpoint to enable or
    /// disable a service in your project. 
    ///
    /// - Parameters:
    ///   - serviceId: AppwriteEnums.ServiceId
    ///   - enabled: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func updateServiceStatus(
        serviceId: AppwriteEnums.ServiceId,
        enabled: Bool
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/project/services/{serviceId}/status"
            .replacingOccurrences(of: "{serviceId}", with: serviceId.rawValue)

        let apiParams: [String: Any?] = [
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Project = { response in
            return AppwriteModels.Project.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Get a list of all project environment variables.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.VariableList
    ///
    open func listVariables(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.VariableList {
        let apiPath: String = "/project/variables"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.VariableList = { response in
            return AppwriteModels.VariableList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create a new project environment variable. These variables can be accessed
    /// by all functions and sites in the project.
    ///
    /// - Parameters:
    ///   - variableId: String
    ///   - key: String
    ///   - value: String
    ///   - secret: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Variable
    ///
    open func createVariable(
        variableId: String,
        key: String,
        value: String,
        secret: Bool? = nil
    ) async throws -> AppwriteModels.Variable {
        let apiPath: String = "/project/variables"

        let apiParams: [String: Any?] = [
            "variableId": variableId,
            "key": key,
            "value": value,
            "secret": secret
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Variable = { response in
            return AppwriteModels.Variable.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Get a variable by its unique ID. 
    ///
    /// - Parameters:
    ///   - variableId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Variable
    ///
    open func getVariable(
        variableId: String
    ) async throws -> AppwriteModels.Variable {
        let apiPath: String = "/project/variables/{variableId}"
            .replacingOccurrences(of: "{variableId}", with: variableId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.Variable = { response in
            return AppwriteModels.Variable.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update variable by its unique ID.
    ///
    /// - Parameters:
    ///   - variableId: String
    ///   - key: String (optional)
    ///   - value: String (optional)
    ///   - secret: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Variable
    ///
    open func updateVariable(
        variableId: String,
        key: String? = nil,
        value: String? = nil,
        secret: Bool? = nil
    ) async throws -> AppwriteModels.Variable {
        let apiPath: String = "/project/variables/{variableId}"
            .replacingOccurrences(of: "{variableId}", with: variableId)

        let apiParams: [String: Any?] = [
            "key": key,
            "value": value,
            "secret": secret
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Variable = { response in
            return AppwriteModels.Variable.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Delete a variable by its unique ID. 
    ///
    /// - Parameters:
    ///   - variableId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteVariable(
        variableId: String
    ) async throws -> Any {
        let apiPath: String = "/project/variables/{variableId}"
            .replacingOccurrences(of: "{variableId}", with: variableId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }


}
