import Foundation
import JSONCodable

/// Health Certificate
public class HealthCertificate {

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
