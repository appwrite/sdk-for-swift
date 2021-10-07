
/// Key
public class Key {

    /// Key ID.
    public let id: String

    /// Key name.
    public let name: String

    /// Allowed permission scopes.
    public let scopes: Array<Any>?

    /// Secret key.
    public let secret: String

    init(
        id: String,
        name: String,
        scopes: Array<Any>?,
        secret: String
    ) {
        self.id = id
        self.name = name
        self.scopes = scopes
        self.secret = secret
    }

    public static func from(map: [String: Any]) -> Key {
        return Key(
            id: map["$id"] as! String,
            name: map["name"] as! String,
            scopes: map["scopes"] as! Array<Any>?,
            secret: map["secret"] as! String
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "name": name as Any,
            "scopes": scopes as Any,
            "secret": secret as Any
        ]
    }
                    
}