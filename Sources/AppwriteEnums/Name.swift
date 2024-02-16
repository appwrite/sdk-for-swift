import Foundation

public enum Name: String, Codable {
    case v1database = "v1-database"
    case v1deletes = "v1-deletes"
    case v1audits = "v1-audits"
    case v1mails = "v1-mails"
    case v1functions = "v1-functions"
    case v1usage = "v1-usage"
    case webhooksv1 = "webhooksv1"
    case v1certificates = "v1-certificates"
    case v1builds = "v1-builds"
    case v1messaging = "v1-messaging"
    case v1migrations = "v1-migrations"
    case hamsterv1 = "hamsterv1"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
