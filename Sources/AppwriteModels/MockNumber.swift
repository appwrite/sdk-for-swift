import Foundation
import JSONCodable

/// Mock Number
open class MockNumber: Codable {

    enum CodingKeys: String, CodingKey {
        case number = "number"
        case otp = "otp"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
    }

    /// Mock phone number for testing phone authentication. Useful for testing phone authentication without sending an SMS.
    public let number: String
    /// Mock OTP for the number.
    public let otp: String
    /// Attribute creation date in ISO 8601 format.
    public let createdAt: String
    /// Attribute update date in ISO 8601 format.
    public let updatedAt: String

    init(
        number: String,
        otp: String,
        createdAt: String,
        updatedAt: String
    ) {
        self.number = number
        self.otp = otp
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.number = try container.contains(.number) ? container.decode(String.self, forKey: .number) : ""
        self.otp = try container.contains(.otp) ? container.decode(String.self, forKey: .otp) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(number, forKey: .number)
        try container.encode(otp, forKey: .otp)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
    }

    public func toMap() -> [String: Any] {
        return [
            "number": number as Any,
            "otp": otp as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
        ]
    }

    public static func from(map: [String: Any]) -> MockNumber {
        let defaults: [String: Any] = [
            "number": "",
            "otp": "",
            "$createdAt": "",
            "$updatedAt": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return MockNumber(
            number: map["number"] as! String,
            otp: map["otp"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String
        )
    }
}
