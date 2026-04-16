import Foundation

public enum ServiceId: String, CustomStringConvertible {
    case account = "account"
    case avatars = "avatars"
    case databases = "databases"
    case tablesdb = "tablesdb"
    case locale = "locale"
    case health = "health"
    case project = "project"
    case storage = "storage"
    case teams = "teams"
    case users = "users"
    case vcs = "vcs"
    case sites = "sites"
    case functions = "functions"
    case proxy = "proxy"
    case graphql = "graphql"
    case migrations = "migrations"
    case messaging = "messaging"

    public var description: String {
        return rawValue
    }
}
