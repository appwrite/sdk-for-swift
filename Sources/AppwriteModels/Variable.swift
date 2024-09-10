import Foundation
import JSONCodable

/// Variable
public class Variable {

    /// Variable ID.
    public let id: String

    /// Variable creation date in ISO 8601 format.
    public let createdAt: String

    /// Variable creation date in ISO 8601 format.
    public let updatedAt: String

    /// Variable key.
    public let key: String

    /// Variable value.
    public let value: String

    /// Service to which the variable belongs. Possible values are &quot;project&quot;, &quot;function&quot;
    public let resourceType: String

    /// ID of resource to which the variable belongs. If resourceType is &quot;project&quot;, it is empty. If resourceType is &quot;function&quot;, it is ID of the function.
    public let resourceId: String


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        key: String,
        value: String,
        resourceType: String,
        resourceId: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.key = key
        self.value = value
        self.resourceType = resourceType
        self.resourceId = resourceId
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "key": key as Any,
            "value": value as Any,
            "resourceType": resourceType as Any,
            "resourceId": resourceId as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Variable {
        return Variable(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            key: map["key"] as! String,
            value: map["value"] as! String,
            resourceType: map["resourceType"] as! String,
            resourceId: map["resourceId"] as! String
        )
    }
}
