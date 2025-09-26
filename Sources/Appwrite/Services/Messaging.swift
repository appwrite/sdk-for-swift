import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Messaging service allows you to send messages to any provider type (SMTP, push notification, SMS, etc.).
open class Messaging: Service {

    ///
    /// Get a list of all messages from the current Appwrite project.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MessageList
    ///
    open func listMessages(
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.MessageList {
        let apiPath: String = "/messaging/messages"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.MessageList = { response in
            return AppwriteModels.MessageList.from(map: response as! [String: Any])
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
    /// Create a new email message.
    ///
    /// - Parameters:
    ///   - messageId: String
    ///   - subject: String
    ///   - content: String
    ///   - topics: [String] (optional)
    ///   - users: [String] (optional)
    ///   - targets: [String] (optional)
    ///   - cc: [String] (optional)
    ///   - bcc: [String] (optional)
    ///   - attachments: [String] (optional)
    ///   - draft: Bool (optional)
    ///   - html: Bool (optional)
    ///   - scheduledAt: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Message
    ///
    open func createEmail(
        messageId: String,
        subject: String,
        content: String,
        topics: [String]? = nil,
        users: [String]? = nil,
        targets: [String]? = nil,
        cc: [String]? = nil,
        bcc: [String]? = nil,
        attachments: [String]? = nil,
        draft: Bool? = nil,
        html: Bool? = nil,
        scheduledAt: String? = nil
    ) async throws -> AppwriteModels.Message {
        let apiPath: String = "/messaging/messages/email"

        let apiParams: [String: Any?] = [
            "messageId": messageId,
            "subject": subject,
            "content": content,
            "topics": topics,
            "users": users,
            "targets": targets,
            "cc": cc,
            "bcc": bcc,
            "attachments": attachments,
            "draft": draft,
            "html": html,
            "scheduledAt": scheduledAt
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Message = { response in
            return AppwriteModels.Message.from(map: response as! [String: Any])
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
    /// Update an email message by its unique ID. This endpoint only works on
    /// messages that are in draft status. Messages that are already processing,
    /// sent, or failed cannot be updated.
    /// 
    ///
    /// - Parameters:
    ///   - messageId: String
    ///   - topics: [String] (optional)
    ///   - users: [String] (optional)
    ///   - targets: [String] (optional)
    ///   - subject: String (optional)
    ///   - content: String (optional)
    ///   - draft: Bool (optional)
    ///   - html: Bool (optional)
    ///   - cc: [String] (optional)
    ///   - bcc: [String] (optional)
    ///   - scheduledAt: String (optional)
    ///   - attachments: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Message
    ///
    open func updateEmail(
        messageId: String,
        topics: [String]? = nil,
        users: [String]? = nil,
        targets: [String]? = nil,
        subject: String? = nil,
        content: String? = nil,
        draft: Bool? = nil,
        html: Bool? = nil,
        cc: [String]? = nil,
        bcc: [String]? = nil,
        scheduledAt: String? = nil,
        attachments: [String]? = nil
    ) async throws -> AppwriteModels.Message {
        let apiPath: String = "/messaging/messages/email/{messageId}"
            .replacingOccurrences(of: "{messageId}", with: messageId)

        let apiParams: [String: Any?] = [
            "topics": topics,
            "users": users,
            "targets": targets,
            "subject": subject,
            "content": content,
            "draft": draft,
            "html": html,
            "cc": cc,
            "bcc": bcc,
            "scheduledAt": scheduledAt,
            "attachments": attachments
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Message = { response in
            return AppwriteModels.Message.from(map: response as! [String: Any])
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
    /// Create a new push notification.
    ///
    /// - Parameters:
    ///   - messageId: String
    ///   - title: String (optional)
    ///   - body: String (optional)
    ///   - topics: [String] (optional)
    ///   - users: [String] (optional)
    ///   - targets: [String] (optional)
    ///   - data: Any (optional)
    ///   - action: String (optional)
    ///   - image: String (optional)
    ///   - icon: String (optional)
    ///   - sound: String (optional)
    ///   - color: String (optional)
    ///   - tag: String (optional)
    ///   - badge: Int (optional)
    ///   - draft: Bool (optional)
    ///   - scheduledAt: String (optional)
    ///   - contentAvailable: Bool (optional)
    ///   - critical: Bool (optional)
    ///   - priority: MessagePriority (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Message
    ///
    open func createPush(
        messageId: String,
        title: String? = nil,
        body: String? = nil,
        topics: [String]? = nil,
        users: [String]? = nil,
        targets: [String]? = nil,
        data: Any? = nil,
        action: String? = nil,
        image: String? = nil,
        icon: String? = nil,
        sound: String? = nil,
        color: String? = nil,
        tag: String? = nil,
        badge: Int? = nil,
        draft: Bool? = nil,
        scheduledAt: String? = nil,
        contentAvailable: Bool? = nil,
        critical: Bool? = nil,
        priority: MessagePriority? = nil
    ) async throws -> AppwriteModels.Message {
        let apiPath: String = "/messaging/messages/push"

        let apiParams: [String: Any?] = [
            "messageId": messageId,
            "title": title,
            "body": body,
            "topics": topics,
            "users": users,
            "targets": targets,
            "data": data,
            "action": action,
            "image": image,
            "icon": icon,
            "sound": sound,
            "color": color,
            "tag": tag,
            "badge": badge,
            "draft": draft,
            "scheduledAt": scheduledAt,
            "contentAvailable": contentAvailable,
            "critical": critical,
            "priority": priority
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Message = { response in
            return AppwriteModels.Message.from(map: response as! [String: Any])
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
    /// Update a push notification by its unique ID. This endpoint only works on
    /// messages that are in draft status. Messages that are already processing,
    /// sent, or failed cannot be updated.
    /// 
    ///
    /// - Parameters:
    ///   - messageId: String
    ///   - topics: [String] (optional)
    ///   - users: [String] (optional)
    ///   - targets: [String] (optional)
    ///   - title: String (optional)
    ///   - body: String (optional)
    ///   - data: Any (optional)
    ///   - action: String (optional)
    ///   - image: String (optional)
    ///   - icon: String (optional)
    ///   - sound: String (optional)
    ///   - color: String (optional)
    ///   - tag: String (optional)
    ///   - badge: Int (optional)
    ///   - draft: Bool (optional)
    ///   - scheduledAt: String (optional)
    ///   - contentAvailable: Bool (optional)
    ///   - critical: Bool (optional)
    ///   - priority: MessagePriority (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Message
    ///
    open func updatePush(
        messageId: String,
        topics: [String]? = nil,
        users: [String]? = nil,
        targets: [String]? = nil,
        title: String? = nil,
        body: String? = nil,
        data: Any? = nil,
        action: String? = nil,
        image: String? = nil,
        icon: String? = nil,
        sound: String? = nil,
        color: String? = nil,
        tag: String? = nil,
        badge: Int? = nil,
        draft: Bool? = nil,
        scheduledAt: String? = nil,
        contentAvailable: Bool? = nil,
        critical: Bool? = nil,
        priority: MessagePriority? = nil
    ) async throws -> AppwriteModels.Message {
        let apiPath: String = "/messaging/messages/push/{messageId}"
            .replacingOccurrences(of: "{messageId}", with: messageId)

        let apiParams: [String: Any?] = [
            "topics": topics,
            "users": users,
            "targets": targets,
            "title": title,
            "body": body,
            "data": data,
            "action": action,
            "image": image,
            "icon": icon,
            "sound": sound,
            "color": color,
            "tag": tag,
            "badge": badge,
            "draft": draft,
            "scheduledAt": scheduledAt,
            "contentAvailable": contentAvailable,
            "critical": critical,
            "priority": priority
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Message = { response in
            return AppwriteModels.Message.from(map: response as! [String: Any])
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
    /// Create a new SMS message.
    ///
    /// - Parameters:
    ///   - messageId: String
    ///   - content: String
    ///   - topics: [String] (optional)
    ///   - users: [String] (optional)
    ///   - targets: [String] (optional)
    ///   - draft: Bool (optional)
    ///   - scheduledAt: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Message
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `Messaging.createSMS` instead.")
    open func createSms(
        messageId: String,
        content: String,
        topics: [String]? = nil,
        users: [String]? = nil,
        targets: [String]? = nil,
        draft: Bool? = nil,
        scheduledAt: String? = nil
    ) async throws -> AppwriteModels.Message {
        let apiPath: String = "/messaging/messages/sms"

        let apiParams: [String: Any?] = [
            "messageId": messageId,
            "content": content,
            "topics": topics,
            "users": users,
            "targets": targets,
            "draft": draft,
            "scheduledAt": scheduledAt
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Message = { response in
            return AppwriteModels.Message.from(map: response as! [String: Any])
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
    /// Create a new SMS message.
    ///
    /// - Parameters:
    ///   - messageId: String
    ///   - content: String
    ///   - topics: [String] (optional)
    ///   - users: [String] (optional)
    ///   - targets: [String] (optional)
    ///   - draft: Bool (optional)
    ///   - scheduledAt: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Message
    ///
    open func createSMS(
        messageId: String,
        content: String,
        topics: [String]? = nil,
        users: [String]? = nil,
        targets: [String]? = nil,
        draft: Bool? = nil,
        scheduledAt: String? = nil
    ) async throws -> AppwriteModels.Message {
        let apiPath: String = "/messaging/messages/sms"

        let apiParams: [String: Any?] = [
            "messageId": messageId,
            "content": content,
            "topics": topics,
            "users": users,
            "targets": targets,
            "draft": draft,
            "scheduledAt": scheduledAt
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Message = { response in
            return AppwriteModels.Message.from(map: response as! [String: Any])
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
    /// Update an SMS message by its unique ID. This endpoint only works on
    /// messages that are in draft status. Messages that are already processing,
    /// sent, or failed cannot be updated.
    /// 
    ///
    /// - Parameters:
    ///   - messageId: String
    ///   - topics: [String] (optional)
    ///   - users: [String] (optional)
    ///   - targets: [String] (optional)
    ///   - content: String (optional)
    ///   - draft: Bool (optional)
    ///   - scheduledAt: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Message
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `Messaging.updateSMS` instead.")
    open func updateSms(
        messageId: String,
        topics: [String]? = nil,
        users: [String]? = nil,
        targets: [String]? = nil,
        content: String? = nil,
        draft: Bool? = nil,
        scheduledAt: String? = nil
    ) async throws -> AppwriteModels.Message {
        let apiPath: String = "/messaging/messages/sms/{messageId}"
            .replacingOccurrences(of: "{messageId}", with: messageId)

        let apiParams: [String: Any?] = [
            "topics": topics,
            "users": users,
            "targets": targets,
            "content": content,
            "draft": draft,
            "scheduledAt": scheduledAt
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Message = { response in
            return AppwriteModels.Message.from(map: response as! [String: Any])
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
    /// Update an SMS message by its unique ID. This endpoint only works on
    /// messages that are in draft status. Messages that are already processing,
    /// sent, or failed cannot be updated.
    /// 
    ///
    /// - Parameters:
    ///   - messageId: String
    ///   - topics: [String] (optional)
    ///   - users: [String] (optional)
    ///   - targets: [String] (optional)
    ///   - content: String (optional)
    ///   - draft: Bool (optional)
    ///   - scheduledAt: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Message
    ///
    open func updateSMS(
        messageId: String,
        topics: [String]? = nil,
        users: [String]? = nil,
        targets: [String]? = nil,
        content: String? = nil,
        draft: Bool? = nil,
        scheduledAt: String? = nil
    ) async throws -> AppwriteModels.Message {
        let apiPath: String = "/messaging/messages/sms/{messageId}"
            .replacingOccurrences(of: "{messageId}", with: messageId)

        let apiParams: [String: Any?] = [
            "topics": topics,
            "users": users,
            "targets": targets,
            "content": content,
            "draft": draft,
            "scheduledAt": scheduledAt
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Message = { response in
            return AppwriteModels.Message.from(map: response as! [String: Any])
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
    /// Get a message by its unique ID.
    /// 
    ///
    /// - Parameters:
    ///   - messageId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Message
    ///
    open func getMessage(
        messageId: String
    ) async throws -> AppwriteModels.Message {
        let apiPath: String = "/messaging/messages/{messageId}"
            .replacingOccurrences(of: "{messageId}", with: messageId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Message = { response in
            return AppwriteModels.Message.from(map: response as! [String: Any])
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
    /// Delete a message. If the message is not a draft or scheduled, but has been
    /// sent, this will not recall the message.
    ///
    /// - Parameters:
    ///   - messageId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func delete(
        messageId: String
    ) async throws -> Any {
        let apiPath: String = "/messaging/messages/{messageId}"
            .replacingOccurrences(of: "{messageId}", with: messageId)

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
    /// Get the message activity logs listed by its unique ID.
    ///
    /// - Parameters:
    ///   - messageId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.LogList
    ///
    open func listMessageLogs(
        messageId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.LogList {
        let apiPath: String = "/messaging/messages/{messageId}/logs"
            .replacingOccurrences(of: "{messageId}", with: messageId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.LogList = { response in
            return AppwriteModels.LogList.from(map: response as! [String: Any])
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
    /// Get a list of the targets associated with a message.
    ///
    /// - Parameters:
    ///   - messageId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.TargetList
    ///
    open func listTargets(
        messageId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.TargetList {
        let apiPath: String = "/messaging/messages/{messageId}/targets"
            .replacingOccurrences(of: "{messageId}", with: messageId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.TargetList = { response in
            return AppwriteModels.TargetList.from(map: response as! [String: Any])
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
    /// Get a list of all providers from the current Appwrite project.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ProviderList
    ///
    open func listProviders(
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.ProviderList {
        let apiPath: String = "/messaging/providers"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.ProviderList = { response in
            return AppwriteModels.ProviderList.from(map: response as! [String: Any])
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
    /// Create a new Apple Push Notification service provider.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String
    ///   - authKey: String (optional)
    ///   - authKeyId: String (optional)
    ///   - teamId: String (optional)
    ///   - bundleId: String (optional)
    ///   - sandbox: Bool (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `Messaging.createAPNSProvider` instead.")
    open func createApnsProvider(
        providerId: String,
        name: String,
        authKey: String? = nil,
        authKeyId: String? = nil,
        teamId: String? = nil,
        bundleId: String? = nil,
        sandbox: Bool? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/apns"

        let apiParams: [String: Any?] = [
            "providerId": providerId,
            "name": name,
            "authKey": authKey,
            "authKeyId": authKeyId,
            "teamId": teamId,
            "bundleId": bundleId,
            "sandbox": sandbox,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Create a new Apple Push Notification service provider.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String
    ///   - authKey: String (optional)
    ///   - authKeyId: String (optional)
    ///   - teamId: String (optional)
    ///   - bundleId: String (optional)
    ///   - sandbox: Bool (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func createAPNSProvider(
        providerId: String,
        name: String,
        authKey: String? = nil,
        authKeyId: String? = nil,
        teamId: String? = nil,
        bundleId: String? = nil,
        sandbox: Bool? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/apns"

        let apiParams: [String: Any?] = [
            "providerId": providerId,
            "name": name,
            "authKey": authKey,
            "authKeyId": authKeyId,
            "teamId": teamId,
            "bundleId": bundleId,
            "sandbox": sandbox,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Update a Apple Push Notification service provider by its unique ID.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String (optional)
    ///   - enabled: Bool (optional)
    ///   - authKey: String (optional)
    ///   - authKeyId: String (optional)
    ///   - teamId: String (optional)
    ///   - bundleId: String (optional)
    ///   - sandbox: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `Messaging.updateAPNSProvider` instead.")
    open func updateApnsProvider(
        providerId: String,
        name: String? = nil,
        enabled: Bool? = nil,
        authKey: String? = nil,
        authKeyId: String? = nil,
        teamId: String? = nil,
        bundleId: String? = nil,
        sandbox: Bool? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/apns/{providerId}"
            .replacingOccurrences(of: "{providerId}", with: providerId)

        let apiParams: [String: Any?] = [
            "name": name,
            "enabled": enabled,
            "authKey": authKey,
            "authKeyId": authKeyId,
            "teamId": teamId,
            "bundleId": bundleId,
            "sandbox": sandbox
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Update a Apple Push Notification service provider by its unique ID.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String (optional)
    ///   - enabled: Bool (optional)
    ///   - authKey: String (optional)
    ///   - authKeyId: String (optional)
    ///   - teamId: String (optional)
    ///   - bundleId: String (optional)
    ///   - sandbox: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func updateAPNSProvider(
        providerId: String,
        name: String? = nil,
        enabled: Bool? = nil,
        authKey: String? = nil,
        authKeyId: String? = nil,
        teamId: String? = nil,
        bundleId: String? = nil,
        sandbox: Bool? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/apns/{providerId}"
            .replacingOccurrences(of: "{providerId}", with: providerId)

        let apiParams: [String: Any?] = [
            "name": name,
            "enabled": enabled,
            "authKey": authKey,
            "authKeyId": authKeyId,
            "teamId": teamId,
            "bundleId": bundleId,
            "sandbox": sandbox
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Create a new Firebase Cloud Messaging provider.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String
    ///   - serviceAccountJSON: Any (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `Messaging.createFCMProvider` instead.")
    open func createFcmProvider(
        providerId: String,
        name: String,
        serviceAccountJSON: Any? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/fcm"

        let apiParams: [String: Any?] = [
            "providerId": providerId,
            "name": name,
            "serviceAccountJSON": serviceAccountJSON,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Create a new Firebase Cloud Messaging provider.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String
    ///   - serviceAccountJSON: Any (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func createFCMProvider(
        providerId: String,
        name: String,
        serviceAccountJSON: Any? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/fcm"

        let apiParams: [String: Any?] = [
            "providerId": providerId,
            "name": name,
            "serviceAccountJSON": serviceAccountJSON,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Update a Firebase Cloud Messaging provider by its unique ID.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String (optional)
    ///   - enabled: Bool (optional)
    ///   - serviceAccountJSON: Any (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `Messaging.updateFCMProvider` instead.")
    open func updateFcmProvider(
        providerId: String,
        name: String? = nil,
        enabled: Bool? = nil,
        serviceAccountJSON: Any? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/fcm/{providerId}"
            .replacingOccurrences(of: "{providerId}", with: providerId)

        let apiParams: [String: Any?] = [
            "name": name,
            "enabled": enabled,
            "serviceAccountJSON": serviceAccountJSON
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Update a Firebase Cloud Messaging provider by its unique ID.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String (optional)
    ///   - enabled: Bool (optional)
    ///   - serviceAccountJSON: Any (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func updateFCMProvider(
        providerId: String,
        name: String? = nil,
        enabled: Bool? = nil,
        serviceAccountJSON: Any? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/fcm/{providerId}"
            .replacingOccurrences(of: "{providerId}", with: providerId)

        let apiParams: [String: Any?] = [
            "name": name,
            "enabled": enabled,
            "serviceAccountJSON": serviceAccountJSON
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Create a new Mailgun provider.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String
    ///   - apiKey: String (optional)
    ///   - domain: String (optional)
    ///   - isEuRegion: Bool (optional)
    ///   - fromName: String (optional)
    ///   - fromEmail: String (optional)
    ///   - replyToName: String (optional)
    ///   - replyToEmail: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func createMailgunProvider(
        providerId: String,
        name: String,
        apiKey: String? = nil,
        domain: String? = nil,
        isEuRegion: Bool? = nil,
        fromName: String? = nil,
        fromEmail: String? = nil,
        replyToName: String? = nil,
        replyToEmail: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/mailgun"

        let apiParams: [String: Any?] = [
            "providerId": providerId,
            "name": name,
            "apiKey": apiKey,
            "domain": domain,
            "isEuRegion": isEuRegion,
            "fromName": fromName,
            "fromEmail": fromEmail,
            "replyToName": replyToName,
            "replyToEmail": replyToEmail,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Update a Mailgun provider by its unique ID.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String (optional)
    ///   - apiKey: String (optional)
    ///   - domain: String (optional)
    ///   - isEuRegion: Bool (optional)
    ///   - enabled: Bool (optional)
    ///   - fromName: String (optional)
    ///   - fromEmail: String (optional)
    ///   - replyToName: String (optional)
    ///   - replyToEmail: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func updateMailgunProvider(
        providerId: String,
        name: String? = nil,
        apiKey: String? = nil,
        domain: String? = nil,
        isEuRegion: Bool? = nil,
        enabled: Bool? = nil,
        fromName: String? = nil,
        fromEmail: String? = nil,
        replyToName: String? = nil,
        replyToEmail: String? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/mailgun/{providerId}"
            .replacingOccurrences(of: "{providerId}", with: providerId)

        let apiParams: [String: Any?] = [
            "name": name,
            "apiKey": apiKey,
            "domain": domain,
            "isEuRegion": isEuRegion,
            "enabled": enabled,
            "fromName": fromName,
            "fromEmail": fromEmail,
            "replyToName": replyToName,
            "replyToEmail": replyToEmail
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Create a new MSG91 provider.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String
    ///   - templateId: String (optional)
    ///   - senderId: String (optional)
    ///   - authKey: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func createMsg91Provider(
        providerId: String,
        name: String,
        templateId: String? = nil,
        senderId: String? = nil,
        authKey: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/msg91"

        let apiParams: [String: Any?] = [
            "providerId": providerId,
            "name": name,
            "templateId": templateId,
            "senderId": senderId,
            "authKey": authKey,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Update a MSG91 provider by its unique ID.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String (optional)
    ///   - enabled: Bool (optional)
    ///   - templateId: String (optional)
    ///   - senderId: String (optional)
    ///   - authKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func updateMsg91Provider(
        providerId: String,
        name: String? = nil,
        enabled: Bool? = nil,
        templateId: String? = nil,
        senderId: String? = nil,
        authKey: String? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/msg91/{providerId}"
            .replacingOccurrences(of: "{providerId}", with: providerId)

        let apiParams: [String: Any?] = [
            "name": name,
            "enabled": enabled,
            "templateId": templateId,
            "senderId": senderId,
            "authKey": authKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Create a new Sendgrid provider.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String
    ///   - apiKey: String (optional)
    ///   - fromName: String (optional)
    ///   - fromEmail: String (optional)
    ///   - replyToName: String (optional)
    ///   - replyToEmail: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func createSendgridProvider(
        providerId: String,
        name: String,
        apiKey: String? = nil,
        fromName: String? = nil,
        fromEmail: String? = nil,
        replyToName: String? = nil,
        replyToEmail: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/sendgrid"

        let apiParams: [String: Any?] = [
            "providerId": providerId,
            "name": name,
            "apiKey": apiKey,
            "fromName": fromName,
            "fromEmail": fromEmail,
            "replyToName": replyToName,
            "replyToEmail": replyToEmail,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Update a Sendgrid provider by its unique ID.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String (optional)
    ///   - enabled: Bool (optional)
    ///   - apiKey: String (optional)
    ///   - fromName: String (optional)
    ///   - fromEmail: String (optional)
    ///   - replyToName: String (optional)
    ///   - replyToEmail: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func updateSendgridProvider(
        providerId: String,
        name: String? = nil,
        enabled: Bool? = nil,
        apiKey: String? = nil,
        fromName: String? = nil,
        fromEmail: String? = nil,
        replyToName: String? = nil,
        replyToEmail: String? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/sendgrid/{providerId}"
            .replacingOccurrences(of: "{providerId}", with: providerId)

        let apiParams: [String: Any?] = [
            "name": name,
            "enabled": enabled,
            "apiKey": apiKey,
            "fromName": fromName,
            "fromEmail": fromEmail,
            "replyToName": replyToName,
            "replyToEmail": replyToEmail
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Create a new SMTP provider.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String
    ///   - host: String
    ///   - port: Int (optional)
    ///   - username: String (optional)
    ///   - password: String (optional)
    ///   - encryption: SmtpEncryption (optional)
    ///   - autoTLS: Bool (optional)
    ///   - mailer: String (optional)
    ///   - fromName: String (optional)
    ///   - fromEmail: String (optional)
    ///   - replyToName: String (optional)
    ///   - replyToEmail: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `Messaging.createSMTPProvider` instead.")
    open func createSmtpProvider(
        providerId: String,
        name: String,
        host: String,
        port: Int? = nil,
        username: String? = nil,
        password: String? = nil,
        encryption: SmtpEncryption? = nil,
        autoTLS: Bool? = nil,
        mailer: String? = nil,
        fromName: String? = nil,
        fromEmail: String? = nil,
        replyToName: String? = nil,
        replyToEmail: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/smtp"

        let apiParams: [String: Any?] = [
            "providerId": providerId,
            "name": name,
            "host": host,
            "port": port,
            "username": username,
            "password": password,
            "encryption": encryption,
            "autoTLS": autoTLS,
            "mailer": mailer,
            "fromName": fromName,
            "fromEmail": fromEmail,
            "replyToName": replyToName,
            "replyToEmail": replyToEmail,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Create a new SMTP provider.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String
    ///   - host: String
    ///   - port: Int (optional)
    ///   - username: String (optional)
    ///   - password: String (optional)
    ///   - encryption: SmtpEncryption (optional)
    ///   - autoTLS: Bool (optional)
    ///   - mailer: String (optional)
    ///   - fromName: String (optional)
    ///   - fromEmail: String (optional)
    ///   - replyToName: String (optional)
    ///   - replyToEmail: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func createSMTPProvider(
        providerId: String,
        name: String,
        host: String,
        port: Int? = nil,
        username: String? = nil,
        password: String? = nil,
        encryption: SmtpEncryption? = nil,
        autoTLS: Bool? = nil,
        mailer: String? = nil,
        fromName: String? = nil,
        fromEmail: String? = nil,
        replyToName: String? = nil,
        replyToEmail: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/smtp"

        let apiParams: [String: Any?] = [
            "providerId": providerId,
            "name": name,
            "host": host,
            "port": port,
            "username": username,
            "password": password,
            "encryption": encryption,
            "autoTLS": autoTLS,
            "mailer": mailer,
            "fromName": fromName,
            "fromEmail": fromEmail,
            "replyToName": replyToName,
            "replyToEmail": replyToEmail,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Update a SMTP provider by its unique ID.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String (optional)
    ///   - host: String (optional)
    ///   - port: Int (optional)
    ///   - username: String (optional)
    ///   - password: String (optional)
    ///   - encryption: SmtpEncryption (optional)
    ///   - autoTLS: Bool (optional)
    ///   - mailer: String (optional)
    ///   - fromName: String (optional)
    ///   - fromEmail: String (optional)
    ///   - replyToName: String (optional)
    ///   - replyToEmail: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `Messaging.updateSMTPProvider` instead.")
    open func updateSmtpProvider(
        providerId: String,
        name: String? = nil,
        host: String? = nil,
        port: Int? = nil,
        username: String? = nil,
        password: String? = nil,
        encryption: SmtpEncryption? = nil,
        autoTLS: Bool? = nil,
        mailer: String? = nil,
        fromName: String? = nil,
        fromEmail: String? = nil,
        replyToName: String? = nil,
        replyToEmail: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/smtp/{providerId}"
            .replacingOccurrences(of: "{providerId}", with: providerId)

        let apiParams: [String: Any?] = [
            "name": name,
            "host": host,
            "port": port,
            "username": username,
            "password": password,
            "encryption": encryption,
            "autoTLS": autoTLS,
            "mailer": mailer,
            "fromName": fromName,
            "fromEmail": fromEmail,
            "replyToName": replyToName,
            "replyToEmail": replyToEmail,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Update a SMTP provider by its unique ID.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String (optional)
    ///   - host: String (optional)
    ///   - port: Int (optional)
    ///   - username: String (optional)
    ///   - password: String (optional)
    ///   - encryption: SmtpEncryption (optional)
    ///   - autoTLS: Bool (optional)
    ///   - mailer: String (optional)
    ///   - fromName: String (optional)
    ///   - fromEmail: String (optional)
    ///   - replyToName: String (optional)
    ///   - replyToEmail: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func updateSMTPProvider(
        providerId: String,
        name: String? = nil,
        host: String? = nil,
        port: Int? = nil,
        username: String? = nil,
        password: String? = nil,
        encryption: SmtpEncryption? = nil,
        autoTLS: Bool? = nil,
        mailer: String? = nil,
        fromName: String? = nil,
        fromEmail: String? = nil,
        replyToName: String? = nil,
        replyToEmail: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/smtp/{providerId}"
            .replacingOccurrences(of: "{providerId}", with: providerId)

        let apiParams: [String: Any?] = [
            "name": name,
            "host": host,
            "port": port,
            "username": username,
            "password": password,
            "encryption": encryption,
            "autoTLS": autoTLS,
            "mailer": mailer,
            "fromName": fromName,
            "fromEmail": fromEmail,
            "replyToName": replyToName,
            "replyToEmail": replyToEmail,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Create a new Telesign provider.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String
    ///   - from: String (optional)
    ///   - customerId: String (optional)
    ///   - apiKey: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func createTelesignProvider(
        providerId: String,
        name: String,
        from: String? = nil,
        customerId: String? = nil,
        apiKey: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/telesign"

        let apiParams: [String: Any?] = [
            "providerId": providerId,
            "name": name,
            "from": from,
            "customerId": customerId,
            "apiKey": apiKey,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Update a Telesign provider by its unique ID.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String (optional)
    ///   - enabled: Bool (optional)
    ///   - customerId: String (optional)
    ///   - apiKey: String (optional)
    ///   - from: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func updateTelesignProvider(
        providerId: String,
        name: String? = nil,
        enabled: Bool? = nil,
        customerId: String? = nil,
        apiKey: String? = nil,
        from: String? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/telesign/{providerId}"
            .replacingOccurrences(of: "{providerId}", with: providerId)

        let apiParams: [String: Any?] = [
            "name": name,
            "enabled": enabled,
            "customerId": customerId,
            "apiKey": apiKey,
            "from": from
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Create a new Textmagic provider.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String
    ///   - from: String (optional)
    ///   - username: String (optional)
    ///   - apiKey: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func createTextmagicProvider(
        providerId: String,
        name: String,
        from: String? = nil,
        username: String? = nil,
        apiKey: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/textmagic"

        let apiParams: [String: Any?] = [
            "providerId": providerId,
            "name": name,
            "from": from,
            "username": username,
            "apiKey": apiKey,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Update a Textmagic provider by its unique ID.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String (optional)
    ///   - enabled: Bool (optional)
    ///   - username: String (optional)
    ///   - apiKey: String (optional)
    ///   - from: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func updateTextmagicProvider(
        providerId: String,
        name: String? = nil,
        enabled: Bool? = nil,
        username: String? = nil,
        apiKey: String? = nil,
        from: String? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/textmagic/{providerId}"
            .replacingOccurrences(of: "{providerId}", with: providerId)

        let apiParams: [String: Any?] = [
            "name": name,
            "enabled": enabled,
            "username": username,
            "apiKey": apiKey,
            "from": from
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Create a new Twilio provider.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String
    ///   - from: String (optional)
    ///   - accountSid: String (optional)
    ///   - authToken: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func createTwilioProvider(
        providerId: String,
        name: String,
        from: String? = nil,
        accountSid: String? = nil,
        authToken: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/twilio"

        let apiParams: [String: Any?] = [
            "providerId": providerId,
            "name": name,
            "from": from,
            "accountSid": accountSid,
            "authToken": authToken,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Update a Twilio provider by its unique ID.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String (optional)
    ///   - enabled: Bool (optional)
    ///   - accountSid: String (optional)
    ///   - authToken: String (optional)
    ///   - from: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func updateTwilioProvider(
        providerId: String,
        name: String? = nil,
        enabled: Bool? = nil,
        accountSid: String? = nil,
        authToken: String? = nil,
        from: String? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/twilio/{providerId}"
            .replacingOccurrences(of: "{providerId}", with: providerId)

        let apiParams: [String: Any?] = [
            "name": name,
            "enabled": enabled,
            "accountSid": accountSid,
            "authToken": authToken,
            "from": from
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Create a new Vonage provider.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String
    ///   - from: String (optional)
    ///   - apiKey: String (optional)
    ///   - apiSecret: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func createVonageProvider(
        providerId: String,
        name: String,
        from: String? = nil,
        apiKey: String? = nil,
        apiSecret: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/vonage"

        let apiParams: [String: Any?] = [
            "providerId": providerId,
            "name": name,
            "from": from,
            "apiKey": apiKey,
            "apiSecret": apiSecret,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Update a Vonage provider by its unique ID.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - name: String (optional)
    ///   - enabled: Bool (optional)
    ///   - apiKey: String (optional)
    ///   - apiSecret: String (optional)
    ///   - from: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func updateVonageProvider(
        providerId: String,
        name: String? = nil,
        enabled: Bool? = nil,
        apiKey: String? = nil,
        apiSecret: String? = nil,
        from: String? = nil
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/vonage/{providerId}"
            .replacingOccurrences(of: "{providerId}", with: providerId)

        let apiParams: [String: Any?] = [
            "name": name,
            "enabled": enabled,
            "apiKey": apiKey,
            "apiSecret": apiSecret,
            "from": from
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Get a provider by its unique ID.
    /// 
    ///
    /// - Parameters:
    ///   - providerId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Provider
    ///
    open func getProvider(
        providerId: String
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/{providerId}"
            .replacingOccurrences(of: "{providerId}", with: providerId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Provider = { response in
            return AppwriteModels.Provider.from(map: response as! [String: Any])
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
    /// Delete a provider by its unique ID.
    ///
    /// - Parameters:
    ///   - providerId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteProvider(
        providerId: String
    ) async throws -> Any {
        let apiPath: String = "/messaging/providers/{providerId}"
            .replacingOccurrences(of: "{providerId}", with: providerId)

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
    /// Get the provider activity logs listed by its unique ID.
    ///
    /// - Parameters:
    ///   - providerId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.LogList
    ///
    open func listProviderLogs(
        providerId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.LogList {
        let apiPath: String = "/messaging/providers/{providerId}/logs"
            .replacingOccurrences(of: "{providerId}", with: providerId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.LogList = { response in
            return AppwriteModels.LogList.from(map: response as! [String: Any])
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
    /// Get the subscriber activity logs listed by its unique ID.
    ///
    /// - Parameters:
    ///   - subscriberId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.LogList
    ///
    open func listSubscriberLogs(
        subscriberId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.LogList {
        let apiPath: String = "/messaging/subscribers/{subscriberId}/logs"
            .replacingOccurrences(of: "{subscriberId}", with: subscriberId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.LogList = { response in
            return AppwriteModels.LogList.from(map: response as! [String: Any])
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
    /// Get a list of all topics from the current Appwrite project.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.TopicList
    ///
    open func listTopics(
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.TopicList {
        let apiPath: String = "/messaging/topics"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.TopicList = { response in
            return AppwriteModels.TopicList.from(map: response as! [String: Any])
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
    /// Create a new topic.
    ///
    /// - Parameters:
    ///   - topicId: String
    ///   - name: String
    ///   - subscribe: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Topic
    ///
    open func createTopic(
        topicId: String,
        name: String,
        subscribe: [String]? = nil
    ) async throws -> AppwriteModels.Topic {
        let apiPath: String = "/messaging/topics"

        let apiParams: [String: Any?] = [
            "topicId": topicId,
            "name": name,
            "subscribe": subscribe
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Topic = { response in
            return AppwriteModels.Topic.from(map: response as! [String: Any])
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
    /// Get a topic by its unique ID.
    /// 
    ///
    /// - Parameters:
    ///   - topicId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Topic
    ///
    open func getTopic(
        topicId: String
    ) async throws -> AppwriteModels.Topic {
        let apiPath: String = "/messaging/topics/{topicId}"
            .replacingOccurrences(of: "{topicId}", with: topicId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Topic = { response in
            return AppwriteModels.Topic.from(map: response as! [String: Any])
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
    /// Update a topic by its unique ID.
    /// 
    ///
    /// - Parameters:
    ///   - topicId: String
    ///   - name: String (optional)
    ///   - subscribe: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Topic
    ///
    open func updateTopic(
        topicId: String,
        name: String? = nil,
        subscribe: [String]? = nil
    ) async throws -> AppwriteModels.Topic {
        let apiPath: String = "/messaging/topics/{topicId}"
            .replacingOccurrences(of: "{topicId}", with: topicId)

        let apiParams: [String: Any?] = [
            "name": name,
            "subscribe": subscribe
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Topic = { response in
            return AppwriteModels.Topic.from(map: response as! [String: Any])
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
    /// Delete a topic by its unique ID.
    ///
    /// - Parameters:
    ///   - topicId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteTopic(
        topicId: String
    ) async throws -> Any {
        let apiPath: String = "/messaging/topics/{topicId}"
            .replacingOccurrences(of: "{topicId}", with: topicId)

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
    /// Get the topic activity logs listed by its unique ID.
    ///
    /// - Parameters:
    ///   - topicId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.LogList
    ///
    open func listTopicLogs(
        topicId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.LogList {
        let apiPath: String = "/messaging/topics/{topicId}/logs"
            .replacingOccurrences(of: "{topicId}", with: topicId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.LogList = { response in
            return AppwriteModels.LogList.from(map: response as! [String: Any])
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
    /// Get a list of all subscribers from the current Appwrite project.
    ///
    /// - Parameters:
    ///   - topicId: String
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.SubscriberList
    ///
    open func listSubscribers(
        topicId: String,
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.SubscriberList {
        let apiPath: String = "/messaging/topics/{topicId}/subscribers"
            .replacingOccurrences(of: "{topicId}", with: topicId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.SubscriberList = { response in
            return AppwriteModels.SubscriberList.from(map: response as! [String: Any])
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
    /// Create a new subscriber.
    ///
    /// - Parameters:
    ///   - topicId: String
    ///   - subscriberId: String
    ///   - targetId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Subscriber
    ///
    open func createSubscriber(
        topicId: String,
        subscriberId: String,
        targetId: String
    ) async throws -> AppwriteModels.Subscriber {
        let apiPath: String = "/messaging/topics/{topicId}/subscribers"
            .replacingOccurrences(of: "{topicId}", with: topicId)

        let apiParams: [String: Any?] = [
            "subscriberId": subscriberId,
            "targetId": targetId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Subscriber = { response in
            return AppwriteModels.Subscriber.from(map: response as! [String: Any])
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
    /// Get a subscriber by its unique ID.
    /// 
    ///
    /// - Parameters:
    ///   - topicId: String
    ///   - subscriberId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Subscriber
    ///
    open func getSubscriber(
        topicId: String,
        subscriberId: String
    ) async throws -> AppwriteModels.Subscriber {
        let apiPath: String = "/messaging/topics/{topicId}/subscribers/{subscriberId}"
            .replacingOccurrences(of: "{topicId}", with: topicId)
            .replacingOccurrences(of: "{subscriberId}", with: subscriberId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Subscriber = { response in
            return AppwriteModels.Subscriber.from(map: response as! [String: Any])
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
    /// Delete a subscriber by its unique ID.
    ///
    /// - Parameters:
    ///   - topicId: String
    ///   - subscriberId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteSubscriber(
        topicId: String,
        subscriberId: String
    ) async throws -> Any {
        let apiPath: String = "/messaging/topics/{topicId}/subscribers/{subscriberId}"
            .replacingOccurrences(of: "{topicId}", with: topicId)
            .replacingOccurrences(of: "{subscriberId}", with: subscriberId)

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