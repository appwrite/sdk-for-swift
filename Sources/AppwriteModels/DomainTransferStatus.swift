import AppwriteEnums
import Foundation
import JSONCodable

/// domainTransferStatus
open class DomainTransferStatus: Codable {

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case reason = "reason"
        case timestamp = "timestamp"
    }

    /// Transfer status.
    public let status: AppwriteEnums.DomainTransferStatusEnum
    /// Additional transfer status information.
    public let reason: String
    /// Transfer status timestamp in ISO 8601 format.
    public let timestamp: String

    init(
        status: AppwriteEnums.DomainTransferStatusEnum,
        reason: String,
        timestamp: String
    ) {
        self.status = status
        self.reason = reason
        self.timestamp = timestamp
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.status = AppwriteEnums.DomainTransferStatusEnum(rawValue: try container.contains(.status) ? container.decode(String.self, forKey: .status) : "pending_registry")!
        self.reason = try container.contains(.reason) ? container.decode(String.self, forKey: .reason) : ""
        self.timestamp = try container.contains(.timestamp) ? container.decode(String.self, forKey: .timestamp) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(status.rawValue, forKey: .status)
        try container.encode(reason, forKey: .reason)
        try container.encode(timestamp, forKey: .timestamp)
    }

    public func toMap() -> [String: Any] {
        return [
            "status": status.rawValue as Any,
            "reason": reason as Any,
            "timestamp": timestamp as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DomainTransferStatus {
        let defaults: [String: Any] = [
            "status": "pending_registry",
            "reason": "",
            "timestamp": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return DomainTransferStatus(
            status: AppwriteEnums.DomainTransferStatusEnum(rawValue: map["status"] as! String)!,
            reason: map["reason"] as! String,
            timestamp: map["timestamp"] as! String
        )
    }
}
