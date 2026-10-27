import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

/// The Activities service allows you to list and inspect project activity events.
open class Activities: Service {

    ///
    /// List all events for selected filters.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ActivityEventList
    ///
    open func listEvents(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.ActivityEventList {
        let apiPath: String = "/activities/events"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.ActivityEventList = { response in
            return AppwriteModels.ActivityEventList.from(map: response as! [String: Any])
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
    /// Get event by ID.
    ///
    /// - Parameters:
    ///   - eventId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ActivityEvent
    ///
    open func getEvent(
        eventId: String
    ) async throws -> AppwriteModels.ActivityEvent {
        if eventId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"eventId\"")
        }

        let apiPath: String = "/activities/events/{eventId}"
            .replacingOccurrences(of: "{eventId}", with: try Client.encodePath(eventId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.ActivityEvent = { response in
            return AppwriteModels.ActivityEvent.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }
}
