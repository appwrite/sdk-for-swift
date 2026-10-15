import AppwriteEnums
import Foundation
import JSONCodable

/// OAuth2Salesforce
open class OAuth2Salesforce: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case enabled = "enabled"
        case customerKey = "customerKey"
        case customerSecret = "customerSecret"
        case prompt = "prompt"
    }

    /// OAuth2 provider ID.
    public let id: String
    /// OAuth2 provider is active and can be used to create sessions.
    public let enabled: Bool
    /// Salesforce OAuth2 consumer key.
    public let customerKey: String
    /// Salesforce OAuth2 consumer secret.
    public let customerSecret: String
    /// Salesforce OAuth2 prompt values.
    public let prompt: [AppwriteEnums.OAuth2SalesforcePrompt]

    init(
        id: String,
        enabled: Bool,
        customerKey: String,
        customerSecret: String,
        prompt: [AppwriteEnums.OAuth2SalesforcePrompt]
    ) {
        self.id = id
        self.enabled = enabled
        self.customerKey = customerKey
        self.customerSecret = customerSecret
        self.prompt = prompt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.enabled = try container.contains(.enabled) ? container.decode(Bool.self, forKey: .enabled) : false
        self.customerKey = try container.contains(.customerKey) ? container.decode(String.self, forKey: .customerKey) : ""
        self.customerSecret = try container.contains(.customerSecret) ? container.decode(String.self, forKey: .customerSecret) : ""
        self.prompt = (try container.contains(.prompt) ? container.decode([String].self, forKey: .prompt) : []).map { AppwriteEnums.OAuth2SalesforcePrompt(rawValue: $0)! }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(customerKey, forKey: .customerKey)
        try container.encode(customerSecret, forKey: .customerSecret)
        try container.encode(prompt.map { $0.rawValue }, forKey: .prompt)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "customerKey": customerKey as Any,
            "customerSecret": customerSecret as Any,
            "prompt": prompt.map { $0.rawValue } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> OAuth2Salesforce {
        let defaults: [String: Any] = [
            "$id": "",
            "enabled": false,
            "customerKey": "",
            "customerSecret": "",
            "prompt": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return OAuth2Salesforce(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            customerKey: map["customerKey"] as! String,
            customerSecret: map["customerSecret"] as! String,
            prompt: (map["prompt"] as! [String]).map { AppwriteEnums.OAuth2SalesforcePrompt(rawValue: $0)! }
        )
    }
}
