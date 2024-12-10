import Foundation

public enum Name: String, CustomStringConvertible {
    case v1Database = "v1-database"
    case v1Deletes = "v1-deletes"
    case v1Audits = "v1-audits"
    case v1Mails = "v1-mails"
    case v1Functions = "v1-functions"
    case v1Usage = "v1-usage"
    case v1UsageDump = "v1-usage-dump"
    case v1Webhooks = "v1-webhooks"
    case v1Certificates = "v1-certificates"
    case v1Builds = "v1-builds"
    case v1Messaging = "v1-messaging"
    case v1Migrations = "v1-migrations"

    public var description: String {
        return rawValue
    }
}
