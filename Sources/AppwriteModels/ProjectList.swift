import Foundation
import JSONCodable

/// Projects List
open class ProjectList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case projects = "projects"
    }

    /// Total number of projects that matched your query.
    public let total: Int
    /// List of projects.
    public let projects: [Project]

    init(
        total: Int,
        projects: [Project]
    ) {
        self.total = total
        self.projects = projects
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.projects = try container.decode([Project].self, forKey: .projects)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(projects, forKey: .projects)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "projects": projects.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> ProjectList {
        return ProjectList(
            total: map["total"] as! Int,
            projects: (map["projects"] as! [[String: Any]]).map { Project.from(map: $0) }
        )
    }
}
