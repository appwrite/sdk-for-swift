
/// AlgoScrypt
public class AlgoScrypt {

    /// CPU complexity of computed hash.
    public let costCpu: Int

    /// Memory complexity of computed hash.
    public let costMemory: Int

    /// Parallelization of computed hash.
    public let costParallel: Int

    /// Length used to compute hash.
    public let length: Int

    init(
        costCpu: Int,
        costMemory: Int,
        costParallel: Int,
        length: Int
    ) {
        self.costCpu = costCpu
        self.costMemory = costMemory
        self.costParallel = costParallel
        self.length = length
    }

    public static func from(map: [String: Any]) -> AlgoScrypt {
        return AlgoScrypt(
            costCpu: map["costCpu"] as! Int,
            costMemory: map["costMemory"] as! Int,
            costParallel: map["costParallel"] as! Int,
            length: map["length"] as! Int
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "costCpu": costCpu as Any,
            "costMemory": costMemory as Any,
            "costParallel": costParallel as Any,
            "length": length as Any
        ]
    }
                    
}