import Foundation

public enum DeploymentDownloadType: String, CustomStringConvertible {
    case source = "source"
    case output = "output"

    public var description: String {
        return rawValue
    }
}
