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

        self.id = try container.decode(String.self, forKey: .id)
        self.min = try container.decode(Int.self, forKey: .min)
        self.uppercase = try container.decode(Bool.self, forKey: .uppercase)
        self.lowercase = try container.decode(Bool.self, forKey: .lowercase)
        self.number = try container.decode(Bool.self, forKey: .number)
        self.symbols = try container.decode(Bool.self, forKey: .symbols)
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
            "symbols": symbols as Any
        ]
    }

    public static func from(map: [String: Any] ) -> PolicyPasswordStrength {
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
