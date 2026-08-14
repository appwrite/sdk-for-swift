import Foundation
import JSONCodable

/// Policy MFA Factors
open class PolicyMfaFactors: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case totp = "totp"
        case email = "email"
        case phone = "phone"
        case custom = "custom"
    }

    /// Policy ID.
    public let id: String
    /// Whether TOTP can be used to complete an MFA challenge.
    public let totp: Bool
    /// Whether email can be used to complete an MFA challenge.
    public let email: Bool
    /// Whether phone (SMS) can be used to complete an MFA challenge.
    public let phone: Bool
    /// Whether the custom factor can be used to complete an MFA challenge.
    public let custom: Bool

    init(
        id: String,
        totp: Bool,
        email: Bool,
        phone: Bool,
        custom: Bool
    ) {
        self.id = id
        self.totp = totp
        self.email = email
        self.phone = phone
        self.custom = custom
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.totp = try container.decode(Bool.self, forKey: .totp)
        self.email = try container.decode(Bool.self, forKey: .email)
        self.phone = try container.decode(Bool.self, forKey: .phone)
        self.custom = try container.decode(Bool.self, forKey: .custom)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(totp, forKey: .totp)
        try container.encode(email, forKey: .email)
        try container.encode(phone, forKey: .phone)
        try container.encode(custom, forKey: .custom)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "totp": totp as Any,
            "email": email as Any,
            "phone": phone as Any,
            "custom": custom as Any
        ]
    }

    public static func from(map: [String: Any] ) -> PolicyMfaFactors {
        return PolicyMfaFactors(
            id: map["$id"] as! String,
            totp: map["totp"] as! Bool,
            email: map["email"] as! Bool,
            phone: map["phone"] as! Bool,
            custom: map["custom"] as! Bool
        )
    }
}
