import Foundation
import JSONCodable

/// Index
public class Index {

    /// Index Key.
    public let key: String


    /// Index type.
    public let type: String


    /// Index status. Possible values: `available`, `processing`, `deleting`, `stuck`, or `failed`
    public let status: String


    /// Error message. Displays error generated on failure of creating or deleting an index.
    public let error: String


    /// Index attributes.
    public let attributes: [Any]


    /// Index orders.
    public let orders: [Any]?



    init(
        key: String,
        type: String,
        status: String,
        error: String,
        attributes: [Any],
        orders: [Any]?
    ) {
        self.key = key
        self.type = type
        self.status = status
        self.error = error
        self.attributes = attributes
        self.orders = orders
    }

    public func toMap() -> [String: Any] {
        return [
            "key": key as Any,
            "type": type as Any,
            "status": status as Any,
            "error": error as Any,
            "attributes": attributes as Any,
            "orders": orders as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Index {
        return Index(
            key: map["key"] as! String,
            type: map["type"] as! String,
            status: map["status"] as! String,
            error: map["error"] as! String,
            attributes: map["attributes"] as! [Any],
            orders: map["orders"] as? [Any]?
        )
    }
}
