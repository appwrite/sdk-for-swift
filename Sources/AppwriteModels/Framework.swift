import Foundation
import JSONCodable

/// Framework
open class Framework: Codable {

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case name = "name"
        case buildRuntime = "buildRuntime"
        case runtimes = "runtimes"
        case adapters = "adapters"
    }

    /// Framework key.
    public let key: String

    /// Framework Name.
    public let name: String

    /// Default runtime version.
    public let buildRuntime: String

    /// List of supported runtime versions.
    public let runtimes: [String]

    /// List of supported adapters.
    public let adapters: [FrameworkAdapter]


    init(
        key: String,
        name: String,
        buildRuntime: String,
        runtimes: [String],
        adapters: [FrameworkAdapter]
    ) {
        self.key = key
        self.name = name
        self.buildRuntime = buildRuntime
        self.runtimes = runtimes
        self.adapters = adapters
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.key = try container.decode(String.self, forKey: .key)
        self.name = try container.decode(String.self, forKey: .name)
        self.buildRuntime = try container.decode(String.self, forKey: .buildRuntime)
        self.runtimes = try container.decode([String].self, forKey: .runtimes)
        self.adapters = try container.decode([FrameworkAdapter].self, forKey: .adapters)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(key, forKey: .key)
        try container.encode(name, forKey: .name)
        try container.encode(buildRuntime, forKey: .buildRuntime)
        try container.encode(runtimes, forKey: .runtimes)
        try container.encode(adapters, forKey: .adapters)
    }

    public func toMap() -> [String: Any] {
        return [
            "key": key as Any,
            "name": name as Any,
            "buildRuntime": buildRuntime as Any,
            "runtimes": runtimes as Any,
            "adapters": adapters.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Framework {
        return Framework(
            key: map["key"] as! String,
            name: map["name"] as! String,
            buildRuntime: map["buildRuntime"] as! String,
            runtimes: map["runtimes"] as! [String],
            adapters: (map["adapters"] as! [[String: Any]]).map { FrameworkAdapter.from(map: $0) }
        )
    }
}
