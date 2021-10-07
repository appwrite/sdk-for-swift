
/// Task
public class Task {

    /// Task ID.
    public let id: String

    /// Task name.
    public let name: String

    /// Indicated if SSL / TLS Certificate verification is enabled.
    public let security: Bool

    /// Task HTTP Method.
    public let httpMethod: String

    /// Task HTTP URL.
    public let httpUrl: String

    /// Task HTTP headers.
    public let httpHeaders: Array<Any>?

    /// HTTP basic authentication username.
    public let httpUser: String

    /// HTTP basic authentication password.
    public let httpPass: String

    /// Task duration in seconds.
    public let duration: Double

    /// Task delay time in seconds.
    public let delay: Double

    /// Number of recurring task failures.
    public let failures: Int

    /// Task schedule in CRON syntax.
    public let schedule: String

    /// Task status. Possible values: play, pause
    public let status: String

    /// Task last updated time in Unix timestamp.
    public let updated: Int

    /// Task previous run time in Unix timestamp.
    public let previous: Int

    /// Task next run time in Unix timestamp.
    public let next: Int

    init(
        id: String,
        name: String,
        security: Bool,
        httpMethod: String,
        httpUrl: String,
        httpHeaders: Array<Any>?,
        httpUser: String,
        httpPass: String,
        duration: Double,
        delay: Double,
        failures: Int,
        schedule: String,
        status: String,
        updated: Int,
        previous: Int,
        next: Int
    ) {
        self.id = id
        self.name = name
        self.security = security
        self.httpMethod = httpMethod
        self.httpUrl = httpUrl
        self.httpHeaders = httpHeaders
        self.httpUser = httpUser
        self.httpPass = httpPass
        self.duration = duration
        self.delay = delay
        self.failures = failures
        self.schedule = schedule
        self.status = status
        self.updated = updated
        self.previous = previous
        self.next = next
    }

    public static func from(map: [String: Any]) -> Task {
        return Task(
            id: map["$id"] as! String,
            name: map["name"] as! String,
            security: map["security"] as! Bool,
            httpMethod: map["httpMethod"] as! String,
            httpUrl: map["httpUrl"] as! String,
            httpHeaders: map["httpHeaders"] as! Array<Any>?,
            httpUser: map["httpUser"] as! String,
            httpPass: map["httpPass"] as! String,
            duration: map["duration"] as! Double,
            delay: map["delay"] as! Double,
            failures: map["failures"] as! Int,
            schedule: map["schedule"] as! String,
            status: map["status"] as! String,
            updated: map["updated"] as! Int,
            previous: map["previous"] as! Int,
            next: map["next"] as! Int
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "name": name as Any,
            "security": security as Any,
            "httpMethod": httpMethod as Any,
            "httpUrl": httpUrl as Any,
            "httpHeaders": httpHeaders as Any,
            "httpUser": httpUser as Any,
            "httpPass": httpPass as Any,
            "duration": duration as Any,
            "delay": delay as Any,
            "failures": failures as Any,
            "schedule": schedule as Any,
            "status": status as Any,
            "updated": updated as Any,
            "previous": previous as Any,
            "next": next as Any
        ]
    }
                                                                    
}