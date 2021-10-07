
/// Error
public class Error {

    /// Error message.
    public let message: String

    /// Error code.
    public let code: String

    /// Server version number.
    public let version: String

    init(
        message: String,
        code: String,
        version: String
    ) {
        self.message = message
        self.code = code
        self.version = version
    }

    public static func from(map: [String: Any]) -> Error {
        return Error(
            message: map["message"] as! String,
            code: map["code"] as! String,
            version: map["version"] as! String
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "message": message as Any,
            "code": code as Any,
            "version": version as Any
        ]
    }
                
}