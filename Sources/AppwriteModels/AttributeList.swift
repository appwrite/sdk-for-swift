
/// Attributes List
public class AttributeList {

    /// Total sum of items in the list.
    public let sum: Int

    /// List of attributes.
    public let attributes: [Any]

    init(
        sum: Int,
        attributes: [Any]
    ) {
        self.sum = sum
        self.attributes = attributes
    }

    public static func from(map: [String: Any]) -> AttributeList {
        return AttributeList(
            sum: map["sum"] as! Int,
            attributes: map["attributes"] as! [Any]
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "sum": sum as Any,
            "attributes": attributes as Any
        ]
    }
            
}