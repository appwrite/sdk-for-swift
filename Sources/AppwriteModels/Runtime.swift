import Foundation
import JSONCodable

/// Runtime
open class Runtime: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case key = "key"
        case name = "name"
        case version = "version"
        case base = "base"
        case image = "image"
        case logo = "logo"
        case supports = "supports"
    }

    /// Runtime ID.
    public let id: String

    /// Parent runtime key.
    public let key: String

    /// Runtime Name.
    public let name: String

    /// Runtime version.
    public let version: String

    /// Base Docker image used to build the runtime.
    public let base: String

    /// Image name of Docker Hub.
    public let image: String

    /// Name of the logo image.
    public let logo: String

    /// List of supported architectures.
    public let supports: [String]


    init(
        id: String,
        key: String,
        name: String,
        version: String,
        base: String,
        image: String,
        logo: String,
        supports: [String]
    ) {
        self.id = id
        self.key = key
        self.name = name
        self.version = version
        self.base = base
        self.image = image
        self.logo = logo
        self.supports = supports
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.key = try container.decode(String.self, forKey: .key)
        self.name = try container.decode(String.self, forKey: .name)
        self.version = try container.decode(String.self, forKey: .version)
        self.base = try container.decode(String.self, forKey: .base)
        self.image = try container.decode(String.self, forKey: .image)
        self.logo = try container.decode(String.self, forKey: .logo)
        self.supports = try container.decode([String].self, forKey: .supports)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(key, forKey: .key)
        try container.encode(name, forKey: .name)
        try container.encode(version, forKey: .version)
        try container.encode(base, forKey: .base)
        try container.encode(image, forKey: .image)
        try container.encode(logo, forKey: .logo)
        try container.encode(supports, forKey: .supports)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "key": key as Any,
            "name": name as Any,
            "version": version as Any,
            "base": base as Any,
            "image": image as Any,
            "logo": logo as Any,
            "supports": supports as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Runtime {
        return Runtime(
            id: map["$id"] as! String,
            key: map["key"] as! String,
            name: map["name"] as! String,
            version: map["version"] as! String,
            base: map["base"] as! String,
            image: map["image"] as! String,
            logo: map["logo"] as! String,
            supports: map["supports"] as! [String]
        )
    }
}
