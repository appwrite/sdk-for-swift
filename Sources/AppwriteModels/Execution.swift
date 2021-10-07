
/// Execution
public class Execution {

    /// Execution ID.
    public let id: String

    /// Function ID.
    public let functionId: String

    /// The execution creation date in Unix timestamp.
    public let dateCreated: Int

    /// The trigger that caused the function to execute. Possible values can be: `http`, `schedule`, or `event`.
    public let trigger: String

    /// The status of the function execution. Possible values can be: `waiting`, `processing`, `completed`, or `failed`.
    public let status: String

    /// The script exit code.
    public let exitCode: Int

    /// The script stdout output string.
    public let stdout: String

    /// The script stderr output string.
    public let stderr: String

    /// The script execution time in seconds.
    public let time: Double

    init(
        id: String,
        functionId: String,
        dateCreated: Int,
        trigger: String,
        status: String,
        exitCode: Int,
        stdout: String,
        stderr: String,
        time: Double
    ) {
        self.id = id
        self.functionId = functionId
        self.dateCreated = dateCreated
        self.trigger = trigger
        self.status = status
        self.exitCode = exitCode
        self.stdout = stdout
        self.stderr = stderr
        self.time = time
    }

    public static func from(map: [String: Any]) -> Execution {
        return Execution(
            id: map["$id"] as! String,
            functionId: map["functionId"] as! String,
            dateCreated: map["dateCreated"] as! Int,
            trigger: map["trigger"] as! String,
            status: map["status"] as! String,
            exitCode: map["exitCode"] as! Int,
            stdout: map["stdout"] as! String,
            stderr: map["stderr"] as! String,
            time: map["time"] as! Double
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "functionId": functionId as Any,
            "dateCreated": dateCreated as Any,
            "trigger": trigger as Any,
            "status": status as Any,
            "exitCode": exitCode as Any,
            "stdout": stdout as Any,
            "stderr": stderr as Any,
            "time": time as Any
        ]
    }
                                        
}