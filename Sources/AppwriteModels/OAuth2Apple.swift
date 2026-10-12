import Foundation
import JSONCodable

/// OAuth2Apple
open class OAuth2Apple: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case serviceId = "serviceId"
        case keyId = "keyId"
        case teamId = "teamId"
        case p8File = "p8File"
        case nativeEnabled = "nativeEnabled"
        case nativeClientIds = "nativeClientIds"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// Apple OAuth2 service ID.
    public let serviceId: String
    /// Apple OAuth2 key ID.
    public let keyId: String
    /// Apple OAuth2 team ID.
    public let teamId: String
    /// Apple OAuth2 .p8 private key file contents. The secret key wrapped by the PEM markers is 200 characters long.
    public let p8File: String
    /// Native Sign in with Apple is active and can be used to create sessions from an ID token. Independent of enabled, which only controls the browser-based flow.
    public let nativeEnabled: Bool
    /// App bundle IDs accepted as ID token audiences for native Sign in with Apple, next to the Services ID.
    public let nativeClientIds: [String]

    init(
        id: String,
        enabled: Bool,
        serviceId: String,
        keyId: String,
        teamId: String,
        p8File: String,
        nativeEnabled: Bool,
        nativeClientIds: [String]
    ) {
        self.id = id
        self.enabled = enabled
        self.serviceId = serviceId
        self.keyId = keyId
        self.teamId = teamId
        self.p8File = p8File
        self.nativeEnabled = nativeEnabled
        self.nativeClientIds = nativeClientIds
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.enabled = try container.contains(.enabled) ? container.decode(Bool.self, forKey: .enabled) : false
        self.serviceId = try container.contains(.serviceId) ? container.decode(String.self, forKey: .serviceId) : ""
        self.keyId = try container.contains(.keyId) ? container.decode(String.self, forKey: .keyId) : ""
        self.teamId = try container.contains(.teamId) ? container.decode(String.self, forKey: .teamId) : ""
        self.p8File = try container.contains(.p8File) ? container.decode(String.self, forKey: .p8File) : ""
        self.nativeEnabled = try container.contains(.nativeEnabled) ? container.decode(Bool.self, forKey: .nativeEnabled) : false
        self.nativeClientIds = try container.contains(.nativeClientIds) ? container.decode([String].self, forKey: .nativeClientIds) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(serviceId, forKey: .serviceId)
        try container.encode(keyId, forKey: .keyId)
        try container.encode(teamId, forKey: .teamId)
        try container.encode(p8File, forKey: .p8File)
        try container.encode(nativeEnabled, forKey: .nativeEnabled)
        try container.encode(nativeClientIds, forKey: .nativeClientIds)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "serviceId": serviceId as Any,
            "keyId": keyId as Any,
            "teamId": teamId as Any,
            "p8File": p8File as Any,
            "nativeEnabled": nativeEnabled as Any,
            "nativeClientIds": nativeClientIds as Any,
        ]
    }

    public static func from(map: [String: Any]) -> OAuth2Apple {
        let defaults: [String: Any] = [
            "$id": "",
            "enabled": false,
            "serviceId": "",
            "keyId": "",
            "teamId": "",
            "p8File": "",
            "nativeEnabled": false,
            "nativeClientIds": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return OAuth2Apple(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            serviceId: map["serviceId"] as! String,
            keyId: map["keyId"] as! String,
            teamId: map["teamId"] as! String,
            p8File: map["p8File"] as! String,
            nativeEnabled: map["nativeEnabled"] as! Bool,
            nativeClientIds: map["nativeClientIds"] as! [String]
        )
    }
}
