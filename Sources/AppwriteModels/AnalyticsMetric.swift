import Foundation
import JSONCodable

/// AnalyticsMetric
open class AnalyticsMetric: Codable {

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case date = "date"
        case visitors = "visitors"
        case sessions = "sessions"
        case pageviews = "pageviews"
        case events = "events"
        case users = "users"
        case visits = "visits"
        case bounceRate = "bounceRate"
        case visitDuration = "visitDuration"
        case viewsPerVisit = "viewsPerVisit"
        case scrollDepth = "scrollDepth"
        case engagementTime = "engagementTime"
    }

    /// Dimension value this row covers. Null when no dimension was requested, empty when the dimension could not be derived for those events.
    public let value: String?
    /// Start of the time bucket this row covers, in ISO 8601. Null when no interval was requested.
    public let date: String?
    /// Unique visitors in the requested range.
    public let visitors: Int
    /// Unique sessions in the requested range.
    public let sessions: Int
    /// Total page and screen view events (events named &quot;pageview&quot; or &quot;screen_view&quot;) in the requested range. The flat aggregate and the time series compute it; null on breakdown rows.
    public let pageviews: Int?
    /// Total events in the requested range.
    public let events: Int
    /// Unique identified users in the requested range. Anonymous events are not counted. Null on entry and exit page breakdown rows.
    public let users: Int?
    /// Total sessions with activity in the requested range. Only the flat aggregate computes it; null on breakdown and time-series rows.
    public let visits: Int?
    /// Share of bounced visits, as a percentage; a visit is a bounce unless it records two or more page or screen views, at least one interaction, or ten seconds or more of activity. An interaction is any event that is neither a view nor automatic measurement such as &quot;app_foregrounded&quot;, &quot;engagement_time&quot; or &quot;scroll_depth&quot;. Only the flat aggregate computes it; null on breakdown and time-series rows.
    public let bounceRate: Double?
    /// Average session length in seconds, measured first event to last event. Single-event sessions count as 0. Only the flat aggregate computes it; null on breakdown and time-series rows.
    public let visitDuration: Double?
    /// Average pageviews per session (pageviews divided by visits). Only the flat aggregate computes it; null on breakdown and time-series rows.
    public let viewsPerVisit: Double?
    /// Average scroll depth across events, as a percentage. Only the flat aggregate computes it; null on breakdown and time-series rows.
    public let scrollDepth: Double?
    /// Average engaged time per session in seconds, counting only foreground time. Sessions that reported no engagement are excluded. Only the flat aggregate computes it; null on breakdown and time-series rows.
    public let engagementTime: Double?

    init(
        value: String?,
        date: String?,
        visitors: Int,
        sessions: Int,
        pageviews: Int?,
        events: Int,
        users: Int?,
        visits: Int?,
        bounceRate: Double?,
        visitDuration: Double?,
        viewsPerVisit: Double?,
        scrollDepth: Double?,
        engagementTime: Double?
    ) {
        self.value = value
        self.date = date
        self.visitors = visitors
        self.sessions = sessions
        self.pageviews = pageviews
        self.events = events
        self.users = users
        self.visits = visits
        self.bounceRate = bounceRate
        self.visitDuration = visitDuration
        self.viewsPerVisit = viewsPerVisit
        self.scrollDepth = scrollDepth
        self.engagementTime = engagementTime
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.value = try container.decodeIfPresent(String.self, forKey: .value)
        self.date = try container.decodeIfPresent(String.self, forKey: .date)
        self.visitors = try container.contains(.visitors) ? container.decode(Int.self, forKey: .visitors) : 0
        self.sessions = try container.contains(.sessions) ? container.decode(Int.self, forKey: .sessions) : 0
        self.pageviews = try container.decodeIfPresent(Int.self, forKey: .pageviews)
        self.events = try container.contains(.events) ? container.decode(Int.self, forKey: .events) : 0
        self.users = try container.decodeIfPresent(Int.self, forKey: .users)
        self.visits = try container.decodeIfPresent(Int.self, forKey: .visits)
        self.bounceRate = try container.decodeIfPresent(Double.self, forKey: .bounceRate)
        self.visitDuration = try container.decodeIfPresent(Double.self, forKey: .visitDuration)
        self.viewsPerVisit = try container.decodeIfPresent(Double.self, forKey: .viewsPerVisit)
        self.scrollDepth = try container.decodeIfPresent(Double.self, forKey: .scrollDepth)
        self.engagementTime = try container.decodeIfPresent(Double.self, forKey: .engagementTime)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(value, forKey: .value)
        try container.encodeIfPresent(date, forKey: .date)
        try container.encode(visitors, forKey: .visitors)
        try container.encode(sessions, forKey: .sessions)
        try container.encodeIfPresent(pageviews, forKey: .pageviews)
        try container.encode(events, forKey: .events)
        try container.encodeIfPresent(users, forKey: .users)
        try container.encodeIfPresent(visits, forKey: .visits)
        try container.encodeIfPresent(bounceRate, forKey: .bounceRate)
        try container.encodeIfPresent(visitDuration, forKey: .visitDuration)
        try container.encodeIfPresent(viewsPerVisit, forKey: .viewsPerVisit)
        try container.encodeIfPresent(scrollDepth, forKey: .scrollDepth)
        try container.encodeIfPresent(engagementTime, forKey: .engagementTime)
    }

    public func toMap() -> [String: Any] {
        return [
            "value": value as Any,
            "date": date as Any,
            "visitors": visitors as Any,
            "sessions": sessions as Any,
            "pageviews": pageviews as Any,
            "events": events as Any,
            "users": users as Any,
            "visits": visits as Any,
            "bounceRate": bounceRate as Any,
            "visitDuration": visitDuration as Any,
            "viewsPerVisit": viewsPerVisit as Any,
            "scrollDepth": scrollDepth as Any,
            "engagementTime": engagementTime as Any,
        ]
    }

    public static func from(map: [String: Any]) -> AnalyticsMetric {
        let defaults: [String: Any] = [
            "visitors": 0,
            "sessions": 0,
            "events": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return AnalyticsMetric(
            value: map["value"] as? String,
            date: map["date"] as? String,
            visitors: map["visitors"] as! Int,
            sessions: map["sessions"] as! Int,
            pageviews: map["pageviews"] as? Int,
            events: map["events"] as! Int,
            users: map["users"] as? Int,
            visits: map["visits"] as? Int,
            bounceRate: map["bounceRate"] as? Double,
            visitDuration: map["visitDuration"] as? Double,
            viewsPerVisit: map["viewsPerVisit"] as? Double,
            scrollDepth: map["scrollDepth"] as? Double,
            engagementTime: map["engagementTime"] as? Double
        )
    }
}
