
/// Variable
public class Variable {

    /// Variable ID.
    public let id: String

    /// Variable creation date in Datetime
    public let createdAt: String

    /// Variable creation date in Datetime
    public let updatedAt: String

    /// Variable key.
    public let key: String

    /// Variable value.
    public let value: String

    /// Function ID.
    public let functionId: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        key: String,
        value: String,
        functionId: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.key = key
        self.value = value
        self.functionId = functionId
    }

    public static func from(map: [String: Any]) -> Variable {
        return Variable(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            key: map["key"] as! String,
            value: map["value"] as! String,
            functionId: map["functionId"] as! String
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "key": key as Any,
            "value": value as Any,
            "functionId": functionId as Any
        ]
    }
                            
}