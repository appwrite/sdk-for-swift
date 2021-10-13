
/// Tasks List
public class TaskList {

    /// Total sum of items in the list.
    public let sum: Int

    /// List of tasks.
    public let tasks: [Task]

    init(
        sum: Int,
        tasks: [Task]
    ) {
        self.sum = sum
        self.tasks = tasks
    }

    public static func from(map: [String: Any]) -> TaskList {
        return TaskList(
            sum: map["sum"] as! Int,
            tasks: (map["tasks"] as! [[String: Any]]).map { Task.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "sum": sum as Any,
            "tasks": tasks.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                                                                                                            
}