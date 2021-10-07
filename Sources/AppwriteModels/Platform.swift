
/// Platform
public class Platform {

    /// Platform ID.
    public let id: String

    /// Platform name.
    public let name: String

    /// Platform type. Possible values are: web, flutter-ios, flutter-android, ios, android, and unity.
    public let type: String

    /// Platform Key. iOS bundle ID or Android package name.  Empty string for other platforms.
    public let key: String

    /// App store or Google Play store ID.
    public let store: String

    /// Web app hostname. Empty string for other platforms.
    public let hostname: String

    /// HTTP basic authentication username.
    public let httpUser: String

    /// HTTP basic authentication password.
    public let httpPass: String

    init(
        id: String,
        name: String,
        type: String,
        key: String,
        store: String,
        hostname: String,
        httpUser: String,
        httpPass: String
    ) {
        self.id = id
        self.name = name
        self.type = type
        self.key = key
        self.store = store
        self.hostname = hostname
        self.httpUser = httpUser
        self.httpPass = httpPass
    }

    public static func from(map: [String: Any]) -> Platform {
        return Platform(
            id: map["$id"] as! String,
            name: map["name"] as! String,
            type: map["type"] as! String,
            key: map["key"] as! String,
            store: map["store"] as! String,
            hostname: map["hostname"] as! String,
            httpUser: map["httpUser"] as! String,
            httpPass: map["httpPass"] as! String
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "name": name as Any,
            "type": type as Any,
            "key": key as Any,
            "store": store as Any,
            "hostname": hostname as Any,
            "httpUser": httpUser as Any,
            "httpPass": httpPass as Any
        ]
    }
                                    
}