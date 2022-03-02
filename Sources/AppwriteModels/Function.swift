
/// Function
public class Function {

    /// Function ID.
    public let id: String

    /// Execution permissions.
    public let execute: [Any]

    /// Function name.
    public let name: String

    /// Function creation date in Unix timestamp.
    public let dateCreated: Int

    /// Function update date in Unix timestamp.
    public let dateUpdated: Int

    /// Function status. Possible values: `disabled`, `enabled`
    public let status: String

    /// Function execution runtime.
    public let runtime: String

    /// Function&#039;s active deployment ID.
    public let deployment: String

    /// Function environment variables.
    public let vars: [String : Any]

    /// Function trigger events.
    public let events: [Any]

    /// Function execution schedult in CRON format.
    public let schedule: String

    /// Function next scheduled execution date in Unix timestamp.
    public let scheduleNext: Int

    /// Function next scheduled execution date in Unix timestamp.
    public let schedulePrevious: Int

    /// Function execution timeout in seconds.
    public let timeout: Int

    init(
        id: String,
        execute: [Any],
        name: String,
        dateCreated: Int,
        dateUpdated: Int,
        status: String,
        runtime: String,
        deployment: String,
        vars: [String : Any],
        events: [Any],
        schedule: String,
        scheduleNext: Int,
        schedulePrevious: Int,
        timeout: Int
    ) {
        self.id = id
        self.execute = execute
        self.name = name
        self.dateCreated = dateCreated
        self.dateUpdated = dateUpdated
        self.status = status
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
            execute: map["execute"] as! [Any],
            name: map["name"] as! String,
            dateCreated: map["dateCreated"] as! Int,
            dateUpdated: map["dateUpdated"] as! Int,
            status: map["status"] as! String,
            runtime: map["runtime"] as! String,
            deployment: map["deployment"] as! String,
            vars: map["vars"] as! [String : Any],
            events: map["events"] as! [Any],
            schedule: map["schedule"] as! String,
            scheduleNext: map["scheduleNext"] as! Int,
            schedulePrevious: map["schedulePrevious"] as! Int,
            timeout: map["timeout"] as! Int
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "execute": execute as Any,
            "name": name as Any,
            "dateCreated": dateCreated as Any,
            "dateUpdated": dateUpdated as Any,
            "status": status as Any,
            "runtime": runtime as Any,
            "deployment": deployment as Any,
            "vars": vars as Any,
            "events": events as Any,
            "schedule": schedule as Any,
            "scheduleNext": scheduleNext as Any,
            "schedulePrevious": schedulePrevious as Any,
            "timeout": timeout as Any
        ]
    }
                                                            
}