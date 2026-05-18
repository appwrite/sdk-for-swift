import Foundation
import JSONCodable

/// usageEvent
open class UsageEvent: Codable {

    enum CodingKeys: String, CodingKey {
        case metric = "metric"
        case value = "value"
        case time = "time"
        case path = "path"
        case method = "method"
        case status = "status"
        case resourceType = "resourceType"
        case resourceId = "resourceId"
        case countryCode = "countryCode"
        case userAgent = "userAgent"
    }

    /// The metric key.
    public let metric: String
    /// The metric value.
    public let value: Int
    /// The event timestamp.
    public let time: String
    /// The API endpoint path.
    public let path: String
    /// The HTTP method.
    public let method: String
    /// HTTP status code. Stored as string to preserve unset state (empty string = not available).
    public let status: String
    /// The resource type.
    public let resourceType: String
    /// The resource ID.
    public let resourceId: String
    /// Country code in [ISO 3166-1](http://en.wikipedia.org/wiki/ISO_3166-1) two-character format.
    public let countryCode: String
    /// The user agent string.
    public let userAgent: String

    init(
        metric: String,
        value: Int,
        time: String,
        path: String,
        method: String,
        status: String,
        resourceType: String,
        resourceId: String,
        countryCode: String,
        userAgent: String
    ) {
        self.metric = metric
        self.value = value
        self.time = time
        self.path = path
        self.method = method
        self.status = status
        self.resourceType = resourceType
        self.resourceId = resourceId
        self.countryCode = countryCode
        self.userAgent = userAgent
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.metric = try container.decode(String.self, forKey: .metric)
        self.value = try container.decode(Int.self, forKey: .value)
        self.time = try container.decode(String.self, forKey: .time)
        self.path = try container.decode(String.self, forKey: .path)
        self.method = try container.decode(String.self, forKey: .method)
        self.status = try container.decode(String.self, forKey: .status)
        self.resourceType = try container.decode(String.self, forKey: .resourceType)
        self.resourceId = try container.decode(String.self, forKey: .resourceId)
        self.countryCode = try container.decode(String.self, forKey: .countryCode)
        self.userAgent = try container.decode(String.self, forKey: .userAgent)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(metric, forKey: .metric)
        try container.encode(value, forKey: .value)
        try container.encode(time, forKey: .time)
        try container.encode(path, forKey: .path)
        try container.encode(method, forKey: .method)
        try container.encode(status, forKey: .status)
        try container.encode(resourceType, forKey: .resourceType)
        try container.encode(resourceId, forKey: .resourceId)
        try container.encode(countryCode, forKey: .countryCode)
        try container.encode(userAgent, forKey: .userAgent)
    }

    public func toMap() -> [String: Any] {
        return [
            "metric": metric as Any,
            "value": value as Any,
            "time": time as Any,
            "path": path as Any,
            "method": method as Any,
            "status": status as Any,
            "resourceType": resourceType as Any,
            "resourceId": resourceId as Any,
            "countryCode": countryCode as Any,
            "userAgent": userAgent as Any
        ]
    }

    public static func from(map: [String: Any] ) -> UsageEvent {
        return UsageEvent(
            metric: map["metric"] as! String,
            value: map["value"] as! Int,
            time: map["time"] as! String,
            path: map["path"] as! String,
            method: map["method"] as! String,
            status: map["status"] as! String,
            resourceType: map["resourceType"] as! String,
            resourceId: map["resourceId"] as! String,
            countryCode: map["countryCode"] as! String,
            userAgent: map["userAgent"] as! String
        )
    }
}
