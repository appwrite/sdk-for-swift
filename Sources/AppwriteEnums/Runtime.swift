import Foundation

public enum Runtime: String, Codable {
    case node145 = "node-14.5"
    case node160 = "node-16.0"
    case node180 = "node-18.0"
    case node190 = "node-19.0"
    case node200 = "node-20.0"
    case php80 = "php-8.0"
    case php81 = "php-8.1"
    case php82 = "php-8.2"
    case ruby30 = "ruby-3.0"
    case ruby31 = "ruby-3.1"
    case ruby32 = "ruby-3.2"
    case python38 = "python-3.8"
    case python39 = "python-3.9"
    case python310 = "python-3.10"
    case python311 = "python-3.11"
    case python312 = "python-3.12"
    case dart215 = "dart-2.15"
    case dart216 = "dart-2.16"
    case dart217 = "dart-2.17"
    case dart218 = "dart-2.18"
    case dart30 = "dart-3.0"
    case dart31 = "dart-3.1"
    case dotnet31 = "dotnet-3.1"
    case dotnet60 = "dotnet-6.0"
    case dotnet70 = "dotnet-7.0"
    case java80 = "java-8.0"
    case java110 = "java-11.0"
    case java170 = "java-17.0"
    case java180 = "java-18.0"
    case swift55 = "swift-5.5"
    case swift58 = "swift-5.8"
    case kotlin16 = "kotlin-1.6"
    case kotlin18 = "kotlin-1.8"
    case cpp17 = "cpp-17"
    case cpp20 = "cpp-20"
    case bun10 = "bun-1.0"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
