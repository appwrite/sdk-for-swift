
/// AlgoScryptModified
public class AlgoScryptModified {

    /// Salt used to compute hash.
    public let salt: String

    /// Separator used to compute hash.
    public let saltSeparator: String

    /// Key used to compute hash.
    public let signerKey: String

    init(
        salt: String,
        saltSeparator: String,
        signerKey: String
    ) {
        self.salt = salt
        self.saltSeparator = saltSeparator
        self.signerKey = signerKey
    }

    public static func from(map: [String: Any]) -> AlgoScryptModified {
        return AlgoScryptModified(
            salt: map["salt"] as! String,
            saltSeparator: map["saltSeparator"] as! String,
            signerKey: map["signerKey"] as! String
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "salt": salt as Any,
            "saltSeparator": saltSeparator as Any,
            "signerKey": signerKey as Any
        ]
    }
                
}
