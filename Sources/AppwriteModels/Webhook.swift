
/// Webhook
public class Webhook {

    /// Webhook ID.
    public let id: String

    /// Webhook name.
    public let name: String

    /// Webhook URL endpoint.
    public let url: String

    /// Webhook trigger events.
    public let events: Array<Any>?

    /// Indicated if SSL / TLS Certificate verification is enabled.
    public let security: Bool

    /// HTTP basic authentication username.
    public let httpUser: String

    /// HTTP basic authentication password.
    public let httpPass: String

    init(
        id: String,
        name: String,
        url: String,
        events: Array<Any>?,
        security: Bool,
        httpUser: String,
        httpPass: String
    ) {
        self.id = id
        self.name = name
        self.url = url
        self.events = events
        self.security = security
        self.httpUser = httpUser
        self.httpPass = httpPass
    }

    public static func from(map: [String: Any]) -> Webhook {
        return Webhook(
            id: map["$id"] as! String,
            name: map["name"] as! String,
            url: map["url"] as! String,
            events: map["events"] as! Array<Any>?,
            security: map["security"] as! Bool,
            httpUser: map["httpUser"] as! String,
            httpPass: map["httpPass"] as! String
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "name": name as Any,
            "url": url as Any,
            "events": events as Any,
            "security": security as Any,
            "httpUser": httpUser as Any,
            "httpPass": httpPass as Any
        ]
    }
                                
}