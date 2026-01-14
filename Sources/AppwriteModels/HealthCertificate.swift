import Foundation
import JSONCodable

/// Health Certificate
open class HealthCertificate: Codable {

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case subjectSN = "subjectSN"
        case issuerOrganisation = "issuerOrganisation"
        case validFrom = "validFrom"
        case validTo = "validTo"
        case signatureTypeSN = "signatureTypeSN"
    }

    /// Certificate name
    public let name: String
    /// Subject SN
    public let subjectSN: String
    /// Issuer organisation
    public let issuerOrganisation: String
    /// Valid from
    public let validFrom: String
    /// Valid to
    public let validTo: String
    /// Signature type SN
    public let signatureTypeSN: String

    init(
        name: String,
        subjectSN: String,
        issuerOrganisation: String,
        validFrom: String,
        validTo: String,
        signatureTypeSN: String
    ) {
        self.name = name
        self.subjectSN = subjectSN
        self.issuerOrganisation = issuerOrganisation
        self.validFrom = validFrom
        self.validTo = validTo
        self.signatureTypeSN = signatureTypeSN
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decode(String.self, forKey: .name)
        self.subjectSN = try container.decode(String.self, forKey: .subjectSN)
        self.issuerOrganisation = try container.decode(String.self, forKey: .issuerOrganisation)
        self.validFrom = try container.decode(String.self, forKey: .validFrom)
        self.validTo = try container.decode(String.self, forKey: .validTo)
        self.signatureTypeSN = try container.decode(String.self, forKey: .signatureTypeSN)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(subjectSN, forKey: .subjectSN)
        try container.encode(issuerOrganisation, forKey: .issuerOrganisation)
        try container.encode(validFrom, forKey: .validFrom)
        try container.encode(validTo, forKey: .validTo)
        try container.encode(signatureTypeSN, forKey: .signatureTypeSN)
    }

    public func toMap() -> [String: Any] {
        return [
            "name": name as Any,
            "subjectSN": subjectSN as Any,
            "issuerOrganisation": issuerOrganisation as Any,
            "validFrom": validFrom as Any,
            "validTo": validTo as Any,
            "signatureTypeSN": signatureTypeSN as Any
        ]
    }

    public static func from(map: [String: Any] ) -> HealthCertificate {
        return HealthCertificate(
            name: map["name"] as! String,
            subjectSN: map["subjectSN"] as! String,
            issuerOrganisation: map["issuerOrganisation"] as! String,
            validFrom: map["validFrom"] as! String,
            validTo: map["validTo"] as! String,
            signatureTypeSN: map["signatureTypeSN"] as! String
        )
    }
}
