import Foundation

public enum ProtocolId: String, CustomStringConvertible {
    case rest = "rest"
    case graphql = "graphql"
    case websocket = "websocket"

    public var description: String {
        return rawValue
    }
}
