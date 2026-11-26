import AppwriteEnums
import Foundation
import JSONCodable

/// Video profile
open class VideoProfile: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case codec = "codec"
        case videoBitRate = "videoBitRate"
        case audioBitRate = "audioBitRate"
        case width = "width"
        case height = "height"
    }

    /// Video profile ID.
    public let id: String
    /// Video profile creation time in ISO 8601 format.
    public let createdAt: String
    /// Video profile update date in ISO 8601 format.
    public let updatedAt: String
    /// Video profile name.
    public let name: String
    /// Video encode codec: one of `h264`, `hevc`, or `vp9`.
    public let codec: AppwriteEnums.VideoCodecId
    /// Target video bitrate in bits per second.
    public let videoBitRate: Int
    /// Target audio bitrate in bits per second.
    public let audioBitRate: Int
    /// Target video width in pixels.
    public let width: Int
    /// Target video height in pixels.
    public let height: Int

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        codec: AppwriteEnums.VideoCodecId,
        videoBitRate: Int,
        audioBitRate: Int,
        width: Int,
        height: Int
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.codec = codec
        self.videoBitRate = videoBitRate
        self.audioBitRate = audioBitRate
        self.width = width
        self.height = height
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.codec = AppwriteEnums.VideoCodecId(rawValue: try container.contains(.codec) ? container.decode(String.self, forKey: .codec) : "h264")!
        self.videoBitRate = try container.contains(.videoBitRate) ? container.decode(Int.self, forKey: .videoBitRate) : 0
        self.audioBitRate = try container.contains(.audioBitRate) ? container.decode(Int.self, forKey: .audioBitRate) : 0
        self.width = try container.contains(.width) ? container.decode(Int.self, forKey: .width) : 0
        self.height = try container.contains(.height) ? container.decode(Int.self, forKey: .height) : 0
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(codec.rawValue, forKey: .codec)
        try container.encode(videoBitRate, forKey: .videoBitRate)
        try container.encode(audioBitRate, forKey: .audioBitRate)
        try container.encode(width, forKey: .width)
        try container.encode(height, forKey: .height)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "codec": codec.rawValue as Any,
            "videoBitRate": videoBitRate as Any,
            "audioBitRate": audioBitRate as Any,
            "width": width as Any,
            "height": height as Any,
        ]
    }

    public static func from(map: [String: Any]) -> VideoProfile {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "name": "",
            "codec": "h264",
            "videoBitRate": 0,
            "audioBitRate": 0,
            "width": 0,
            "height": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return VideoProfile(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            codec: AppwriteEnums.VideoCodecId(rawValue: map["codec"] as! String)!,
            videoBitRate: map["videoBitRate"] as! Int,
            audioBitRate: map["audioBitRate"] as! Int,
            width: map["width"] as! Int,
            height: map["height"] as! Int
        )
    }
}
