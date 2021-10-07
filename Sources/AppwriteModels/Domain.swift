
/// Domain
public class Domain {

    /// Domain ID.
    public let id: String

    /// Domain name.
    public let domain: String

    /// Registerable domain name.
    public let registerable: String

    /// TLD name.
    public let tld: String

    /// Verification process status.
    public let verification: Bool

    /// Certificate ID.
    public let certificateId: String

    init(
        id: String,
        domain: String,
        registerable: String,
        tld: String,
        verification: Bool,
        certificateId: String
    ) {
        self.id = id
        self.domain = domain
        self.registerable = registerable
        self.tld = tld
        self.verification = verification
        self.certificateId = certificateId
    }

    public static func from(map: [String: Any]) -> Domain {
        return Domain(
            id: map["$id"] as! String,
            domain: map["domain"] as! String,
            registerable: map["registerable"] as! String,
            tld: map["tld"] as! String,
            verification: map["verification"] as! Bool,
            certificateId: map["certificateId"] as! String
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "domain": domain as Any,
            "registerable": registerable as Any,
            "tld": tld as Any,
            "verification": verification as Any,
            "certificateId": certificateId as Any
        ]
    }
                            
}