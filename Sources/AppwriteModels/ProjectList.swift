
/// Projects List
public class ProjectList {

    /// Total sum of items in the list.
    public let sum: Int

    /// List of projects.
    public let projects: [Project]

    init(
        sum: Int,
        projects: [Project]
    ) {
        self.sum = sum
        self.projects = projects
    }

    public static func from(map: [String: Any]) -> ProjectList {
        return ProjectList(
            sum: map["sum"] as! Int,
            projects: (map["projects"] as! [[String: Any]]).map { Project.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "sum": sum as Any,
            "projects": projects.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                                                                                                            
}