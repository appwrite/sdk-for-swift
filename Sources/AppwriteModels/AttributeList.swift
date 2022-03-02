
/// Attributes List
public class AttributeList {

    /// Total number of attributes in the given collection.
    public let total: Int

    /// List of attributes.
    public let attributes: [Any]

    init(
        total: Int,
        attributes: [Any]
    ) {
        self.total = total
        self.attributes = attributes
    }

    public static func from(map: [String: Any]) -> AttributeList {
        return AttributeList(
            total: map["total"] as! Int,
            attributes: map["attributes"] as! [Any]
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "attributes": attributes as Any
        ]
    }
            
}