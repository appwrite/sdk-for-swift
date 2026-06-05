import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// 
open class Usage: Service {

    ///
    /// Query usage event metrics from the usage database. Returns individual event
    /// rows with full metadata. Pass Query objects as JSON strings to filter,
    /// paginate, and order results. Supported query methods: equal,
    /// greaterThanEqual, lessThanEqual, orderAsc, orderDesc, limit, offset.
    /// Supported filter attributes: metric, path, method, status, resource,
    /// resourceId, country, userAgent, time (these match the underlying column
    /// names — note that the response surfaces `resource` as `resourceType` and
    /// `country` as `countryCode`). When no time filter is supplied the endpoint
    /// defaults to the last 7 days. Default `limit(100)` is applied if none is
    /// given; user-supplied limits are capped at 500. The `total` field is capped
    /// at 5000 to keep counts predictable — pass `total=false` to skip the count
    /// entirely.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.UsageEventList
    ///
    open func listEvents(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.UsageEventList {
        let apiPath: String = "/usage/events"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? ""
        ]

        let converter: (Any) throws -> AppwriteModels.UsageEventList = { response in
            return AppwriteModels.UsageEventList.from(map: response as! [String: Any])
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
    /// Query usage gauge metrics (point-in-time resource snapshots) from the usage
    /// database. Returns individual gauge snapshots with metric, value, timestamp,
    /// resourceType, and resourceId. Pass Query objects as JSON strings to filter,
    /// paginate, and order results. Supported query methods: equal,
    /// greaterThanEqual, lessThanEqual, orderAsc, orderDesc, limit, offset.
    /// Supported filter attributes: metric, time. Use `orderDesc("time"),
    /// limit(1)` to fetch the most recent snapshot. When no time filter is
    /// supplied the endpoint defaults to the last 7 days. Default `limit(100)` is
    /// applied if none is given; user-supplied limits are capped at 500. The
    /// `total` field is capped at 5000 to keep counts predictable — pass
    /// `total=false` to skip the count entirely.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.UsageGaugeList
    ///
    open func listGauges(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.UsageGaugeList {
        let apiPath: String = "/usage/gauges"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? ""
        ]

        let converter: (Any) throws -> AppwriteModels.UsageGaugeList = { response in
            return AppwriteModels.UsageGaugeList.from(map: response as! [String: Any])
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
