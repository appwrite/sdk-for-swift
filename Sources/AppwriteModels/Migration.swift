import Foundation
import JSONCodable

/// Migration
open class Migration: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case status = "status"
        case stage = "stage"
        case source = "source"
        case destination = "destination"
        case resources = "resources"
        case resourceId = "resourceId"
        case resourceInternalId = "resourceInternalId"
        case resourceType = "resourceType"
        case parentResourceId = "parentResourceId"
        case parentResourceInternalId = "parentResourceInternalId"
        case parentResourceType = "parentResourceType"
        case destinationResourceId = "destinationResourceId"
        case destinationResourceInternalId = "destinationResourceInternalId"
        case destinationResourceType = "destinationResourceType"
        case statusCounters = "statusCounters"
        case resourceData = "resourceData"
        case errors = "errors"
        case options = "options"
    }

    /// Migration ID.
    public let id: String
    /// Migration creation date in ISO 8601 format.
    public let createdAt: String
    /// Variable creation date in ISO 8601 format.
    public let updatedAt: String
    /// Migration status ( pending, processing, failed, completed )
    public let status: String
    /// Migration stage ( init, processing, source-check, destination-check, migrating, finished )
    public let stage: String
    /// A string containing the type of source of the migration.
    public let source: String
    /// A string containing the type of destination of the migration.
    public let destination: String
    /// Resources to migrate.
    public let resources: [String]
    /// ID of the resource being migrated.
    public let resourceId: String
    /// Internal ID of the resource being migrated.
    public let resourceInternalId: String
    /// Type of the resource being migrated.
    public let resourceType: String
    /// ID of the parent resource that contains the migrated resource.
    public let parentResourceId: String
    /// Internal ID of the parent resource that contains the migrated resource.
    public let parentResourceInternalId: String
    /// Type of the parent resource that contains the migrated resource.
    public let parentResourceType: String
    /// ID of the destination resource created or overwritten by the migration.
    public let destinationResourceId: String
    /// Internal ID of the destination resource created or overwritten by the migration.
    public let destinationResourceInternalId: String
    /// Type of the destination resource created or overwritten by the migration.
    public let destinationResourceType: String
    /// A group of counters that represent the total progress of the migration.
    public let statusCounters: [String: AnyCodable]
    /// An array of objects containing the report data of the resources that were migrated.
    public let resourceData: [AnyCodable]
    /// All errors that occurred during the migration process.
    public let errors: [String]
    /// Migration options used during the migration process.
    public let options: [String: AnyCodable]

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        status: String,
        stage: String,
        source: String,
        destination: String,
        resources: [String],
        resourceId: String,
        resourceInternalId: String,
        resourceType: String,
        parentResourceId: String,
        parentResourceInternalId: String,
        parentResourceType: String,
        destinationResourceId: String,
        destinationResourceInternalId: String,
        destinationResourceType: String,
        statusCounters: [String: AnyCodable],
        resourceData: [AnyCodable],
        errors: [String],
        options: [String: AnyCodable]
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.status = status
        self.stage = stage
        self.source = source
        self.destination = destination
        self.resources = resources
        self.resourceId = resourceId
        self.resourceInternalId = resourceInternalId
        self.resourceType = resourceType
        self.parentResourceId = parentResourceId
        self.parentResourceInternalId = parentResourceInternalId
        self.parentResourceType = parentResourceType
        self.destinationResourceId = destinationResourceId
        self.destinationResourceInternalId = destinationResourceInternalId
        self.destinationResourceType = destinationResourceType
        self.statusCounters = statusCounters
        self.resourceData = resourceData
        self.errors = errors
        self.options = options
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.status = try container.contains(.status) ? container.decode(String.self, forKey: .status) : ""
        self.stage = try container.contains(.stage) ? container.decode(String.self, forKey: .stage) : ""
        self.source = try container.contains(.source) ? container.decode(String.self, forKey: .source) : ""
        self.destination = try container.contains(.destination) ? container.decode(String.self, forKey: .destination) : "Appwrite"
        self.resources = try container.contains(.resources) ? container.decode([String].self, forKey: .resources) : []
        self.resourceId = try container.contains(.resourceId) ? container.decode(String.self, forKey: .resourceId) : ""
        self.resourceInternalId = try container.contains(.resourceInternalId) ? container.decode(String.self, forKey: .resourceInternalId) : ""
        self.resourceType = try container.contains(.resourceType) ? container.decode(String.self, forKey: .resourceType) : ""
        self.parentResourceId = try container.contains(.parentResourceId) ? container.decode(String.self, forKey: .parentResourceId) : ""
        self.parentResourceInternalId = try container.contains(.parentResourceInternalId) ? container.decode(String.self, forKey: .parentResourceInternalId) : ""
        self.parentResourceType = try container.contains(.parentResourceType) ? container.decode(String.self, forKey: .parentResourceType) : ""
        self.destinationResourceId = try container.contains(.destinationResourceId) ? container.decode(String.self, forKey: .destinationResourceId) : ""
        self.destinationResourceInternalId = try container.contains(.destinationResourceInternalId) ? container.decode(String.self, forKey: .destinationResourceInternalId) : ""
        self.destinationResourceType = try container.contains(.destinationResourceType) ? container.decode(String.self, forKey: .destinationResourceType) : ""
        self.statusCounters = try container.contains(.statusCounters) ? container.decode([String: AnyCodable].self, forKey: .statusCounters) : ([String: Any]()).mapValues { AnyCodable($0) }
        self.resourceData = try container.contains(.resourceData) ? container.decode([AnyCodable].self, forKey: .resourceData) : []
        self.errors = try container.contains(.errors) ? container.decode([String].self, forKey: .errors) : []
        self.options = try container.contains(.options) ? container.decode([String: AnyCodable].self, forKey: .options) : ([String: Any]()).mapValues { AnyCodable($0) }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(status, forKey: .status)
        try container.encode(stage, forKey: .stage)
        try container.encode(source, forKey: .source)
        try container.encode(destination, forKey: .destination)
        try container.encode(resources, forKey: .resources)
        try container.encode(resourceId, forKey: .resourceId)
        try container.encode(resourceInternalId, forKey: .resourceInternalId)
        try container.encode(resourceType, forKey: .resourceType)
        try container.encode(parentResourceId, forKey: .parentResourceId)
        try container.encode(parentResourceInternalId, forKey: .parentResourceInternalId)
        try container.encode(parentResourceType, forKey: .parentResourceType)
        try container.encode(destinationResourceId, forKey: .destinationResourceId)
        try container.encode(destinationResourceInternalId, forKey: .destinationResourceInternalId)
        try container.encode(destinationResourceType, forKey: .destinationResourceType)
        try container.encode(statusCounters, forKey: .statusCounters)
        try container.encode(resourceData, forKey: .resourceData)
        try container.encode(errors, forKey: .errors)
        try container.encode(options, forKey: .options)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "status": status as Any,
            "stage": stage as Any,
            "source": source as Any,
            "destination": destination as Any,
            "resources": resources as Any,
            "resourceId": resourceId as Any,
            "resourceInternalId": resourceInternalId as Any,
            "resourceType": resourceType as Any,
            "parentResourceId": parentResourceId as Any,
            "parentResourceInternalId": parentResourceInternalId as Any,
            "parentResourceType": parentResourceType as Any,
            "destinationResourceId": destinationResourceId as Any,
            "destinationResourceInternalId": destinationResourceInternalId as Any,
            "destinationResourceType": destinationResourceType as Any,
            "statusCounters": statusCounters as Any,
            "resourceData": resourceData as Any,
            "errors": errors as Any,
            "options": options as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Migration {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "status": "",
            "stage": "",
            "source": "",
            "destination": "Appwrite",
            "resources": [Any](),
            "resourceId": "",
            "resourceInternalId": "",
            "resourceType": "",
            "parentResourceId": "",
            "parentResourceInternalId": "",
            "parentResourceType": "",
            "destinationResourceId": "",
            "destinationResourceInternalId": "",
            "destinationResourceType": "",
            "statusCounters": [String: Any](),
            "resourceData": [Any](),
            "errors": [Any](),
            "options": [String: Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return Migration(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            status: map["status"] as! String,
            stage: map["stage"] as! String,
            source: map["source"] as! String,
            destination: map["destination"] as! String,
            resources: map["resources"] as! [String],
            resourceId: map["resourceId"] as! String,
            resourceInternalId: map["resourceInternalId"] as! String,
            resourceType: map["resourceType"] as! String,
            parentResourceId: map["parentResourceId"] as! String,
            parentResourceInternalId: map["parentResourceInternalId"] as! String,
            parentResourceType: map["parentResourceType"] as! String,
            destinationResourceId: map["destinationResourceId"] as! String,
            destinationResourceInternalId: map["destinationResourceInternalId"] as! String,
            destinationResourceType: map["destinationResourceType"] as! String,
            statusCounters: (map["statusCounters"] as! [String: Any]).mapValues { AnyCodable($0) },
            resourceData: (map["resourceData"] as! [Any]).map { AnyCodable($0) },
            errors: map["errors"] as! [String],
            options: (map["options"] as! [String: Any]).mapValues { AnyCodable($0) }
        )
    }
}
