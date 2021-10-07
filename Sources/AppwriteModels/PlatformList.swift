
/// Platforms List
public class PlatformList {

    /// Total sum of items in the list.
    public let sum: Int

    /// List of platforms.
    public let platforms: [Platform]

    init(
        sum: Int,
        platforms: [Platform]
    ) {
        self.sum = sum
        self.platforms = platforms
    }

    public static func from(map: [String: Any]) -> PlatformList {
        return PlatformList(
            sum: map["sum"] as! Int,
            platforms: (map["platforms"] as! [[String: Any]]).map { Platform.from(map: $0) } as! [Platform]
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "sum": sum as Any,
            "platforms": platforms.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                                                                                                            
}