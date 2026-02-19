import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// 
open class Activities: Service {

    ///
    /// List all events for selected filters.
    ///
    /// - Parameters:
    ///   - queries: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ActivityEventList
    ///
    open func listEvents(
        queries: String? = nil
    ) async throws -> AppwriteModels.ActivityEventList {
        let apiPath: String = "/activities/events"

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.ActivityEventList = { response in
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
    ///
    /// - Parameters:
    ///   - eventId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ActivityEvent
    ///
    open func getEvent(
        eventId: String
    ) async throws -> AppwriteModels.ActivityEvent {
        let apiPath: String = "/activities/events/{eventId}"
            .replacingOccurrences(of: "{eventId}", with: eventId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.ActivityEvent = { response in
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