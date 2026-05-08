import Foundation
import JSONCodable

/// Mock Numbers List
open class MockNumberList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case mockNumbers = "mockNumbers"
    }

    /// Total number of mockNumbers that matched your query.
    public let total: Int
    /// List of mockNumbers.
    public let mockNumbers: [MockNumber]

    init(
        total: Int,
        mockNumbers: [MockNumber]
    ) {
        self.total = total
        self.mockNumbers = mockNumbers
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.mockNumbers = try container.decode([MockNumber].self, forKey: .mockNumbers)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(mockNumbers, forKey: .mockNumbers)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "mockNumbers": mockNumbers.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> MockNumberList {
        return MockNumberList(
            total: map["total"] as! Int,
            mockNumbers: (map["mockNumbers"] as! [[String: Any]]).map { MockNumber.from(map: $0) }
        )
    }
}
