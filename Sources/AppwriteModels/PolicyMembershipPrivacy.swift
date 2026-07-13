import Foundation
import JSONCodable

/// Policy Membership Privacy
open class PolicyMembershipPrivacy: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case userId = "userId"
        case userEmail = "userEmail"
        case userPhone = "userPhone"
        case userName = "userName"
        case userMFA = "userMFA"
        case userAccessedAt = "userAccessedAt"
    }

    /// Policy ID.
    public let id: String
    /// Whether user ID is visible in memberships.
    public let userId: Bool
    /// Whether user email is visible in memberships.
    public let userEmail: Bool
    /// Whether user phone is visible in memberships.
    public let userPhone: Bool
    /// Whether user name is visible in memberships.
    public let userName: Bool
    /// Whether user MFA status is visible in memberships.
    public let userMFA: Bool
    /// Whether user last access time is visible in memberships.
    public let userAccessedAt: Bool

    init(
        id: String,
        userId: Bool,
        userEmail: Bool,
        userPhone: Bool,
        userName: Bool,
        userMFA: Bool,
        userAccessedAt: Bool
    ) {
        self.id = id
        self.userId = userId
        self.userEmail = userEmail
        self.userPhone = userPhone
        self.userName = userName
        self.userMFA = userMFA
        self.userAccessedAt = userAccessedAt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.userId = try container.decode(Bool.self, forKey: .userId)
        self.userEmail = try container.decode(Bool.self, forKey: .userEmail)
        self.userPhone = try container.decode(Bool.self, forKey: .userPhone)
        self.userName = try container.decode(Bool.self, forKey: .userName)
        self.userMFA = try container.decode(Bool.self, forKey: .userMFA)
        self.userAccessedAt = try container.decode(Bool.self, forKey: .userAccessedAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(userId, forKey: .userId)
        try container.encode(userEmail, forKey: .userEmail)
        try container.encode(userPhone, forKey: .userPhone)
        try container.encode(userName, forKey: .userName)
        try container.encode(userMFA, forKey: .userMFA)
        try container.encode(userAccessedAt, forKey: .userAccessedAt)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "userId": userId as Any,
            "userEmail": userEmail as Any,
            "userPhone": userPhone as Any,
            "userName": userName as Any,
            "userMFA": userMFA as Any,
            "userAccessedAt": userAccessedAt as Any
        ]
    }

    public static func from(map: [String: Any] ) -> PolicyMembershipPrivacy {
        return PolicyMembershipPrivacy(
            id: map["$id"] as! String,
            userId: map["userId"] as! Bool,
            userEmail: map["userEmail"] as! Bool,
            userPhone: map["userPhone"] as! Bool,
            userName: map["userName"] as! Bool,
            userMFA: map["userMFA"] as! Bool,
            userAccessedAt: map["userAccessedAt"] as! Bool
        )
    }
}
