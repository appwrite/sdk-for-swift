import Foundation

public enum DeploymentDownloadType: String, Codable, CustomStringConvertible {
    case source = "source"
    case output = "output"

    public var description: String {
        return rawValue
    }
}
