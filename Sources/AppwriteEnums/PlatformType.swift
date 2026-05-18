import Foundation

public enum PlatformType: String, Codable, CustomStringConvertible {
    case windows = "windows"
    case apple = "apple"
    case android = "android"
    case linux = "linux"
    case web = "web"

    public var description: String {
        return rawValue
    }
}
