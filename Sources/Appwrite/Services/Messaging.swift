import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Messaging service allows you to send messages to any provider type (SMTP, push notification, SMS, etc.).
open class Messaging: Service {

    ///
    /// List messages
    ///
    /// Get a list of all messages from the current Appwrite project.
    ///
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
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

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Create email
    ///
    /// Create a new email message.
    ///
    /// @param String messageId
    /// @param String subject
    /// @param String content
    /// @param [String] topics
    /// @param [String] users
    /// @param [String] targets
    /// @param [String] cc
    /// @param [String] bcc
    /// @param [String] attachments
    /// @param Bool draft
    /// @param Bool html
    /// @param String scheduledAt
    /// @throws Exception
    /// @return array
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
    /// Update email
    ///
    /// Update an email message by its unique ID.
    /// 
    ///
    /// @param String messageId
    /// @param [String] topics
    /// @param [String] users
    /// @param [String] targets
    /// @param String subject
    /// @param String content
    /// @param Bool draft
    /// @param Bool html
    /// @param [String] cc
    /// @param [String] bcc
    /// @param String scheduledAt
    /// @param [String] attachments
    /// @throws Exception
    /// @return array
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
    /// Create push notification
    ///
    /// Create a new push notification.
    ///
    /// @param String messageId
    /// @param String title
    /// @param String body
    /// @param [String] topics
    /// @param [String] users
    /// @param [String] targets
    /// @param Any data
    /// @param String action
    /// @param String image
    /// @param String icon
    /// @param String sound
    /// @param String color
    /// @param String tag
    /// @param Int badge
    /// @param Bool draft
    /// @param String scheduledAt
    /// @param Bool contentAvailable
    /// @param Bool critical
    /// @param AppwriteEnums.MessagePriority priority
    /// @throws Exception
    /// @return array
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
        priority: AppwriteEnums.MessagePriority? = nil
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
    /// Update push notification
    ///
    /// Update a push notification by its unique ID.
    /// 
    ///
    /// @param String messageId
    /// @param [String] topics
    /// @param [String] users
    /// @param [String] targets
    /// @param String title
    /// @param String body
    /// @param Any data
    /// @param String action
    /// @param String image
    /// @param String icon
    /// @param String sound
    /// @param String color
    /// @param String tag
    /// @param Int badge
    /// @param Bool draft
    /// @param String scheduledAt
    /// @param Bool contentAvailable
    /// @param Bool critical
    /// @param AppwriteEnums.MessagePriority priority
    /// @throws Exception
    /// @return array
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
        priority: AppwriteEnums.MessagePriority? = nil
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
    /// Create SMS
    ///
    /// Create a new SMS message.
    ///
    /// @param String messageId
    /// @param String content
    /// @param [String] topics
    /// @param [String] users
    /// @param [String] targets
    /// @param Bool draft
    /// @param String scheduledAt
    /// @throws Exception
    /// @return array
    ///
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
    /// Update SMS
    ///
    /// Update an email message by its unique ID.
    /// 
    ///
    /// @param String messageId
    /// @param [String] topics
    /// @param [String] users
    /// @param [String] targets
    /// @param String content
    /// @param Bool draft
    /// @param String scheduledAt
    /// @throws Exception
    /// @return array
    ///
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
    /// Get message
    ///
    /// Get a message by its unique ID.
    /// 
    ///
    /// @param String messageId
    /// @throws Exception
    /// @return array
    ///
    open func getMessage(
        messageId: String
    ) async throws -> AppwriteModels.Message {
        let apiPath: String = "/messaging/messages/{messageId}"
            .replacingOccurrences(of: "{messageId}", with: messageId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Delete message
    ///
    /// Delete a message. If the message is not a draft or scheduled, but has been
    /// sent, this will not recall the message.
    ///
    /// @param String messageId
    /// @throws Exception
    /// @return array
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
    /// List message logs
    ///
    /// Get the message activity logs listed by its unique ID.
    ///
    /// @param String messageId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
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

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// List message targets
    ///
    /// Get a list of the targets associated with a message.
    ///
    /// @param String messageId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
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

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// List providers
    ///
    /// Get a list of all providers from the current Appwrite project.
    ///
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
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

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Create APNS provider
    ///
    /// Create a new Apple Push Notification service provider.
    ///
    /// @param String providerId
    /// @param String name
    /// @param String authKey
    /// @param String authKeyId
    /// @param String teamId
    /// @param String bundleId
    /// @param Bool sandbox
    /// @param Bool enabled
    /// @throws Exception
    /// @return array
    ///
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
    /// Update APNS provider
    ///
    /// Update a Apple Push Notification service provider by its unique ID.
    ///
    /// @param String providerId
    /// @param String name
    /// @param Bool enabled
    /// @param String authKey
    /// @param String authKeyId
    /// @param String teamId
    /// @param String bundleId
    /// @param Bool sandbox
    /// @throws Exception
    /// @return array
    ///
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
    /// Create FCM provider
    ///
    /// Create a new Firebase Cloud Messaging provider.
    ///
    /// @param String providerId
    /// @param String name
    /// @param Any serviceAccountJSON
    /// @param Bool enabled
    /// @throws Exception
    /// @return array
    ///
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
    /// Update FCM provider
    ///
    /// Update a Firebase Cloud Messaging provider by its unique ID.
    ///
    /// @param String providerId
    /// @param String name
    /// @param Bool enabled
    /// @param Any serviceAccountJSON
    /// @throws Exception
    /// @return array
    ///
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
    /// Create Mailgun provider
    ///
    /// Create a new Mailgun provider.
    ///
    /// @param String providerId
    /// @param String name
    /// @param String apiKey
    /// @param String domain
    /// @param Bool isEuRegion
    /// @param String fromName
    /// @param String fromEmail
    /// @param String replyToName
    /// @param String replyToEmail
    /// @param Bool enabled
    /// @throws Exception
    /// @return array
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
    /// Update Mailgun provider
    ///
    /// Update a Mailgun provider by its unique ID.
    ///
    /// @param String providerId
    /// @param String name
    /// @param String apiKey
    /// @param String domain
    /// @param Bool isEuRegion
    /// @param Bool enabled
    /// @param String fromName
    /// @param String fromEmail
    /// @param String replyToName
    /// @param String replyToEmail
    /// @throws Exception
    /// @return array
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
    /// Create Msg91 provider
    ///
    /// Create a new MSG91 provider.
    ///
    /// @param String providerId
    /// @param String name
    /// @param String templateId
    /// @param String senderId
    /// @param String authKey
    /// @param Bool enabled
    /// @throws Exception
    /// @return array
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
    /// Update Msg91 provider
    ///
    /// Update a MSG91 provider by its unique ID.
    ///
    /// @param String providerId
    /// @param String name
    /// @param Bool enabled
    /// @param String templateId
    /// @param String senderId
    /// @param String authKey
    /// @throws Exception
    /// @return array
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
    /// Create Sendgrid provider
    ///
    /// Create a new Sendgrid provider.
    ///
    /// @param String providerId
    /// @param String name
    /// @param String apiKey
    /// @param String fromName
    /// @param String fromEmail
    /// @param String replyToName
    /// @param String replyToEmail
    /// @param Bool enabled
    /// @throws Exception
    /// @return array
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
    /// Update Sendgrid provider
    ///
    /// Update a Sendgrid provider by its unique ID.
    ///
    /// @param String providerId
    /// @param String name
    /// @param Bool enabled
    /// @param String apiKey
    /// @param String fromName
    /// @param String fromEmail
    /// @param String replyToName
    /// @param String replyToEmail
    /// @throws Exception
    /// @return array
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
    /// Create SMTP provider
    ///
    /// Create a new SMTP provider.
    ///
    /// @param String providerId
    /// @param String name
    /// @param String host
    /// @param Int port
    /// @param String username
    /// @param String password
    /// @param AppwriteEnums.SmtpEncryption encryption
    /// @param Bool autoTLS
    /// @param String mailer
    /// @param String fromName
    /// @param String fromEmail
    /// @param String replyToName
    /// @param String replyToEmail
    /// @param Bool enabled
    /// @throws Exception
    /// @return array
    ///
    open func createSmtpProvider(
        providerId: String,
        name: String,
        host: String,
        port: Int? = nil,
        username: String? = nil,
        password: String? = nil,
        encryption: AppwriteEnums.SmtpEncryption? = nil,
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
    /// Update SMTP provider
    ///
    /// Update a SMTP provider by its unique ID.
    ///
    /// @param String providerId
    /// @param String name
    /// @param String host
    /// @param Int port
    /// @param String username
    /// @param String password
    /// @param AppwriteEnums.SmtpEncryption encryption
    /// @param Bool autoTLS
    /// @param String mailer
    /// @param String fromName
    /// @param String fromEmail
    /// @param String replyToName
    /// @param String replyToEmail
    /// @param Bool enabled
    /// @throws Exception
    /// @return array
    ///
    open func updateSmtpProvider(
        providerId: String,
        name: String? = nil,
        host: String? = nil,
        port: Int? = nil,
        username: String? = nil,
        password: String? = nil,
        encryption: AppwriteEnums.SmtpEncryption? = nil,
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
    /// Create Telesign provider
    ///
    /// Create a new Telesign provider.
    ///
    /// @param String providerId
    /// @param String name
    /// @param String from
    /// @param String customerId
    /// @param String apiKey
    /// @param Bool enabled
    /// @throws Exception
    /// @return array
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
    /// Update Telesign provider
    ///
    /// Update a Telesign provider by its unique ID.
    ///
    /// @param String providerId
    /// @param String name
    /// @param Bool enabled
    /// @param String customerId
    /// @param String apiKey
    /// @param String from
    /// @throws Exception
    /// @return array
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
    /// Create Textmagic provider
    ///
    /// Create a new Textmagic provider.
    ///
    /// @param String providerId
    /// @param String name
    /// @param String from
    /// @param String username
    /// @param String apiKey
    /// @param Bool enabled
    /// @throws Exception
    /// @return array
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
    /// Update Textmagic provider
    ///
    /// Update a Textmagic provider by its unique ID.
    ///
    /// @param String providerId
    /// @param String name
    /// @param Bool enabled
    /// @param String username
    /// @param String apiKey
    /// @param String from
    /// @throws Exception
    /// @return array
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
    /// Create Twilio provider
    ///
    /// Create a new Twilio provider.
    ///
    /// @param String providerId
    /// @param String name
    /// @param String from
    /// @param String accountSid
    /// @param String authToken
    /// @param Bool enabled
    /// @throws Exception
    /// @return array
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
    /// Update Twilio provider
    ///
    /// Update a Twilio provider by its unique ID.
    ///
    /// @param String providerId
    /// @param String name
    /// @param Bool enabled
    /// @param String accountSid
    /// @param String authToken
    /// @param String from
    /// @throws Exception
    /// @return array
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
    /// Create Vonage provider
    ///
    /// Create a new Vonage provider.
    ///
    /// @param String providerId
    /// @param String name
    /// @param String from
    /// @param String apiKey
    /// @param String apiSecret
    /// @param Bool enabled
    /// @throws Exception
    /// @return array
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
    /// Update Vonage provider
    ///
    /// Update a Vonage provider by its unique ID.
    ///
    /// @param String providerId
    /// @param String name
    /// @param Bool enabled
    /// @param String apiKey
    /// @param String apiSecret
    /// @param String from
    /// @throws Exception
    /// @return array
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
    /// Get provider
    ///
    /// Get a provider by its unique ID.
    /// 
    ///
    /// @param String providerId
    /// @throws Exception
    /// @return array
    ///
    open func getProvider(
        providerId: String
    ) async throws -> AppwriteModels.Provider {
        let apiPath: String = "/messaging/providers/{providerId}"
            .replacingOccurrences(of: "{providerId}", with: providerId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Delete provider
    ///
    /// Delete a provider by its unique ID.
    ///
    /// @param String providerId
    /// @throws Exception
    /// @return array
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
    /// List provider logs
    ///
    /// Get the provider activity logs listed by its unique ID.
    ///
    /// @param String providerId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
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

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// List subscriber logs
    ///
    /// Get the subscriber activity logs listed by its unique ID.
    ///
    /// @param String subscriberId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
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

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// List topics
    ///
    /// Get a list of all topics from the current Appwrite project.
    ///
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
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

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Create topic
    ///
    /// Create a new topic.
    ///
    /// @param String topicId
    /// @param String name
    /// @param [String] subscribe
    /// @throws Exception
    /// @return array
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
    /// Get topic
    ///
    /// Get a topic by its unique ID.
    /// 
    ///
    /// @param String topicId
    /// @throws Exception
    /// @return array
    ///
    open func getTopic(
        topicId: String
    ) async throws -> AppwriteModels.Topic {
        let apiPath: String = "/messaging/topics/{topicId}"
            .replacingOccurrences(of: "{topicId}", with: topicId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Update topic
    ///
    /// Update a topic by its unique ID.
    /// 
    ///
    /// @param String topicId
    /// @param String name
    /// @param [String] subscribe
    /// @throws Exception
    /// @return array
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
    /// Delete topic
    ///
    /// Delete a topic by its unique ID.
    ///
    /// @param String topicId
    /// @throws Exception
    /// @return array
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
    /// List topic logs
    ///
    /// Get the topic activity logs listed by its unique ID.
    ///
    /// @param String topicId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
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

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// List subscribers
    ///
    /// Get a list of all subscribers from the current Appwrite project.
    ///
    /// @param String topicId
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
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

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Create subscriber
    ///
    /// Create a new subscriber.
    ///
    /// @param String topicId
    /// @param String subscriberId
    /// @param String targetId
    /// @throws Exception
    /// @return array
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
    /// Get subscriber
    ///
    /// Get a subscriber by its unique ID.
    /// 
    ///
    /// @param String topicId
    /// @param String subscriberId
    /// @throws Exception
    /// @return array
    ///
    open func getSubscriber(
        topicId: String,
        subscriberId: String
    ) async throws -> AppwriteModels.Subscriber {
        let apiPath: String = "/messaging/topics/{topicId}/subscribers/{subscriberId}"
            .replacingOccurrences(of: "{topicId}", with: topicId)
            .replacingOccurrences(of: "{subscriberId}", with: subscriberId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Delete subscriber
    ///
    /// Delete a subscriber by its unique ID.
    ///
    /// @param String topicId
    /// @param String subscriberId
    /// @throws Exception
    /// @return array
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