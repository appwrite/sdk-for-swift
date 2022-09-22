
/// Function
public class Function {

    /// Function ID.
    public let id: String

    /// Function creation date in ISO 8601 format.
    public let createdAt: String

    /// Function update date in ISO 8601 format.
    public let updatedAt: String

    /// Execution permissions.
    public let execute: [Any]

    /// Function name.
    public let name: String

    /// Function enabled.
    public let enabled: Bool

    /// Function execution runtime.
    public let runtime: String

    /// Function&#039;s active deployment ID.
    public let deployment: String

    /// Function variables.
    public let vars: [Variable]

    /// Function trigger events.
    public let events: [Any]

    /// Function execution schedult in CRON format.
    public let schedule: String

    /// Function&#039;s next scheduled execution time in ISO 8601 format.
    public let scheduleNext: String

    /// Function&#039;s previous scheduled execution time in ISO 8601 format.
    public let schedulePrevious: String

    /// Function execution timeout in seconds.
    public let timeout: Int

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        execute: [Any],
        name: String,
        enabled: Bool,
        runtime: String,
        deployment: String,
        vars: [Variable],
        events: [Any],
        schedule: String,
        scheduleNext: String,
        schedulePrevious: String,
        timeout: Int
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.execute = execute
        self.name = name
        self.enabled = enabled
        self.runtime = runtime
        self.deployment = deployment
        self.vars = vars
        self.events = events
        self.schedule = schedule
        self.scheduleNext = scheduleNext
        self.schedulePrevious = schedulePrevious
        self.timeout = timeout
    }

    public static func from(map: [String: Any]) -> Function {
        return Function(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            execute: map["execute"] as! [Any],
            name: map["name"] as! String,
            enabled: map["enabled"] as! Bool,
            runtime: map["runtime"] as! String,
            deployment: map["deployment"] as! String,
            vars: (map["vars"] as! [[String: Any]]).map { Variable.from(map: $0) },
            events: map["events"] as! [Any],
            schedule: map["schedule"] as! String,
            scheduleNext: map["scheduleNext"] as! String,
            schedulePrevious: map["schedulePrevious"] as! String,
            timeout: map["timeout"] as! Int
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "execute": execute as Any,
            "name": name as Any,
            "enabled": enabled as Any,
            "runtime": runtime as Any,
            "deployment": deployment as Any,
            "vars": vars.map { $0.toMap() } as Any,
            "events": events as Any,
            "schedule": schedule as Any,
            "scheduleNext": scheduleNext as Any,
            "schedulePrevious": schedulePrevious as Any,
            "timeout": timeout as Any
        ]
    }
                                                                                                                                                                                                                                                                                                                                            
}
