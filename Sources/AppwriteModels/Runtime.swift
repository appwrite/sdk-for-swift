import Foundation
import JSONCodable

/// Runtime
public class Runtime {

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
