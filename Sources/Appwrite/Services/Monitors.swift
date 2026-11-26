import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

/// The Monitors service watches your project&#039;s usage and raises an alert when a monitor&#039;s rules hold, announced by email, in the console or to a webhook.
open class Monitors: Service {

    ///
    /// Get a list of the project's monitors of every type. Use queries to filter
    /// by type, resource, severity or status, and `Query.search('search', term)`
    /// to search monitor IDs, names, metrics and resources.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MonitorList
    ///
    open func list(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.MonitorList {
        let apiPath: String = "/monitors"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.MonitorList = { response in
            return AppwriteModels.MonitorList.from(map: response as! [String: Any])
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
    /// Create a DNS monitor. It asks a resolver for a domain's records of one type
    /// on its own interval, and opens an alert when the resolver fails, or when
    /// its rules match the answers, by default when there is no such record. Each
    /// alert fires the `monitors.[monitorId].alerts.[alertId].create` event when
    /// it opens and `.update` when a check passes again, for project webhooks,
    /// functions and realtime, and notifies the organization's members by email
    /// and in the console.
    ///
    /// - Parameters:
    ///   - monitorId: String
    ///   - name: String
    ///   - domain: String
    ///   - record: AppwriteEnums.MonitorRecord (optional)
    ///   - resolver: String (optional)
    ///   - rules: [String] (optional)
    ///   - interval: Int (optional)
    ///   - timeout: Int (optional)
    ///   - cooldown: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - notify: [String] (optional)
    ///   - severity: AppwriteEnums.MonitorSeverity (optional)
    ///   - escalationId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Monitor
    ///
    open func createDnsMonitor(
        monitorId: String,
        name: String,
        domain: String,
        record: AppwriteEnums.MonitorRecord? = nil,
        resolver: String? = nil,
        rules: [String]? = nil,
        interval: Int? = nil,
        timeout: Int? = nil,
        cooldown: Int? = nil,
        enabled: Bool? = nil,
        notify: [String]? = nil,
        severity: AppwriteEnums.MonitorSeverity? = nil,
        escalationId: String? = nil
    ) async throws -> AppwriteModels.Monitor {
        let apiPath: String = "/monitors/dns"

        let apiParams: [String: Any?] = [
            "monitorId": monitorId,
            "name": name,
            "domain": domain,
            "record": record?.rawValue,
            "resolver": resolver,
            "rules": rules,
            "interval": interval,
            "timeout": timeout,
            "cooldown": cooldown,
            "enabled": enabled,
            "notify": notify,
            "severity": severity?.rawValue,
            "escalationId": escalationId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Monitor = { response in
            return AppwriteModels.Monitor.from(map: response as! [String: Any])
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
    /// Update a DNS monitor by its unique ID. Only the parameters passed change;
    /// the monitor's state, its last check and its open alert are kept. Passing
    /// `rules` replaces all of them.
    ///
    /// - Parameters:
    ///   - monitorId: String
    ///   - name: String (optional)
    ///   - domain: String (optional)
    ///   - record: AppwriteEnums.MonitorRecord (optional)
    ///   - resolver: String (optional)
    ///   - rules: [String] (optional)
    ///   - interval: Int (optional)
    ///   - timeout: Int (optional)
    ///   - cooldown: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - notify: [String] (optional)
    ///   - severity: AppwriteEnums.MonitorSeverity (optional)
    ///   - escalationId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Monitor
    ///
    open func updateDnsMonitor(
        monitorId: String,
        name: String? = nil,
        domain: String? = nil,
        record: AppwriteEnums.MonitorRecord? = nil,
        resolver: String? = nil,
        rules: [String]? = nil,
        interval: Int? = nil,
        timeout: Int? = nil,
        cooldown: Int? = nil,
        enabled: Bool? = nil,
        notify: [String]? = nil,
        severity: AppwriteEnums.MonitorSeverity? = nil,
        escalationId: String? = nil
    ) async throws -> AppwriteModels.Monitor {
        if monitorId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"monitorId\"")
        }

        let apiPath: String = "/monitors/dns/{monitorId}"
            .replacingOccurrences(of: "{monitorId}", with: try Client.encodePath(monitorId))

        let apiParams: [String: Any?] = [
            "name": name,
            "domain": domain,
            "record": record?.rawValue,
            "resolver": resolver,
            "rules": rules,
            "interval": interval,
            "timeout": timeout,
            "cooldown": cooldown,
            "enabled": enabled,
            "notify": notify,
            "severity": severity?.rawValue,
            "escalationId": escalationId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Monitor = { response in
            return AppwriteModels.Monitor.from(map: response as! [String: Any])
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
    /// Create an HTTP monitor. It requests a URL on its own interval, following
    /// redirects, and opens an alert when the request fails or when its rules
    /// match the response, by default a status outside 2xx or the certificate of
    /// an HTTPS URL about to expire. The response body is discarded as it arrives.
    /// Each alert fires the `monitors.[monitorId].alerts.[alertId].create` event
    /// when it opens and `.update` when a check passes again, for project
    /// webhooks, functions and realtime, and notifies the organization's members
    /// by email and in the console.
    ///
    /// - Parameters:
    ///   - monitorId: String
    ///   - name: String
    ///   - url: String
    ///   - method: AppwriteEnums.MonitorMethod (optional)
    ///   - headers: Any (optional)
    ///   - body: String (optional)
    ///   - rules: [String] (optional)
    ///   - interval: Int (optional)
    ///   - timeout: Int (optional)
    ///   - cooldown: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - notify: [String] (optional)
    ///   - severity: AppwriteEnums.MonitorSeverity (optional)
    ///   - escalationId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Monitor
    ///
    open func createHttpMonitor(
        monitorId: String,
        name: String,
        url: String,
        method: AppwriteEnums.MonitorMethod? = nil,
        headers: Any? = nil,
        body: String? = nil,
        rules: [String]? = nil,
        interval: Int? = nil,
        timeout: Int? = nil,
        cooldown: Int? = nil,
        enabled: Bool? = nil,
        notify: [String]? = nil,
        severity: AppwriteEnums.MonitorSeverity? = nil,
        escalationId: String? = nil
    ) async throws -> AppwriteModels.Monitor {
        let apiPath: String = "/monitors/http"

        let apiParams: [String: Any?] = [
            "monitorId": monitorId,
            "name": name,
            "url": url,
            "method": method?.rawValue,
            "headers": headers,
            "body": body,
            "rules": rules,
            "interval": interval,
            "timeout": timeout,
            "cooldown": cooldown,
            "enabled": enabled,
            "notify": notify,
            "severity": severity?.rawValue,
            "escalationId": escalationId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Monitor = { response in
            return AppwriteModels.Monitor.from(map: response as! [String: Any])
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
    /// Update an HTTP monitor by its unique ID. Only the parameters passed change;
    /// the monitor's state, its last check and its open alert are kept. Passing
    /// `rules` replaces all of them.
    ///
    /// - Parameters:
    ///   - monitorId: String
    ///   - name: String (optional)
    ///   - url: String (optional)
    ///   - method: AppwriteEnums.MonitorMethod (optional)
    ///   - headers: Any (optional)
    ///   - body: String (optional)
    ///   - rules: [String] (optional)
    ///   - interval: Int (optional)
    ///   - timeout: Int (optional)
    ///   - cooldown: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - notify: [String] (optional)
    ///   - severity: AppwriteEnums.MonitorSeverity (optional)
    ///   - escalationId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Monitor
    ///
    open func updateHttpMonitor(
        monitorId: String,
        name: String? = nil,
        url: String? = nil,
        method: AppwriteEnums.MonitorMethod? = nil,
        headers: Any? = nil,
        body: String? = nil,
        rules: [String]? = nil,
        interval: Int? = nil,
        timeout: Int? = nil,
        cooldown: Int? = nil,
        enabled: Bool? = nil,
        notify: [String]? = nil,
        severity: AppwriteEnums.MonitorSeverity? = nil,
        escalationId: String? = nil
    ) async throws -> AppwriteModels.Monitor {
        if monitorId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"monitorId\"")
        }

        let apiPath: String = "/monitors/http/{monitorId}"
            .replacingOccurrences(of: "{monitorId}", with: try Client.encodePath(monitorId))

        let apiParams: [String: Any?] = [
            "name": name,
            "url": url,
            "method": method?.rawValue,
            "headers": headers,
            "body": body,
            "rules": rules,
            "interval": interval,
            "timeout": timeout,
            "cooldown": cooldown,
            "enabled": enabled,
            "notify": notify,
            "severity": severity?.rawValue,
            "escalationId": escalationId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Monitor = { response in
            return AppwriteModels.Monitor.from(map: response as! [String: Any])
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
    /// Create an SMTP monitor. It reads a mail server's greeting, sends `EHLO`
    /// and, as its TLS mode asks, upgrades with `STARTTLS` or speaks TLS from the
    /// start, on its own interval. It opens an alert when the server cannot be
    /// reached, refuses the session or fails the TLS handshake, or when its rules
    /// match. It never authenticates or sends mail. Each alert fires the
    /// `monitors.[monitorId].alerts.[alertId].create` event when it opens and
    /// `.update` when a check passes again, for project webhooks, functions and
    /// realtime, and notifies the organization's members by email and in the
    /// console.
    ///
    /// - Parameters:
    ///   - monitorId: String
    ///   - name: String
    ///   - host: String
    ///   - port: Int
    ///   - tlsMode: AppwriteEnums.MonitorTlsMode (optional)
    ///   - rules: [String] (optional)
    ///   - interval: Int (optional)
    ///   - timeout: Int (optional)
    ///   - cooldown: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - notify: [String] (optional)
    ///   - severity: AppwriteEnums.MonitorSeverity (optional)
    ///   - escalationId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Monitor
    ///
    open func createSmtpMonitor(
        monitorId: String,
        name: String,
        host: String,
        port: Int,
        tlsMode: AppwriteEnums.MonitorTlsMode? = nil,
        rules: [String]? = nil,
        interval: Int? = nil,
        timeout: Int? = nil,
        cooldown: Int? = nil,
        enabled: Bool? = nil,
        notify: [String]? = nil,
        severity: AppwriteEnums.MonitorSeverity? = nil,
        escalationId: String? = nil
    ) async throws -> AppwriteModels.Monitor {
        let apiPath: String = "/monitors/smtp"

        let apiParams: [String: Any?] = [
            "monitorId": monitorId,
            "name": name,
            "host": host,
            "port": port,
            "tlsMode": tlsMode?.rawValue,
            "rules": rules,
            "interval": interval,
            "timeout": timeout,
            "cooldown": cooldown,
            "enabled": enabled,
            "notify": notify,
            "severity": severity?.rawValue,
            "escalationId": escalationId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Monitor = { response in
            return AppwriteModels.Monitor.from(map: response as! [String: Any])
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
    /// Update an SMTP monitor by its unique ID. Only the parameters passed change;
    /// the monitor's state, its last check and its open alert are kept. Passing
    /// `rules` replaces all of them.
    ///
    /// - Parameters:
    ///   - monitorId: String
    ///   - name: String (optional)
    ///   - host: String (optional)
    ///   - port: Int (optional)
    ///   - tlsMode: AppwriteEnums.MonitorTlsMode (optional)
    ///   - rules: [String] (optional)
    ///   - interval: Int (optional)
    ///   - timeout: Int (optional)
    ///   - cooldown: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - notify: [String] (optional)
    ///   - severity: AppwriteEnums.MonitorSeverity (optional)
    ///   - escalationId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Monitor
    ///
    open func updateSmtpMonitor(
        monitorId: String,
        name: String? = nil,
        host: String? = nil,
        port: Int? = nil,
        tlsMode: AppwriteEnums.MonitorTlsMode? = nil,
        rules: [String]? = nil,
        interval: Int? = nil,
        timeout: Int? = nil,
        cooldown: Int? = nil,
        enabled: Bool? = nil,
        notify: [String]? = nil,
        severity: AppwriteEnums.MonitorSeverity? = nil,
        escalationId: String? = nil
    ) async throws -> AppwriteModels.Monitor {
        if monitorId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"monitorId\"")
        }

        let apiPath: String = "/monitors/smtp/{monitorId}"
            .replacingOccurrences(of: "{monitorId}", with: try Client.encodePath(monitorId))

        let apiParams: [String: Any?] = [
            "name": name,
            "host": host,
            "port": port,
            "tlsMode": tlsMode?.rawValue,
            "rules": rules,
            "interval": interval,
            "timeout": timeout,
            "cooldown": cooldown,
            "enabled": enabled,
            "notify": notify,
            "severity": severity?.rawValue,
            "escalationId": escalationId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Monitor = { response in
            return AppwriteModels.Monitor.from(map: response as! [String: Any])
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
    /// Create a TCP monitor. It opens a connection to a host and port on its own
    /// interval and closes it at once, and opens an alert when the connection
    /// cannot be made, or when its rules match. Each alert fires the
    /// `monitors.[monitorId].alerts.[alertId].create` event when it opens and
    /// `.update` when a check passes again, for project webhooks, functions and
    /// realtime, and notifies the organization's members by email and in the
    /// console.
    ///
    /// - Parameters:
    ///   - monitorId: String
    ///   - name: String
    ///   - host: String
    ///   - port: Int
    ///   - rules: [String] (optional)
    ///   - interval: Int (optional)
    ///   - timeout: Int (optional)
    ///   - cooldown: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - notify: [String] (optional)
    ///   - severity: AppwriteEnums.MonitorSeverity (optional)
    ///   - escalationId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Monitor
    ///
    open func createTcpMonitor(
        monitorId: String,
        name: String,
        host: String,
        port: Int,
        rules: [String]? = nil,
        interval: Int? = nil,
        timeout: Int? = nil,
        cooldown: Int? = nil,
        enabled: Bool? = nil,
        notify: [String]? = nil,
        severity: AppwriteEnums.MonitorSeverity? = nil,
        escalationId: String? = nil
    ) async throws -> AppwriteModels.Monitor {
        let apiPath: String = "/monitors/tcp"

        let apiParams: [String: Any?] = [
            "monitorId": monitorId,
            "name": name,
            "host": host,
            "port": port,
            "rules": rules,
            "interval": interval,
            "timeout": timeout,
            "cooldown": cooldown,
            "enabled": enabled,
            "notify": notify,
            "severity": severity?.rawValue,
            "escalationId": escalationId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Monitor = { response in
            return AppwriteModels.Monitor.from(map: response as! [String: Any])
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
    /// Update a TCP monitor by its unique ID. Only the parameters passed change;
    /// the monitor's state, its last check and its open alert are kept. Passing
    /// `rules` replaces all of them.
    ///
    /// - Parameters:
    ///   - monitorId: String
    ///   - name: String (optional)
    ///   - host: String (optional)
    ///   - port: Int (optional)
    ///   - rules: [String] (optional)
    ///   - interval: Int (optional)
    ///   - timeout: Int (optional)
    ///   - cooldown: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - notify: [String] (optional)
    ///   - severity: AppwriteEnums.MonitorSeverity (optional)
    ///   - escalationId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Monitor
    ///
    open func updateTcpMonitor(
        monitorId: String,
        name: String? = nil,
        host: String? = nil,
        port: Int? = nil,
        rules: [String]? = nil,
        interval: Int? = nil,
        timeout: Int? = nil,
        cooldown: Int? = nil,
        enabled: Bool? = nil,
        notify: [String]? = nil,
        severity: AppwriteEnums.MonitorSeverity? = nil,
        escalationId: String? = nil
    ) async throws -> AppwriteModels.Monitor {
        if monitorId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"monitorId\"")
        }

        let apiPath: String = "/monitors/tcp/{monitorId}"
            .replacingOccurrences(of: "{monitorId}", with: try Client.encodePath(monitorId))

        let apiParams: [String: Any?] = [
            "name": name,
            "host": host,
            "port": port,
            "rules": rules,
            "interval": interval,
            "timeout": timeout,
            "cooldown": cooldown,
            "enabled": enabled,
            "notify": notify,
            "severity": severity?.rawValue,
            "escalationId": escalationId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Monitor = { response in
            return AppwriteModels.Monitor.from(map: response as! [String: Any])
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
    /// Create a usage monitor. It reads a usage metric of the project, or of one
    /// of its databases, buckets, functions or sites, on a schedule, and opens an
    /// alert when all its rules hold. Each alert fires the
    /// `monitors.[monitorId].alerts.[alertId].create` event when it opens and
    /// `.update` when usage recovers, for project webhooks, functions and
    /// realtime, and notifies the confirmed members of the `notify` roles by email
    /// and in the console, or the steps of the escalation set by `escalationId`.
    ///
    /// - Parameters:
    ///   - monitorId: String
    ///   - name: String
    ///   - rules: [String]
    ///   - window: Int (optional)
    ///   - cooldown: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - notify: [String] (optional)
    ///   - severity: AppwriteEnums.MonitorSeverity (optional)
    ///   - escalationId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Monitor
    ///
    open func createUsageMonitor(
        monitorId: String,
        name: String,
        rules: [String],
        window: Int? = nil,
        cooldown: Int? = nil,
        enabled: Bool? = nil,
        notify: [String]? = nil,
        severity: AppwriteEnums.MonitorSeverity? = nil,
        escalationId: String? = nil
    ) async throws -> AppwriteModels.Monitor {
        let apiPath: String = "/monitors/usage"

        let apiParams: [String: Any?] = [
            "monitorId": monitorId,
            "name": name,
            "rules": rules,
            "window": window,
            "cooldown": cooldown,
            "enabled": enabled,
            "notify": notify,
            "severity": severity?.rawValue,
            "escalationId": escalationId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Monitor = { response in
            return AppwriteModels.Monitor.from(map: response as! [String: Any])
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
    /// Update a usage monitor by its unique ID. Only the parameters passed change;
    /// the monitor's state and its open alert are kept. Passing `rules` replaces
    /// all of them.
    ///
    /// - Parameters:
    ///   - monitorId: String
    ///   - name: String (optional)
    ///   - rules: [String] (optional)
    ///   - window: Int (optional)
    ///   - cooldown: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - notify: [String] (optional)
    ///   - severity: AppwriteEnums.MonitorSeverity (optional)
    ///   - escalationId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Monitor
    ///
    open func updateUsageMonitor(
        monitorId: String,
        name: String? = nil,
        rules: [String]? = nil,
        window: Int? = nil,
        cooldown: Int? = nil,
        enabled: Bool? = nil,
        notify: [String]? = nil,
        severity: AppwriteEnums.MonitorSeverity? = nil,
        escalationId: String? = nil
    ) async throws -> AppwriteModels.Monitor {
        if monitorId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"monitorId\"")
        }

        let apiPath: String = "/monitors/usage/{monitorId}"
            .replacingOccurrences(of: "{monitorId}", with: try Client.encodePath(monitorId))

        let apiParams: [String: Any?] = [
            "name": name,
            "rules": rules,
            "window": window,
            "cooldown": cooldown,
            "enabled": enabled,
            "notify": notify,
            "severity": severity?.rawValue,
            "escalationId": escalationId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Monitor = { response in
            return AppwriteModels.Monitor.from(map: response as! [String: Any])
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
    /// Get a monitor by its unique ID, with its state as of its last evaluation.
    ///
    /// - Parameters:
    ///   - monitorId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Monitor
    ///
    open func get(
        monitorId: String
    ) async throws -> AppwriteModels.Monitor {
        if monitorId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"monitorId\"")
        }

        let apiPath: String = "/monitors/{monitorId}"
            .replacingOccurrences(of: "{monitorId}", with: try Client.encodePath(monitorId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Monitor = { response in
            return AppwriteModels.Monitor.from(map: response as! [String: Any])
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
    /// Delete a monitor by its unique ID. It stops being evaluated; an alert it is
    /// firing is resolved and kept with the rest of its alert history.
    ///
    /// - Parameters:
    ///   - monitorId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func delete(
        monitorId: String
    ) async throws -> Any {
        if monitorId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"monitorId\"")
        }

        let apiPath: String = "/monitors/{monitorId}"
            .replacingOccurrences(of: "{monitorId}", with: try Client.encodePath(monitorId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
}
