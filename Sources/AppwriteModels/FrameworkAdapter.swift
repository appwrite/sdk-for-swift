import Foundation
import JSONCodable

/// Framework Adapter
open class FrameworkAdapter: Codable {

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case installCommand = "installCommand"
        case buildCommand = "buildCommand"
        case outputDirectory = "outputDirectory"
        case fallbackFile = "fallbackFile"
    }

    /// Adapter key.
    public let key: String

    /// Default command to download dependencies.
    public let installCommand: String

    /// Default command to build site into output directory.
    public let buildCommand: String

    /// Default output directory of build.
    public let outputDirectory: String

    /// Name of fallback file to use instead of 404 page. If null, Appwrite 404 page will be displayed.
    public let fallbackFile: String


    init(
        key: String,
        installCommand: String,
        buildCommand: String,
        outputDirectory: String,
        fallbackFile: String
    ) {
        self.key = key
        self.installCommand = installCommand
        self.buildCommand = buildCommand
        self.outputDirectory = outputDirectory
        self.fallbackFile = fallbackFile
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.key = try container.decode(String.self, forKey: .key)
        self.installCommand = try container.decode(String.self, forKey: .installCommand)
        self.buildCommand = try container.decode(String.self, forKey: .buildCommand)
        self.outputDirectory = try container.decode(String.self, forKey: .outputDirectory)
        self.fallbackFile = try container.decode(String.self, forKey: .fallbackFile)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(key, forKey: .key)
        try container.encode(installCommand, forKey: .installCommand)
        try container.encode(buildCommand, forKey: .buildCommand)
        try container.encode(outputDirectory, forKey: .outputDirectory)
        try container.encode(fallbackFile, forKey: .fallbackFile)
    }

    public func toMap() -> [String: Any] {
        return [
            "key": key as Any,
            "installCommand": installCommand as Any,
            "buildCommand": buildCommand as Any,
            "outputDirectory": outputDirectory as Any,
            "fallbackFile": fallbackFile as Any
        ]
    }

    public static func from(map: [String: Any] ) -> FrameworkAdapter {
        return FrameworkAdapter(
            key: map["key"] as! String,
            installCommand: map["installCommand"] as! String,
            buildCommand: map["buildCommand"] as! String,
            outputDirectory: map["outputDirectory"] as! String,
            fallbackFile: map["fallbackFile"] as! String
        )
    }
}
