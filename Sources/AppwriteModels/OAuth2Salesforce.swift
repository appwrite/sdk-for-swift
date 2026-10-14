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
    public let prompt: [AppwriteEnums.OAuth2SalesforcePrompt]?

    init(
        id: String,
        enabled: Bool,
        customerKey: String,
        customerSecret: String,
        prompt: [AppwriteEnums.OAuth2SalesforcePrompt]?
    ) {
        self.id = id
        self.enabled = enabled
        self.customerKey = customerKey
        self.customerSecret = customerSecret
        self.prompt = prompt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.customerKey = try container.decode(String.self, forKey: .customerKey)
        self.customerSecret = try container.decode(String.self, forKey: .customerSecret)
        if let promptStrings = try container.decodeIfPresent([String].self, forKey: .prompt) {
            self.prompt = promptStrings.map { AppwriteEnums.OAuth2SalesforcePrompt(rawValue: $0)! }
        } else {
            self.prompt = nil
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(customerKey, forKey: .customerKey)
        try container.encode(customerSecret, forKey: .customerSecret)
        try container.encodeIfPresent(prompt?.map { $0.rawValue }, forKey: .prompt)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "enabled": enabled as Any,
            "customerKey": customerKey as Any,
            "customerSecret": customerSecret as Any,
            "prompt": prompt?.map { $0.rawValue } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> OAuth2Salesforce {
        return OAuth2Salesforce(
            id: map["$id"] as! String,
            enabled: map["enabled"] as! Bool,
            customerKey: map["customerKey"] as! String,
            customerSecret: map["customerSecret"] as! String,
            prompt: (map["prompt"] as? [String])?.map { AppwriteEnums.OAuth2SalesforcePrompt(rawValue: $0)! }
        )
    }
}
