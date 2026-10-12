import Foundation

public enum DomainTransferStatusEnum: String, Codable, CustomStringConvertible {
    case transferrable = "transferrable"
    case notTransferrable = "not_transferrable"
    case pendingOwner = "pending_owner"
    case pendingAdmin = "pending_admin"
    case pendingRegistry = "pending_registry"
    case completed = "completed"
    case cancelled = "cancelled"
    case serviceUnavailable = "service_unavailable"

    public var description: String {
        return rawValue
    }
}
