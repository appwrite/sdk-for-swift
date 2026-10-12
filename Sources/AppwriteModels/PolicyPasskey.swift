import Foundation
import JSONCodable

/// Policy Passkey
open class PolicyPasskey: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case rpId = "rpId"
        case origins = "origins"
    }

    /// Policy ID.
    public let id: String
    /// Relying party ID passkeys are bound to. Empty until configured.
    public let rpId: String
    /// Web origins passkeys work on, from the project&#039;s platforms on the relying party ID and a localhost web platform. Read-only.
    public let origins: [String]

    init(
        id: String,
        rpId: String,
        origins: [String]
    ) {
        self.id = id
        self.rpId = rpId
        self.origins = origins
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.rpId = try container.contains(.rpId) ? container.decode(String.self, forKey: .rpId) : ""
        self.origins = try container.contains(.origins) ? container.decode([String].self, forKey: .origins) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(rpId, forKey: .rpId)
        try container.encode(origins, forKey: .origins)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "rpId": rpId as Any,
            "origins": origins as Any,
        ]
    }

    public static func from(map: [String: Any]) -> PolicyPasskey {
        let defaults: [String: Any] = [
            "$id": "",
            "rpId": "",
            "origins": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return PolicyPasskey(
            id: map["$id"] as! String,
            rpId: map["rpId"] as! String,
            origins: map["origins"] as! [String]
        )
    }
}
