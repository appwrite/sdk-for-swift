import Foundation

public enum ProjectProtocolId: String, Codable, CustomStringConvertible {
    case rest = "rest"
    case graphql = "graphql"
    case websocket = "websocket"

    public var description: String {
        return rawValue
    }
}
