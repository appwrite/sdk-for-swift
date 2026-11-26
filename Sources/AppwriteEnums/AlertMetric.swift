import Foundation

public enum AlertMetric: String, Codable, CustomStringConvertible {
    case networkRequests = "network.requests"
    case networkInbound = "network.inbound"
    case networkOutbound = "network.outbound"
    case executions = "executions"
    case executionsMbSeconds = "executions.mbSeconds"
    case realtimeConnections = "realtime.connections"
    case webhooksEventsSent = "webhooks.events.sent"
    case webhooksEventsFailed = "webhooks.events.failed"
    case usersMau = "users.mau"
    case authMethodPhone = "auth.method.phone"
    case users = "users"
    case databasesOperationsReads = "databases.operations.reads"
    case databasesOperationsWrites = "databases.operations.writes"
    case databasesStorage = "databases.storage"
    case storage = "storage"
    case filesStorage = "files.storage"
    case messagesSent = "messages.sent"
    case messagesSmsSent = "messages.sms.sent"
    case messagesFailed = "messages.failed"
    case avatarsScreenshotsGenerated = "avatars.screenshotsGenerated"
    case dedicatedDatabasesCpu = "dedicatedDatabases.cpu"
    case dedicatedDatabasesMemory = "dedicatedDatabases.memory"
    case dedicatedDatabasesStorage = "dedicatedDatabases.storage"
    case dedicatedDatabasesConnections = "dedicatedDatabases.connections"
    case dedicatedDatabasesQps = "dedicatedDatabases.qps"
    case dedicatedDatabasesIopsRead = "dedicatedDatabases.iopsRead"
    case dedicatedDatabasesIopsWrite = "dedicatedDatabases.iopsWrite"
    case analyticsEvents = "analytics.events"
    case analyticsPageviews = "analytics.pageviews"
    case billingBudgetUsed = "billing.budgetUsed"

    public var description: String {
        return rawValue
    }
}
