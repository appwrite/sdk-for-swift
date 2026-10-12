import Foundation
import JSONCodable

/// Policy Password Strength
open class PolicyPasswordStrength: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case min = "min"
        case uppercase = "uppercase"
        case lowercase = "lowercase"
        case number = "number"
        case symbols = "symbols"
    }

    /// Policy ID.
    public let id: String
    /// Minimum password length required for user passwords.
    public let min: Int
    /// Whether passwords must include at least one uppercase letter.
    public let uppercase: Bool
    /// Whether passwords must include at least one lowercase letter.
    public let lowercase: Bool
    /// Whether passwords must include at least one number.
    public let number: Bool
    /// Whether passwords must include at least one symbol.
    public let symbols: Bool

    init(
        id: String,
        min: Int,
        uppercase: Bool,
        lowercase: Bool,
        number: Bool,
        symbols: Bool
    ) {
        self.id = id
        self.min = min
        self.uppercase = uppercase
        self.lowercase = lowercase
        self.number = number
        self.symbols = symbols
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.min = try container.contains(.min) ? container.decode(Int.self, forKey: .min) : 8
        self.uppercase = try container.contains(.uppercase) ? container.decode(Bool.self, forKey: .uppercase) : false
        self.lowercase = try container.contains(.lowercase) ? container.decode(Bool.self, forKey: .lowercase) : false
        self.number = try container.contains(.number) ? container.decode(Bool.self, forKey: .number) : false
        self.symbols = try container.contains(.symbols) ? container.decode(Bool.self, forKey: .symbols) : false
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(min, forKey: .min)
        try container.encode(uppercase, forKey: .uppercase)
        try container.encode(lowercase, forKey: .lowercase)
        try container.encode(number, forKey: .number)
        try container.encode(symbols, forKey: .symbols)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "min": min as Any,
            "uppercase": uppercase as Any,
            "lowercase": lowercase as Any,
            "number": number as Any,
            "symbols": symbols as Any,
        ]
    }

    public static func from(map: [String: Any]) -> PolicyPasswordStrength {
        let defaults: [String: Any] = [
            "$id": "",
            "min": 8,
            "uppercase": false,
            "lowercase": false,
            "number": false,
            "symbols": false,
        ]
        let map = defaults.merging(map) { _, new in new }

        return PolicyPasswordStrength(
            id: map["$id"] as! String,
            min: map["min"] as! Int,
            uppercase: map["uppercase"] as! Bool,
            lowercase: map["lowercase"] as! Bool,
            number: map["number"] as! Bool,
            symbols: map["symbols"] as! Bool
        )
    }
}
