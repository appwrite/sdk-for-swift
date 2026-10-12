import AppwriteEnums
import Foundation
import JSONCodable

/// Domain
open class Domain: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case domain = "domain"
        case registrar = "registrar"
        case nameservers = "nameservers"
        case expire = "expire"
        case renewal = "renewal"
        case autoRenewal = "autoRenewal"
        case renewalPrice = "renewalPrice"
        case transferStatus = "transferStatus"
        case teamId = "teamId"
        case dnsRecords = "dnsRecords"
    }

    /// Domain ID.
    public let id: String
    /// Domain creation time in ISO 8601 format.
    public let createdAt: String
    /// Domain update date in ISO 8601 format.
    public let updatedAt: String
    /// Domain name.
    public let domain: String
    /// Domain registrar (e.g. &quot;appwrite&quot; or &quot;third_party&quot;).
    public let registrar: String
    /// Nameservers setting. &quot;Appwrite&quot; or empty string.
    public let nameservers: String
    /// Domain expiry date in ISO 8601 format.
    public let expire: String
    /// Domain renewal date in ISO 8601 format.
    public let renewal: String
    /// If set to true, the domain will automatically renew.
    public let autoRenewal: Bool
    /// Renewal price (in cents).
    public let renewalPrice: Int
    /// Transfer status for domains being transferred in. Null when the domain is not being transferred.
    public let transferStatus: AppwriteEnums.DomainTransferStatusEnum?
    /// Team ID.
    public let teamId: String
    /// Dns records
    public let dnsRecords: [DnsRecord]

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        domain: String,
        registrar: String,
        nameservers: String,
        expire: String,
        renewal: String,
        autoRenewal: Bool,
        renewalPrice: Int,
        transferStatus: AppwriteEnums.DomainTransferStatusEnum?,
        teamId: String,
        dnsRecords: [DnsRecord]
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.domain = domain
        self.registrar = registrar
        self.nameservers = nameservers
        self.expire = expire
        self.renewal = renewal
        self.autoRenewal = autoRenewal
        self.renewalPrice = renewalPrice
        self.transferStatus = transferStatus
        self.teamId = teamId
        self.dnsRecords = dnsRecords
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.domain = try container.contains(.domain) ? container.decode(String.self, forKey: .domain) : ""
        self.registrar = try container.contains(.registrar) ? container.decode(String.self, forKey: .registrar) : ""
        self.nameservers = try container.contains(.nameservers) ? container.decode(String.self, forKey: .nameservers) : ""
        self.expire = try container.contains(.expire) ? container.decode(String.self, forKey: .expire) : ""
        self.renewal = try container.contains(.renewal) ? container.decode(String.self, forKey: .renewal) : ""
        self.autoRenewal = try container.contains(.autoRenewal) ? container.decode(Bool.self, forKey: .autoRenewal) : false
        self.renewalPrice = try container.contains(.renewalPrice) ? container.decode(Int.self, forKey: .renewalPrice) : 0
        if let transferStatusString = try container.decodeIfPresent(String.self, forKey: .transferStatus) {
            self.transferStatus = AppwriteEnums.DomainTransferStatusEnum(rawValue: transferStatusString)
        } else {
            self.transferStatus = nil
        }
        self.teamId = try container.contains(.teamId) ? container.decode(String.self, forKey: .teamId) : ""
        self.dnsRecords = try container.decode([DnsRecord].self, forKey: .dnsRecords)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(domain, forKey: .domain)
        try container.encode(registrar, forKey: .registrar)
        try container.encode(nameservers, forKey: .nameservers)
        try container.encode(expire, forKey: .expire)
        try container.encode(renewal, forKey: .renewal)
        try container.encode(autoRenewal, forKey: .autoRenewal)
        try container.encode(renewalPrice, forKey: .renewalPrice)
        try container.encodeIfPresent(transferStatus?.rawValue, forKey: .transferStatus)
        try container.encode(teamId, forKey: .teamId)
        try container.encode(dnsRecords, forKey: .dnsRecords)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "domain": domain as Any,
            "registrar": registrar as Any,
            "nameservers": nameservers as Any,
            "expire": expire as Any,
            "renewal": renewal as Any,
            "autoRenewal": autoRenewal as Any,
            "renewalPrice": renewalPrice as Any,
            "transferStatus": transferStatus?.rawValue as Any,
            "teamId": teamId as Any,
            "dnsRecords": dnsRecords.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Domain {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "domain": "",
            "registrar": "",
            "nameservers": "",
            "expire": "",
            "renewal": "",
            "autoRenewal": false,
            "renewalPrice": 0,
            "teamId": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return Domain(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            domain: map["domain"] as! String,
            registrar: map["registrar"] as! String,
            nameservers: map["nameservers"] as! String,
            expire: map["expire"] as! String,
            renewal: map["renewal"] as! String,
            autoRenewal: map["autoRenewal"] as! Bool,
            renewalPrice: map["renewalPrice"] as! Int,
            transferStatus: map["transferStatus"] as? String != nil ? AppwriteEnums.DomainTransferStatusEnum(rawValue: map["transferStatus"] as! String) : nil,
            teamId: map["teamId"] as! String,
            dnsRecords: (map["dnsRecords"] as! [[String: Any]]).map { DnsRecord.from(map: $0) }
        )
    }
}
