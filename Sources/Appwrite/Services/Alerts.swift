import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

/// The Alerts service lists the alerts your monitors raised: when each fired, the readings while it fired, and when it resolved.
open class Alerts: Service {

    ///
    /// Get a list of the alerts the project's monitors raised, open and resolved.
    /// An alert is created when a monitor starts firing and resolved when it
    /// recovers. Use queries to filter by monitor, status, type or resource, order
    /// by `$createdAt` for the latest first, and `Query.search('search', term)` to
    /// search alert and monitor IDs, names and metrics.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AlertList
    ///
    open func list(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.AlertList {
        let apiPath: String = "/alerts"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AlertList = { response in
            return AppwriteModels.AlertList.from(map: response as! [String: Any])
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
    /// Get an alert by its unique ID: the monitor that raised it, when it fired
    /// and resolved, and the readings while it fired.
    ///
    /// - Parameters:
    ///   - alertId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Alert
    ///
    open func get(
        alertId: String
    ) async throws -> AppwriteModels.Alert {
        if alertId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"alertId\"")
        }

        let apiPath: String = "/alerts/{alertId}"
            .replacingOccurrences(of: "{alertId}", with: try Client.encodePath(alertId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Alert = { response in
            return AppwriteModels.Alert.from(map: response as! [String: Any])
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
    /// Acknowledge a firing alert, or undo that. Everyone who can read the alert
    /// sees who acknowledged it and when. The alert keeps firing until its monitor
    /// recovers; a resolved alert keeps its acknowledgement and cannot be changed.
    ///
    /// - Parameters:
    ///   - alertId: String
    ///   - acknowledged: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Alert
    ///
    open func update(
        alertId: String,
        acknowledged: Bool
    ) async throws -> AppwriteModels.Alert {
        if alertId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"alertId\"")
        }

        let apiPath: String = "/alerts/{alertId}"
            .replacingOccurrences(of: "{alertId}", with: try Client.encodePath(alertId))

        let apiParams: [String: Any?] = [
            "acknowledged": acknowledged
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Alert = { response in
            return AppwriteModels.Alert.from(map: response as! [String: Any])
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
