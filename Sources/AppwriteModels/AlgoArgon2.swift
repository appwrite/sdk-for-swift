
/// AlgoArgon2
public class AlgoArgon2 {

    /// Memory used to compute hash.
    public let memoryCost: Int

    /// Amount of time consumed to compute hash
    public let timeCost: Int

    /// Number of threads used to compute hash.
    public let threads: Int

    init(
        memoryCost: Int,
        timeCost: Int,
        threads: Int
    ) {
        self.memoryCost = memoryCost
        self.timeCost = timeCost
        self.threads = threads
    }

    public static func from(map: [String: Any]) -> AlgoArgon2 {
        return AlgoArgon2(
            memoryCost: map["memoryCost"] as! Int,
            timeCost: map["timeCost"] as! Int,
            threads: map["threads"] as! Int
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "memoryCost": memoryCost as Any,
            "timeCost": timeCost as Any,
            "threads": threads as Any
        ]
    }
                
}
