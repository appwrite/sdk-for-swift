import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

///
open class Analytics: Service {

    ///
    /// List analytics properties for the current project.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AnalyticsPropertyList
    ///
    open func listProperties(
        queries: [String]? = nil,
        search: String? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.AnalyticsPropertyList {
        let apiPath: String = "/analytics/properties"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search,
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AnalyticsPropertyList = { response in
            return AppwriteModels.AnalyticsPropertyList.from(map: response as! [String: Any])
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
    /// Create a new analytics property to track a website or application.
    ///
    /// - Parameters:
    ///   - propertyId: String
    ///   - name: String
    ///   - domain: String (optional)
    ///   - enabled: Bool (optional)
    ///   - allowedOrigins: [String] (optional)
    ///   - identifyUsers: Bool (optional)
    ///   - type: AppwriteEnums.AnalyticsPropertyType (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AnalyticsProperty
    ///
    open func createProperty(
        propertyId: String,
        name: String,
        domain: String? = nil,
        enabled: Bool? = nil,
        allowedOrigins: [String]? = nil,
        identifyUsers: Bool? = nil,
        type: AppwriteEnums.AnalyticsPropertyType? = nil
    ) async throws -> AppwriteModels.AnalyticsProperty {
        let apiPath: String = "/analytics/properties"

        let apiParams: [String: Any?] = [
            "propertyId": propertyId,
            "name": name,
            "domain": domain,
            "enabled": enabled,
            "allowedOrigins": allowedOrigins,
            "identifyUsers": identifyUsers,
            "type": type?.rawValue,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AnalyticsProperty = { response in
            return AppwriteModels.AnalyticsProperty.from(map: response as! [String: Any])
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
    /// Get an analytics property by ID.
    ///
    /// - Parameters:
    ///   - propertyId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AnalyticsProperty
    ///
    open func getProperty(
        propertyId: String
    ) async throws -> AppwriteModels.AnalyticsProperty {
        if propertyId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"propertyId\"")
        }

        let apiPath: String = "/analytics/properties/{propertyId}"
            .replacingOccurrences(of: "{propertyId}", with: try Client.encodePath(propertyId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AnalyticsProperty = { response in
            return AppwriteModels.AnalyticsProperty.from(map: response as! [String: Any])
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
    /// Update an analytics property. Only the attributes you pass are changed;
    /// omitted attributes keep their current value.
    ///
    /// - Parameters:
    ///   - propertyId: String
    ///   - name: String (optional)
    ///   - domain: String (optional)
    ///   - enabled: Bool (optional)
    ///   - allowedOrigins: [String] (optional)
    ///   - identifyUsers: Bool (optional)
    ///   - type: AppwriteEnums.AnalyticsPropertyType (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AnalyticsProperty
    ///
    open func updateProperty(
        propertyId: String,
        name: String? = nil,
        domain: String? = nil,
        enabled: Bool? = nil,
        allowedOrigins: [String]? = nil,
        identifyUsers: Bool? = nil,
        type: AppwriteEnums.AnalyticsPropertyType? = nil
    ) async throws -> AppwriteModels.AnalyticsProperty {
        if propertyId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"propertyId\"")
        }

        let apiPath: String = "/analytics/properties/{propertyId}"
            .replacingOccurrences(of: "{propertyId}", with: try Client.encodePath(propertyId))

        let apiParams: [String: Any?] = [
            "name": name,
            "domain": domain,
            "enabled": enabled,
            "allowedOrigins": allowedOrigins,
            "identifyUsers": identifyUsers,
            "type": type?.rawValue,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AnalyticsProperty = { response in
            return AppwriteModels.AnalyticsProperty.from(map: response as! [String: Any])
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
    /// Delete an analytics property along with every event and session collected
    /// for it. This cannot be undone.
    ///
    /// - Parameters:
    ///   - propertyId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteProperty(
        propertyId: String
    ) async throws -> Any {
        if propertyId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"propertyId\"")
        }

        let apiPath: String = "/analytics/properties/{propertyId}"
            .replacingOccurrences(of: "{propertyId}", with: try Client.encodePath(propertyId))

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
    ///
    /// List the annotations of an analytics property. Filter on `date` to fetch
    /// the annotations inside a chart's time range.
    ///
    /// - Parameters:
    ///   - propertyId: String
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AnalyticsAnnotationList
    ///
    open func listAnnotations(
        propertyId: String,
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.AnalyticsAnnotationList {
        if propertyId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"propertyId\"")
        }

        let apiPath: String = "/analytics/properties/{propertyId}/annotations"
            .replacingOccurrences(of: "{propertyId}", with: try Client.encodePath(propertyId))

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AnalyticsAnnotationList = { response in
            return AppwriteModels.AnalyticsAnnotationList.from(map: response as! [String: Any])
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
    /// Create an annotation that marks a point in time on an analytics property's
    /// charts.
    ///
    /// - Parameters:
    ///   - propertyId: String
    ///   - annotationId: String
    ///   - date: String
    ///   - content: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AnalyticsAnnotation
    ///
    open func createAnnotation(
        propertyId: String,
        annotationId: String,
        date: String,
        content: String
    ) async throws -> AppwriteModels.AnalyticsAnnotation {
        if propertyId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"propertyId\"")
        }

        let apiPath: String = "/analytics/properties/{propertyId}/annotations"
            .replacingOccurrences(of: "{propertyId}", with: try Client.encodePath(propertyId))

        let apiParams: [String: Any?] = [
            "annotationId": annotationId,
            "date": date,
            "content": content,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AnalyticsAnnotation = { response in
            return AppwriteModels.AnalyticsAnnotation.from(map: response as! [String: Any])
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
    /// Get an analytics annotation by ID.
    ///
    /// - Parameters:
    ///   - propertyId: String
    ///   - annotationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AnalyticsAnnotation
    ///
    open func getAnnotation(
        propertyId: String,
        annotationId: String
    ) async throws -> AppwriteModels.AnalyticsAnnotation {
        if propertyId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"propertyId\"")
        }
        if annotationId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"annotationId\"")
        }

        let apiPath: String = "/analytics/properties/{propertyId}/annotations/{annotationId}"
            .replacingOccurrences(of: "{propertyId}", with: try Client.encodePath(propertyId))
            .replacingOccurrences(of: "{annotationId}", with: try Client.encodePath(annotationId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AnalyticsAnnotation = { response in
            return AppwriteModels.AnalyticsAnnotation.from(map: response as! [String: Any])
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
    /// Update an analytics annotation. Only the attributes you pass are changed;
    /// omitted attributes keep their current value.
    ///
    /// - Parameters:
    ///   - propertyId: String
    ///   - annotationId: String
    ///   - date: String (optional)
    ///   - content: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AnalyticsAnnotation
    ///
    open func updateAnnotation(
        propertyId: String,
        annotationId: String,
        date: String? = nil,
        content: String? = nil
    ) async throws -> AppwriteModels.AnalyticsAnnotation {
        if propertyId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"propertyId\"")
        }
        if annotationId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"annotationId\"")
        }

        let apiPath: String = "/analytics/properties/{propertyId}/annotations/{annotationId}"
            .replacingOccurrences(of: "{propertyId}", with: try Client.encodePath(propertyId))
            .replacingOccurrences(of: "{annotationId}", with: try Client.encodePath(annotationId))

        let apiParams: [String: Any?] = [
            "date": date,
            "content": content,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AnalyticsAnnotation = { response in
            return AppwriteModels.AnalyticsAnnotation.from(map: response as! [String: Any])
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
    /// Delete an analytics annotation.
    ///
    /// - Parameters:
    ///   - propertyId: String
    ///   - annotationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteAnnotation(
        propertyId: String,
        annotationId: String
    ) async throws -> Any {
        if propertyId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"propertyId\"")
        }
        if annotationId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"annotationId\"")
        }

        let apiPath: String = "/analytics/properties/{propertyId}/annotations/{annotationId}"
            .replacingOccurrences(of: "{propertyId}", with: try Client.encodePath(propertyId))
            .replacingOccurrences(of: "{annotationId}", with: try Client.encodePath(annotationId))

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
    ///
    /// Send a tracking event from a browser, native app, or server-side SDK.
    ///
    /// - Parameters:
    ///   - propertyId: String
    ///   - name: String
    ///   - url: String
    ///   - domain: String (optional)
    ///   - referrer: String (optional)
    ///   - screenWidth: Int (optional)
    ///   - sessionHash: String (optional)
    ///   - scrollDepth: Int (optional)
    ///   - engagementTime: Int (optional)
    ///   - props: [String] (optional)
    ///   - userId: String (optional)
    ///   - ip: String (optional)
    ///   - userAgent: String (optional)
    ///   - interactive: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func createEvent(
        propertyId: String,
        name: String,
        url: String,
        domain: String? = nil,
        referrer: String? = nil,
        screenWidth: Int? = nil,
        sessionHash: String? = nil,
        scrollDepth: Int? = nil,
        engagementTime: Int? = nil,
        props: [String]? = nil,
        userId: String? = nil,
        ip: String? = nil,
        userAgent: String? = nil,
        interactive: Bool? = nil
    ) async throws -> Any {
        if propertyId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"propertyId\"")
        }

        let apiPath: String = "/analytics/properties/{propertyId}/events"
            .replacingOccurrences(of: "{propertyId}", with: try Client.encodePath(propertyId))

        let apiParams: [String: Any?] = [
            "name": name,
            "url": url,
            "domain": domain,
            "referrer": referrer,
            "screenWidth": screenWidth,
            "sessionHash": sessionHash,
            "scrollDepth": scrollDepth,
            "engagementTime": engagementTime,
            "props": props,
            "userId": userId,
            "ip": ip,
            "userAgent": userAgent,
            "interactive": interactive,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Read analytics metrics (visitors, sessions, pageviews, events, bounceRate,
    /// …) for a property over a date range.
    ///
    /// **Three response shapes**, chosen by `dimensions[]` and `interval`:
    /// - Neither: one row aggregating the whole window, with `value` and `date`
    /// null. Only this shape carries `visits`, `bounceRate`, `visitDuration`,
    /// `viewsPerVisit`, `scrollDepth` and `engagementTime`.
    /// - `dimensions[]`: one row per dimension value, ranked by visitors, with
    /// `value` set and `date` null.
    /// - `interval`: one row per time bucket in chronological order, with `date`
    /// set and `value` null.
    ///
    /// `pageviews` is carried by the flat aggregate and by `interval`, but not by
    /// a breakdown.
    ///
    /// `userId` and `users` cover identified traffic only: events sent with an API
    /// key's `userId`, or from a signed-in session on a property with
    /// `identifyUsers` on. A `userId` breakdown leaves out anonymous events;
    /// returned values are the project's user IDs.
    ///
    /// Custom event props: `dimensions[]=props` ranks the prop keys seen in the
    /// window, and adding `propKey` ranks the values of that one key. `queries[]`
    /// filters on a prop's value with the `props.<key>` attribute, e.g.
    /// `equal("props.plan", ["pro"])`.
    ///
    /// Combining `dimensions[]` with `interval` is not supported yet. `queries[]`
    /// filters the underlying events using standard Utopia query syntax.
    ///
    /// - Parameters:
    ///   - propertyId: String
    ///   - queries: [String] (optional)
    ///   - interval: AppwriteEnums.AnalyticsInterval (optional)
    ///   - dimensions: [AppwriteEnums.AnalyticsDimension] (optional)
    ///   - propKey: String (optional)
    ///   - dateRange: String (optional)
    ///   - startAt: String (optional)
    ///   - endAt: String (optional)
    ///   - limit: Int (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AnalyticsMetricList
    ///
    open func listMetrics(
        propertyId: String,
        queries: [String]? = nil,
        interval: AppwriteEnums.AnalyticsInterval? = nil,
        dimensions: [AppwriteEnums.AnalyticsDimension]? = nil,
        propKey: String? = nil,
        dateRange: String? = nil,
        startAt: String? = nil,
        endAt: String? = nil,
        limit: Int? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.AnalyticsMetricList {
        if propertyId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"propertyId\"")
        }

        let apiPath: String = "/analytics/properties/{propertyId}/metrics"
            .replacingOccurrences(of: "{propertyId}", with: try Client.encodePath(propertyId))

        let apiParams: [String: Any?] = [
            "queries": queries,
            "interval": interval?.rawValue,
            "dimensions": dimensions?.map { $0.rawValue },
            "propKey": propKey,
            "dateRange": dateRange,
            "startAt": startAt,
            "endAt": endAt,
            "limit": limit,
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AnalyticsMetricList = { response in
            return AppwriteModels.AnalyticsMetricList.from(map: response as! [String: Any])
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
