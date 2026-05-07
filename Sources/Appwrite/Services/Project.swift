import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Project service allows you to manage all the projects in your Appwrite server.
open class Project: Service {

    ///
    /// Delete a project.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func delete(
    ) async throws -> Any {
        let apiPath: String = "/project"

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
    /// Update properties of a specific auth method. Use this endpoint to enable or
    /// disable a method in your project. 
    ///
    /// - Parameters:
    ///   - methodId: AppwriteEnums.MethodId
    ///   - enabled: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func updateAuthMethod(
        methodId: AppwriteEnums.MethodId,
        enabled: Bool
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/project/auth-methods/{methodId}"
            .replacingOccurrences(of: "{methodId}", with: methodId.rawValue)

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
    /// You can also create an ephemeral API key if you need a short-lived key
    /// instead.
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
    /// Create a new ephemeral API key. It's recommended to have multiple API keys
    /// with strict scopes for separate functions within your project.
    /// 
    /// You can also create a standard API key if you need a longer-lived key
    /// instead.
    ///
    /// - Parameters:
    ///   - scopes: [AppwriteEnums.Scopes]
    ///   - duration: Int
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.EphemeralKey
    ///
    open func createEphemeralKey(
        scopes: [AppwriteEnums.Scopes],
        duration: Int
    ) async throws -> AppwriteModels.EphemeralKey {
        let apiPath: String = "/project/keys/ephemeral"

        let apiParams: [String: Any?] = [
            "scopes": scopes,
            "duration": duration
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.EphemeralKey = { response in
            return AppwriteModels.EphemeralKey.from(map: response as! [String: Any])
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
    /// Get a list of all mock phones in the project. This endpoint returns an
    /// array of all mock phones and their OTPs.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MockNumberList
    ///
    open func listMockPhones(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.MockNumberList {
        let apiPath: String = "/project/mock-phones"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.MockNumberList = { response in
            return AppwriteModels.MockNumberList.from(map: response as! [String: Any])
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
    /// Create a new mock phone for your project. Use this endpoint to register a
    /// mock phone number and its sign-in OTP for your testers.
    ///
    /// - Parameters:
    ///   - number: String
    ///   - otp: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MockNumber
    ///
    open func createMockPhone(
        number: String,
        otp: String
    ) async throws -> AppwriteModels.MockNumber {
        let apiPath: String = "/project/mock-phones"

        let apiParams: [String: Any?] = [
            "number": number,
            "otp": otp
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.MockNumber = { response in
            return AppwriteModels.MockNumber.from(map: response as! [String: Any])
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
    /// Get a mock phone by its unique number. This endpoint returns the mock
    /// phone's OTP.
    ///
    /// - Parameters:
    ///   - number: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MockNumber
    ///
    open func getMockPhone(
        number: String
    ) async throws -> AppwriteModels.MockNumber {
        let apiPath: String = "/project/mock-phones/{number}"
            .replacingOccurrences(of: "{number}", with: number)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.MockNumber = { response in
            return AppwriteModels.MockNumber.from(map: response as! [String: Any])
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
    /// Update a mock phone by its unique number. Use this endpoint to update the
    /// mock phone's OTP.
    ///
    /// - Parameters:
    ///   - number: String
    ///   - otp: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MockNumber
    ///
    open func updateMockPhone(
        number: String,
        otp: String
    ) async throws -> AppwriteModels.MockNumber {
        let apiPath: String = "/project/mock-phones/{number}"
            .replacingOccurrences(of: "{number}", with: number)

        let apiParams: [String: Any?] = [
            "otp": otp
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.MockNumber = { response in
            return AppwriteModels.MockNumber.from(map: response as! [String: Any])
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
    /// Delete a mock phone by its unique number. This endpoint removes the mock
    /// phone and its OTP configuration from the project.
    ///
    /// - Parameters:
    ///   - number: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteMockPhone(
        number: String
    ) async throws -> Any {
        let apiPath: String = "/project/mock-phones/{number}"
            .replacingOccurrences(of: "{number}", with: number)

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
    /// Get a list of all OAuth2 providers supported by the server, along with the
    /// project's configuration for each. Credential fields are write-only and
    /// always returned empty.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2ProviderList
    ///
    open func listOAuth2Providers(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2ProviderList {
        let apiPath: String = "/project/oauth2"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.OAuth2ProviderList = { response in
            return AppwriteModels.OAuth2ProviderList.from(map: response as! [String: Any])
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
    /// Get a single OAuth2 provider configuration. Credential fields (client
    /// secret, p8 file, key/team IDs) are write-only and always returned empty.
    ///
    /// - Parameters:
    ///   - providerId: AppwriteEnums.ProviderId
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func getOAuth2Provider(
        providerId: AppwriteEnums.ProviderId
    ) async throws -> Any {
        let apiPath: String = "/project/oauth2/:provider"

        let apiParams: [String: Any?] = [
            "providerId": providerId
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> Any = { response in
            guard let responseMap = response as? [String: Any] else {
                throw AppwriteError(message: "Expected object response when hydrating a response model")
            }
            if String(describing: responseMap["$id"] ?? "") == "github" {
                return AppwriteModels.OAuth2Github.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "discord" {
                return AppwriteModels.OAuth2Discord.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "figma" {
                return AppwriteModels.OAuth2Figma.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "dropbox" {
                return AppwriteModels.OAuth2Dropbox.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "dailymotion" {
                return AppwriteModels.OAuth2Dailymotion.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "bitbucket" {
                return AppwriteModels.OAuth2Bitbucket.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "bitly" {
                return AppwriteModels.OAuth2Bitly.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "box" {
                return AppwriteModels.OAuth2Box.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "autodesk" {
                return AppwriteModels.OAuth2Autodesk.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "google" {
                return AppwriteModels.OAuth2Google.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "zoom" {
                return AppwriteModels.OAuth2Zoom.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "zoho" {
                return AppwriteModels.OAuth2Zoho.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "yandex" {
                return AppwriteModels.OAuth2Yandex.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "x" {
                return AppwriteModels.OAuth2X.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "wordpress" {
                return AppwriteModels.OAuth2WordPress.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "twitch" {
                return AppwriteModels.OAuth2Twitch.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "stripe" {
                return AppwriteModels.OAuth2Stripe.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "spotify" {
                return AppwriteModels.OAuth2Spotify.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "slack" {
                return AppwriteModels.OAuth2Slack.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "podio" {
                return AppwriteModels.OAuth2Podio.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "notion" {
                return AppwriteModels.OAuth2Notion.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "salesforce" {
                return AppwriteModels.OAuth2Salesforce.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "yahoo" {
                return AppwriteModels.OAuth2Yahoo.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "linkedin" {
                return AppwriteModels.OAuth2Linkedin.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "disqus" {
                return AppwriteModels.OAuth2Disqus.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "amazon" {
                return AppwriteModels.OAuth2Amazon.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "etsy" {
                return AppwriteModels.OAuth2Etsy.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "facebook" {
                return AppwriteModels.OAuth2Facebook.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "tradeshiftBox" {
                return AppwriteModels.OAuth2Tradeshift.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "paypalSandbox" {
                return AppwriteModels.OAuth2Paypal.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "gitlab" {
                return AppwriteModels.OAuth2Gitlab.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "authentik" {
                return AppwriteModels.OAuth2Authentik.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "auth0" {
                return AppwriteModels.OAuth2Auth0.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "fusionauth" {
                return AppwriteModels.OAuth2FusionAuth.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "keycloak" {
                return AppwriteModels.OAuth2Keycloak.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "oidc" {
                return AppwriteModels.OAuth2Oidc.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "apple" {
                return AppwriteModels.OAuth2Apple.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "okta" {
                return AppwriteModels.OAuth2Okta.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "kick" {
                return AppwriteModels.OAuth2Kick.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "microsoft" {
                return AppwriteModels.OAuth2Microsoft.from(map: responseMap)
            }
            throw AppwriteError(message: "Unable to match response to any expected response model")
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
    /// Update the project OAuth2 Amazon configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Amazon
    ///
    open func updateOAuth2Amazon(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Amazon {
        let apiPath: String = "/project/oauth2/amazon"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Amazon = { response in
            return AppwriteModels.OAuth2Amazon.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Apple configuration.
    ///
    /// - Parameters:
    ///   - serviceId: String (optional)
    ///   - keyId: String (optional)
    ///   - teamId: String (optional)
    ///   - p8File: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Apple
    ///
    open func updateOAuth2Apple(
        serviceId: String? = nil,
        keyId: String? = nil,
        teamId: String? = nil,
        p8File: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Apple {
        let apiPath: String = "/project/oauth2/apple"

        let apiParams: [String: Any?] = [
            "serviceId": serviceId,
            "keyId": keyId,
            "teamId": teamId,
            "p8File": p8File,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Apple = { response in
            return AppwriteModels.OAuth2Apple.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Auth0 configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - endpoint: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Auth0
    ///
    open func updateOAuth2Auth0(
        clientId: String? = nil,
        clientSecret: String? = nil,
        endpoint: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Auth0 {
        let apiPath: String = "/project/oauth2/auth0"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "endpoint": endpoint,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Auth0 = { response in
            return AppwriteModels.OAuth2Auth0.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Authentik configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - endpoint: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Authentik
    ///
    open func updateOAuth2Authentik(
        clientId: String? = nil,
        clientSecret: String? = nil,
        endpoint: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Authentik {
        let apiPath: String = "/project/oauth2/authentik"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "endpoint": endpoint,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Authentik = { response in
            return AppwriteModels.OAuth2Authentik.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Autodesk configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Autodesk
    ///
    open func updateOAuth2Autodesk(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Autodesk {
        let apiPath: String = "/project/oauth2/autodesk"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Autodesk = { response in
            return AppwriteModels.OAuth2Autodesk.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Bitbucket configuration.
    ///
    /// - Parameters:
    ///   - key: String (optional)
    ///   - secret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Bitbucket
    ///
    open func updateOAuth2Bitbucket(
        key: String? = nil,
        secret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Bitbucket {
        let apiPath: String = "/project/oauth2/bitbucket"

        let apiParams: [String: Any?] = [
            "key": key,
            "secret": secret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Bitbucket = { response in
            return AppwriteModels.OAuth2Bitbucket.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Bitly configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Bitly
    ///
    open func updateOAuth2Bitly(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Bitly {
        let apiPath: String = "/project/oauth2/bitly"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Bitly = { response in
            return AppwriteModels.OAuth2Bitly.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Box configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Box
    ///
    open func updateOAuth2Box(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Box {
        let apiPath: String = "/project/oauth2/box"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Box = { response in
            return AppwriteModels.OAuth2Box.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Dailymotion configuration.
    ///
    /// - Parameters:
    ///   - apiKey: String (optional)
    ///   - apiSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Dailymotion
    ///
    open func updateOAuth2Dailymotion(
        apiKey: String? = nil,
        apiSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Dailymotion {
        let apiPath: String = "/project/oauth2/dailymotion"

        let apiParams: [String: Any?] = [
            "apiKey": apiKey,
            "apiSecret": apiSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Dailymotion = { response in
            return AppwriteModels.OAuth2Dailymotion.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Discord configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Discord
    ///
    open func updateOAuth2Discord(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Discord {
        let apiPath: String = "/project/oauth2/discord"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Discord = { response in
            return AppwriteModels.OAuth2Discord.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Disqus configuration.
    ///
    /// - Parameters:
    ///   - publicKey: String (optional)
    ///   - secretKey: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Disqus
    ///
    open func updateOAuth2Disqus(
        publicKey: String? = nil,
        secretKey: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Disqus {
        let apiPath: String = "/project/oauth2/disqus"

        let apiParams: [String: Any?] = [
            "publicKey": publicKey,
            "secretKey": secretKey,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Disqus = { response in
            return AppwriteModels.OAuth2Disqus.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Dropbox configuration.
    ///
    /// - Parameters:
    ///   - appKey: String (optional)
    ///   - appSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Dropbox
    ///
    open func updateOAuth2Dropbox(
        appKey: String? = nil,
        appSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Dropbox {
        let apiPath: String = "/project/oauth2/dropbox"

        let apiParams: [String: Any?] = [
            "appKey": appKey,
            "appSecret": appSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Dropbox = { response in
            return AppwriteModels.OAuth2Dropbox.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Etsy configuration.
    ///
    /// - Parameters:
    ///   - keyString: String (optional)
    ///   - sharedSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Etsy
    ///
    open func updateOAuth2Etsy(
        keyString: String? = nil,
        sharedSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Etsy {
        let apiPath: String = "/project/oauth2/etsy"

        let apiParams: [String: Any?] = [
            "keyString": keyString,
            "sharedSecret": sharedSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Etsy = { response in
            return AppwriteModels.OAuth2Etsy.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Facebook configuration.
    ///
    /// - Parameters:
    ///   - appId: String (optional)
    ///   - appSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Facebook
    ///
    open func updateOAuth2Facebook(
        appId: String? = nil,
        appSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Facebook {
        let apiPath: String = "/project/oauth2/facebook"

        let apiParams: [String: Any?] = [
            "appId": appId,
            "appSecret": appSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Facebook = { response in
            return AppwriteModels.OAuth2Facebook.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Figma configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Figma
    ///
    open func updateOAuth2Figma(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Figma {
        let apiPath: String = "/project/oauth2/figma"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Figma = { response in
            return AppwriteModels.OAuth2Figma.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 FusionAuth configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - endpoint: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2FusionAuth
    ///
    open func updateOAuth2FusionAuth(
        clientId: String? = nil,
        clientSecret: String? = nil,
        endpoint: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2FusionAuth {
        let apiPath: String = "/project/oauth2/fusionauth"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "endpoint": endpoint,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2FusionAuth = { response in
            return AppwriteModels.OAuth2FusionAuth.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 GitHub configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Github
    ///
    open func updateOAuth2GitHub(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Github {
        let apiPath: String = "/project/oauth2/github"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Github = { response in
            return AppwriteModels.OAuth2Github.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Gitlab configuration.
    ///
    /// - Parameters:
    ///   - applicationId: String (optional)
    ///   - secret: String (optional)
    ///   - endpoint: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Gitlab
    ///
    open func updateOAuth2Gitlab(
        applicationId: String? = nil,
        secret: String? = nil,
        endpoint: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Gitlab {
        let apiPath: String = "/project/oauth2/gitlab"

        let apiParams: [String: Any?] = [
            "applicationId": applicationId,
            "secret": secret,
            "endpoint": endpoint,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Gitlab = { response in
            return AppwriteModels.OAuth2Gitlab.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Google configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Google
    ///
    open func updateOAuth2Google(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Google {
        let apiPath: String = "/project/oauth2/google"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Google = { response in
            return AppwriteModels.OAuth2Google.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Keycloak configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - endpoint: String (optional)
    ///   - realmName: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Keycloak
    ///
    open func updateOAuth2Keycloak(
        clientId: String? = nil,
        clientSecret: String? = nil,
        endpoint: String? = nil,
        realmName: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Keycloak {
        let apiPath: String = "/project/oauth2/keycloak"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "endpoint": endpoint,
            "realmName": realmName,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Keycloak = { response in
            return AppwriteModels.OAuth2Keycloak.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Kick configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Kick
    ///
    open func updateOAuth2Kick(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Kick {
        let apiPath: String = "/project/oauth2/kick"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Kick = { response in
            return AppwriteModels.OAuth2Kick.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Linkedin configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - primaryClientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Linkedin
    ///
    open func updateOAuth2Linkedin(
        clientId: String? = nil,
        primaryClientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Linkedin {
        let apiPath: String = "/project/oauth2/linkedin"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "primaryClientSecret": primaryClientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Linkedin = { response in
            return AppwriteModels.OAuth2Linkedin.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Microsoft configuration.
    ///
    /// - Parameters:
    ///   - applicationId: String (optional)
    ///   - applicationSecret: String (optional)
    ///   - tenant: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Microsoft
    ///
    open func updateOAuth2Microsoft(
        applicationId: String? = nil,
        applicationSecret: String? = nil,
        tenant: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Microsoft {
        let apiPath: String = "/project/oauth2/microsoft"

        let apiParams: [String: Any?] = [
            "applicationId": applicationId,
            "applicationSecret": applicationSecret,
            "tenant": tenant,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Microsoft = { response in
            return AppwriteModels.OAuth2Microsoft.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Notion configuration.
    ///
    /// - Parameters:
    ///   - oauthClientId: String (optional)
    ///   - oauthClientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Notion
    ///
    open func updateOAuth2Notion(
        oauthClientId: String? = nil,
        oauthClientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Notion {
        let apiPath: String = "/project/oauth2/notion"

        let apiParams: [String: Any?] = [
            "oauthClientId": oauthClientId,
            "oauthClientSecret": oauthClientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Notion = { response in
            return AppwriteModels.OAuth2Notion.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Oidc configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - wellKnownURL: String (optional)
    ///   - authorizationURL: String (optional)
    ///   - tokenURL: String (optional)
    ///   - userInfoURL: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Oidc
    ///
    open func updateOAuth2Oidc(
        clientId: String? = nil,
        clientSecret: String? = nil,
        wellKnownURL: String? = nil,
        authorizationURL: String? = nil,
        tokenURL: String? = nil,
        userInfoURL: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Oidc {
        let apiPath: String = "/project/oauth2/oidc"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "wellKnownURL": wellKnownURL,
            "authorizationURL": authorizationURL,
            "tokenURL": tokenURL,
            "userInfoURL": userInfoURL,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Oidc = { response in
            return AppwriteModels.OAuth2Oidc.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Okta configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - domain: String (optional)
    ///   - authorizationServerId: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Okta
    ///
    open func updateOAuth2Okta(
        clientId: String? = nil,
        clientSecret: String? = nil,
        domain: String? = nil,
        authorizationServerId: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Okta {
        let apiPath: String = "/project/oauth2/okta"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "domain": domain,
            "authorizationServerId": authorizationServerId,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Okta = { response in
            return AppwriteModels.OAuth2Okta.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Paypal configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - secretKey: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Paypal
    ///
    open func updateOAuth2Paypal(
        clientId: String? = nil,
        secretKey: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Paypal {
        let apiPath: String = "/project/oauth2/paypal"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "secretKey": secretKey,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Paypal = { response in
            return AppwriteModels.OAuth2Paypal.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 PaypalSandbox configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - secretKey: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Paypal
    ///
    open func updateOAuth2PaypalSandbox(
        clientId: String? = nil,
        secretKey: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Paypal {
        let apiPath: String = "/project/oauth2/paypalSandbox"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "secretKey": secretKey,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Paypal = { response in
            return AppwriteModels.OAuth2Paypal.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Podio configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Podio
    ///
    open func updateOAuth2Podio(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Podio {
        let apiPath: String = "/project/oauth2/podio"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Podio = { response in
            return AppwriteModels.OAuth2Podio.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Salesforce configuration.
    ///
    /// - Parameters:
    ///   - customerKey: String (optional)
    ///   - customerSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Salesforce
    ///
    open func updateOAuth2Salesforce(
        customerKey: String? = nil,
        customerSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Salesforce {
        let apiPath: String = "/project/oauth2/salesforce"

        let apiParams: [String: Any?] = [
            "customerKey": customerKey,
            "customerSecret": customerSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Salesforce = { response in
            return AppwriteModels.OAuth2Salesforce.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Slack configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Slack
    ///
    open func updateOAuth2Slack(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Slack {
        let apiPath: String = "/project/oauth2/slack"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Slack = { response in
            return AppwriteModels.OAuth2Slack.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Spotify configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Spotify
    ///
    open func updateOAuth2Spotify(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Spotify {
        let apiPath: String = "/project/oauth2/spotify"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Spotify = { response in
            return AppwriteModels.OAuth2Spotify.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Stripe configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - apiSecretKey: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Stripe
    ///
    open func updateOAuth2Stripe(
        clientId: String? = nil,
        apiSecretKey: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Stripe {
        let apiPath: String = "/project/oauth2/stripe"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "apiSecretKey": apiSecretKey,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Stripe = { response in
            return AppwriteModels.OAuth2Stripe.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Tradeshift configuration.
    ///
    /// - Parameters:
    ///   - oauth2ClientId: String (optional)
    ///   - oauth2ClientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Tradeshift
    ///
    open func updateOAuth2Tradeshift(
        oauth2ClientId: String? = nil,
        oauth2ClientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Tradeshift {
        let apiPath: String = "/project/oauth2/tradeshift"

        let apiParams: [String: Any?] = [
            "oauth2ClientId": oauth2ClientId,
            "oauth2ClientSecret": oauth2ClientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Tradeshift = { response in
            return AppwriteModels.OAuth2Tradeshift.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Tradeshift Sandbox configuration.
    ///
    /// - Parameters:
    ///   - oauth2ClientId: String (optional)
    ///   - oauth2ClientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Tradeshift
    ///
    open func updateOAuth2TradeshiftSandbox(
        oauth2ClientId: String? = nil,
        oauth2ClientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Tradeshift {
        let apiPath: String = "/project/oauth2/tradeshiftBox"

        let apiParams: [String: Any?] = [
            "oauth2ClientId": oauth2ClientId,
            "oauth2ClientSecret": oauth2ClientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Tradeshift = { response in
            return AppwriteModels.OAuth2Tradeshift.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Twitch configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Twitch
    ///
    open func updateOAuth2Twitch(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Twitch {
        let apiPath: String = "/project/oauth2/twitch"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Twitch = { response in
            return AppwriteModels.OAuth2Twitch.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 WordPress configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2WordPress
    ///
    open func updateOAuth2WordPress(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2WordPress {
        let apiPath: String = "/project/oauth2/wordpress"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2WordPress = { response in
            return AppwriteModels.OAuth2WordPress.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 X configuration.
    ///
    /// - Parameters:
    ///   - customerKey: String (optional)
    ///   - secretKey: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2X
    ///
    open func updateOAuth2X(
        customerKey: String? = nil,
        secretKey: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2X {
        let apiPath: String = "/project/oauth2/x"

        let apiParams: [String: Any?] = [
            "customerKey": customerKey,
            "secretKey": secretKey,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2X = { response in
            return AppwriteModels.OAuth2X.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Yahoo configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Yahoo
    ///
    open func updateOAuth2Yahoo(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Yahoo {
        let apiPath: String = "/project/oauth2/yahoo"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Yahoo = { response in
            return AppwriteModels.OAuth2Yahoo.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Yandex configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Yandex
    ///
    open func updateOAuth2Yandex(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Yandex {
        let apiPath: String = "/project/oauth2/yandex"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Yandex = { response in
            return AppwriteModels.OAuth2Yandex.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Zoho configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Zoho
    ///
    open func updateOAuth2Zoho(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Zoho {
        let apiPath: String = "/project/oauth2/zoho"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Zoho = { response in
            return AppwriteModels.OAuth2Zoho.from(map: response as! [String: Any])
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
    /// Update the project OAuth2 Zoom configuration.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.OAuth2Zoom
    ///
    open func updateOAuth2Zoom(
        clientId: String? = nil,
        clientSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.OAuth2Zoom {
        let apiPath: String = "/project/oauth2/zoom"

        let apiParams: [String: Any?] = [
            "clientId": clientId,
            "clientSecret": clientSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.OAuth2Zoom = { response in
            return AppwriteModels.OAuth2Zoom.from(map: response as! [String: Any])
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
            guard let responseMap = response as? [String: Any] else {
                throw AppwriteError(message: "Expected object response when hydrating a response model")
            }
            if String(describing: responseMap["type"] ?? "") == "web" {
                return AppwriteModels.PlatformWeb.from(map: responseMap)
            }
            if String(describing: responseMap["type"] ?? "") == "apple" {
                return AppwriteModels.PlatformApple.from(map: responseMap)
            }
            if String(describing: responseMap["type"] ?? "") == "android" {
                return AppwriteModels.PlatformAndroid.from(map: responseMap)
            }
            if String(describing: responseMap["type"] ?? "") == "windows" {
                return AppwriteModels.PlatformWindows.from(map: responseMap)
            }
            if String(describing: responseMap["type"] ?? "") == "linux" {
                return AppwriteModels.PlatformLinux.from(map: responseMap)
            }
            throw AppwriteError(message: "Unable to match response to any expected response model")
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
    /// Get a list of all project policies and their current configuration.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.PolicyList
    ///
    open func listPolicies(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.PolicyList {
        let apiPath: String = "/project/policies"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.PolicyList = { response in
            return AppwriteModels.PolicyList.from(map: response as! [String: Any])
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
    /// Updating this policy allows you to control if team members can see other
    /// members information. When enabled, all team members can see ID, name,
    /// email, phone number, and MFA status of other members..
    ///
    /// - Parameters:
    ///   - userId: Bool (optional)
    ///   - userEmail: Bool (optional)
    ///   - userPhone: Bool (optional)
    ///   - userName: Bool (optional)
    ///   - userMFA: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func updateMembershipPrivacyPolicy(
        userId: Bool? = nil,
        userEmail: Bool? = nil,
        userPhone: Bool? = nil,
        userName: Bool? = nil,
        userMFA: Bool? = nil
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/project/policies/membership-privacy"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "userEmail": userEmail,
            "userPhone": userPhone,
            "userName": userName,
            "userMFA": userMFA
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
    /// Updating this policy allows you to control if new passwords are checked
    /// against most common passwords dictionary. When enabled, and user changes
    /// their password, password must not be contained in the dictionary.
    ///
    /// - Parameters:
    ///   - enabled: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func updatePasswordDictionaryPolicy(
        enabled: Bool
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/project/policies/password-dictionary"

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
    /// Updates one of password strength policies. Based on total length
    /// configured, previous password hashes are stored, and users cannot choose a
    /// new password that is already stored in the passwird history list, when
    /// updating an user password, or setting new one through password recovery.
    /// 
    /// Keep in mind, while password history policy is disabled, the history is not
    /// being stored. Enabling the policy will not have any history on existing
    /// users, and it will only start to collect and enforce the policy on password
    /// changes since the policy is enabled.
    ///
    /// - Parameters:
    ///   - total: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func updatePasswordHistoryPolicy(
        total: Int? = nil
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/project/policies/password-history"

        let apiParams: [String: Any?] = [
            "total": total
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
    /// Updating this policy allows you to control if password strength is checked
    /// against personal data. When enabled, and user sets or changes their
    /// password, the password must not contain user ID, name, email or phone
    /// number.
    ///
    /// - Parameters:
    ///   - enabled: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func updatePasswordPersonalDataPolicy(
        enabled: Bool
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/project/policies/password-personal-data"

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
    /// Updating this policy allows you to control if email alert is sent upon
    /// session creation. When enabled, and user signs into their account, they
    /// will be sent an email notification. There is an exception, the first
    /// session after a new sign up does not trigger an alert, even if the policy
    /// is enabled.
    ///
    /// - Parameters:
    ///   - enabled: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func updateSessionAlertPolicy(
        enabled: Bool
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/project/policies/session-alert"

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
    /// Update maximum duration how long sessions created within a project should
    /// stay active for.
    ///
    /// - Parameters:
    ///   - duration: Int
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func updateSessionDurationPolicy(
        duration: Int
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/project/policies/session-duration"

        let apiParams: [String: Any?] = [
            "duration": duration
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
    /// Updating this policy allows you to control if existing sessions should be
    /// invalidated when a password of a user is changed. When enabled, and user
    /// changes their password, they will be logged out of all their devices.
    ///
    /// - Parameters:
    ///   - enabled: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func updateSessionInvalidationPolicy(
        enabled: Bool
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/project/policies/session-invalidation"

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
    /// Update the maximum number of sessions allowed per user. When the limit is
    /// hit, the oldest session will be deleted to make room for new one.
    ///
    /// - Parameters:
    ///   - total: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func updateSessionLimitPolicy(
        total: Int? = nil
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/project/policies/session-limit"

        let apiParams: [String: Any?] = [
            "total": total
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
    /// Update the maximum number of users in the project. When the limit is hit or
    /// amount of existing users already exceeded the limit, all users remain
    /// active, but new user sign up will be prohibited.
    ///
    /// - Parameters:
    ///   - total: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func updateUserLimitPolicy(
        total: Int? = nil
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/project/policies/user-limit"

        let apiParams: [String: Any?] = [
            "total": total
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
    /// Get a policy by its unique ID. This endpoint returns the current
    /// configuration for the requested project policy.
    ///
    /// - Parameters:
    ///   - policyId: AppwriteEnums.PolicyId
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func getPolicy(
        policyId: AppwriteEnums.PolicyId
    ) async throws -> Any {
        let apiPath: String = "/project/policies/{policyId}"
            .replacingOccurrences(of: "{policyId}", with: policyId.rawValue)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> Any = { response in
            guard let responseMap = response as? [String: Any] else {
                throw AppwriteError(message: "Expected object response when hydrating a response model")
            }
            if String(describing: responseMap["$id"] ?? "") == "password-dictionary" {
                return AppwriteModels.PolicyPasswordDictionary.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "password-history" {
                return AppwriteModels.PolicyPasswordHistory.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "password-personal-data" {
                return AppwriteModels.PolicyPasswordPersonalData.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "session-alert" {
                return AppwriteModels.PolicySessionAlert.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "session-duration" {
                return AppwriteModels.PolicySessionDuration.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "session-invalidation" {
                return AppwriteModels.PolicySessionInvalidation.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "session-limit" {
                return AppwriteModels.PolicySessionLimit.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "user-limit" {
                return AppwriteModels.PolicyUserLimit.from(map: responseMap)
            }
            if String(describing: responseMap["$id"] ?? "") == "membership-privacy" {
                return AppwriteModels.PolicyMembershipPrivacy.from(map: responseMap)
            }
            throw AppwriteError(message: "Unable to match response to any expected response model")
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
    /// Update properties of a specific protocol. Use this endpoint to enable or
    /// disable a protocol in your project. 
    ///
    /// - Parameters:
    ///   - protocolId: AppwriteEnums.ProtocolId
    ///   - enabled: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func updateProtocol(
        protocolId: AppwriteEnums.ProtocolId,
        enabled: Bool
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/project/protocols/{protocolId}"
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
    /// Update properties of a specific service. Use this endpoint to enable or
    /// disable a service in your project. 
    ///
    /// - Parameters:
    ///   - serviceId: AppwriteEnums.ServiceId
    ///   - enabled: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func updateService(
        serviceId: AppwriteEnums.ServiceId,
        enabled: Bool
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/project/services/{serviceId}"
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
    /// Update the SMTP configuration for your project. Use this endpoint to
    /// configure your project's SMTP provider with your custom settings for
    /// sending transactional emails.
    ///
    /// - Parameters:
    ///   - host: String (optional)
    ///   - port: Int (optional)
    ///   - username: String (optional)
    ///   - password: String (optional)
    ///   - senderEmail: String (optional)
    ///   - senderName: String (optional)
    ///   - replyToEmail: String (optional)
    ///   - replyToName: String (optional)
    ///   - secure: AppwriteEnums.Secure (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func updateSMTP(
        host: String? = nil,
        port: Int? = nil,
        username: String? = nil,
        password: String? = nil,
        senderEmail: String? = nil,
        senderName: String? = nil,
        replyToEmail: String? = nil,
        replyToName: String? = nil,
        secure: AppwriteEnums.Secure? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/project/smtp"

        let apiParams: [String: Any?] = [
            "host": host,
            "port": port,
            "username": username,
            "password": password,
            "senderEmail": senderEmail,
            "senderName": senderName,
            "replyToEmail": replyToEmail,
            "replyToName": replyToName,
            "secure": secure,
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
    /// Send a test email to verify SMTP configuration. 
    ///
    /// - Parameters:
    ///   - emails: [String]
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func createSMTPTest(
        emails: [String]
    ) async throws -> Any {
        let apiPath: String = "/project/smtp/tests"

        let apiParams: [String: Any?] = [
            "emails": emails
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Get a list of all custom email templates configured for the project. This
    /// endpoint returns an array of all configured email templates and their
    /// locales.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.EmailTemplateList
    ///
    open func listEmailTemplates(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.EmailTemplateList {
        let apiPath: String = "/project/templates/email"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.EmailTemplateList = { response in
            return AppwriteModels.EmailTemplateList.from(map: response as! [String: Any])
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
    /// Update a custom email template for the specified locale and type. Use this
    /// endpoint to modify the content of your email templates.
    ///
    /// - Parameters:
    ///   - templateId: AppwriteEnums.EmailTemplateType
    ///   - locale: AppwriteEnums.EmailTemplateLocale (optional)
    ///   - subject: String (optional)
    ///   - message: String (optional)
    ///   - senderName: String (optional)
    ///   - senderEmail: String (optional)
    ///   - replyToEmail: String (optional)
    ///   - replyToName: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.EmailTemplate
    ///
    open func updateEmailTemplate(
        templateId: AppwriteEnums.EmailTemplateType,
        locale: AppwriteEnums.EmailTemplateLocale? = nil,
        subject: String? = nil,
        message: String? = nil,
        senderName: String? = nil,
        senderEmail: String? = nil,
        replyToEmail: String? = nil,
        replyToName: String? = nil
    ) async throws -> AppwriteModels.EmailTemplate {
        let apiPath: String = "/project/templates/email"

        let apiParams: [String: Any?] = [
            "templateId": templateId,
            "locale": locale,
            "subject": subject,
            "message": message,
            "senderName": senderName,
            "senderEmail": senderEmail,
            "replyToEmail": replyToEmail,
            "replyToName": replyToName
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.EmailTemplate = { response in
            return AppwriteModels.EmailTemplate.from(map: response as! [String: Any])
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
    /// Get a custom email template for the specified locale and type. This
    /// endpoint returns the template content, subject, and other configuration
    /// details.
    ///
    /// - Parameters:
    ///   - templateId: AppwriteEnums.EmailTemplateType
    ///   - locale: AppwriteEnums.EmailTemplateLocale (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.EmailTemplate
    ///
    open func getEmailTemplate(
        templateId: AppwriteEnums.EmailTemplateType,
        locale: AppwriteEnums.EmailTemplateLocale? = nil
    ) async throws -> AppwriteModels.EmailTemplate {
        let apiPath: String = "/project/templates/email/{templateId}"
            .replacingOccurrences(of: "{templateId}", with: templateId.rawValue)

        let apiParams: [String: Any?] = [
            "locale": locale
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.EmailTemplate = { response in
            return AppwriteModels.EmailTemplate.from(map: response as! [String: Any])
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
