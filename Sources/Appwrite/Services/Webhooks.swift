import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// 
open class Webhooks: Service {

    ///
    /// Get a list of all webhooks belonging to the project. You can use the query
    /// params to filter your results.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.WebhookList
    ///
    open func list(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.WebhookList {
        let apiPath: String = "/webhooks"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.WebhookList = { response in
            return AppwriteModels.WebhookList.from(map: response as! [String: Any])
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
    /// Create a new webhook. Use this endpoint to configure a URL that will
    /// receive events from Appwrite when specific events occur.
    ///
    /// - Parameters:
    ///   - webhookId: String
    ///   - url: String
    ///   - name: String
    ///   - events: [String]
    ///   - enabled: Bool (optional)
    ///   - tls: Bool (optional)
    ///   - authUsername: String (optional)
    ///   - authPassword: String (optional)
    ///   - secret: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Webhook
    ///
    open func create(
        webhookId: String,
        url: String,
        name: String,
        events: [String],
        enabled: Bool? = nil,
        tls: Bool? = nil,
        authUsername: String? = nil,
        authPassword: String? = nil,
        secret: String? = nil
    ) async throws -> AppwriteModels.Webhook {
        let apiPath: String = "/webhooks"

        let apiParams: [String: Any?] = [
            "webhookId": webhookId,
            "url": url,
            "name": name,
            "events": events,
            "enabled": enabled,
            "tls": tls,
            "authUsername": authUsername,
            "authPassword": authPassword,
            "secret": secret
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Webhook = { response in
            return AppwriteModels.Webhook.from(map: response as! [String: Any])
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
    /// Get a webhook by its unique ID. This endpoint returns details about a
    /// specific webhook configured for a project. 
    ///
    /// - Parameters:
    ///   - webhookId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Webhook
    ///
    open func get(
        webhookId: String
    ) async throws -> AppwriteModels.Webhook {
        let apiPath: String = "/webhooks/{webhookId}"
            .replacingOccurrences(of: "{webhookId}", with: webhookId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.Webhook = { response in
            return AppwriteModels.Webhook.from(map: response as! [String: Any])
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
    /// Update a webhook by its unique ID. Use this endpoint to update the URL,
    /// events, or status of an existing webhook.
    ///
    /// - Parameters:
    ///   - webhookId: String
    ///   - name: String
    ///   - url: String
    ///   - events: [String]
    ///   - enabled: Bool (optional)
    ///   - tls: Bool (optional)
    ///   - authUsername: String (optional)
    ///   - authPassword: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Webhook
    ///
    open func update(
        webhookId: String,
        name: String,
        url: String,
        events: [String],
        enabled: Bool? = nil,
        tls: Bool? = nil,
        authUsername: String? = nil,
        authPassword: String? = nil
    ) async throws -> AppwriteModels.Webhook {
        let apiPath: String = "/webhooks/{webhookId}"
            .replacingOccurrences(of: "{webhookId}", with: webhookId)

        let apiParams: [String: Any?] = [
            "name": name,
            "url": url,
            "events": events,
            "enabled": enabled,
            "tls": tls,
            "authUsername": authUsername,
            "authPassword": authPassword
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Webhook = { response in
            return AppwriteModels.Webhook.from(map: response as! [String: Any])
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
    /// Delete a webhook by its unique ID. Once deleted, the webhook will no longer
    /// receive project events. 
    ///
    /// - Parameters:
    ///   - webhookId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func delete(
        webhookId: String
    ) async throws -> Any {
        let apiPath: String = "/webhooks/{webhookId}"
            .replacingOccurrences(of: "{webhookId}", with: webhookId)

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
    /// Update the webhook signing key. This endpoint can be used to regenerate the
    /// signing key used to sign and validate payload deliveries for a specific
    /// webhook.
    ///
    /// - Parameters:
    ///   - webhookId: String
    ///   - secret: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Webhook
    ///
    open func updateSecret(
        webhookId: String,
        secret: String? = nil
    ) async throws -> AppwriteModels.Webhook {
        let apiPath: String = "/webhooks/{webhookId}/secret"
            .replacingOccurrences(of: "{webhookId}", with: webhookId)

        let apiParams: [String: Any?] = [
            "secret": secret
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Webhook = { response in
            return AppwriteModels.Webhook.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }


}
