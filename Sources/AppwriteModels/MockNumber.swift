import Foundation
import JSONCodable

/// Mock Number
open class MockNumber: Codable {

    enum CodingKeys: String, CodingKey {
        case phone = "phone"
        case otp = "otp"
    }

    /// Mock phone number for testing phone authentication. Useful for testing phone authentication without sending an SMS.
    public let phone: String
    /// Mock OTP for the number. 
    public let otp: String

    init(
        phone: String,
        otp: String
    ) {
        self.phone = phone
        self.otp = otp
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.phone = try container.decode(String.self, forKey: .phone)
        self.otp = try container.decode(String.self, forKey: .otp)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(phone, forKey: .phone)
        try container.encode(otp, forKey: .otp)
    }

    public func toMap() -> [String: Any] {
        return [
            "phone": phone as Any,
            "otp": otp as Any
        ]
    }

    public static func from(map: [String: Any] ) -> MockNumber {
        return MockNumber(
            phone: map["phone"] as! String,
            otp: map["otp"] as! String
        )
    }
}
