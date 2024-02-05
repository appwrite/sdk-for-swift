import Foundation

public enum PasswordVersion: String, Codable {
    case sha1 = "sha1"
    case sha224 = "sha224"
    case sha256 = "sha256"
    case sha384 = "sha384"
    case sha512224 = "sha512/224"
    case sha512256 = "sha512/256"
    case sha512 = "sha512"
    case sha3224 = "sha3-224"
    case sha3256 = "sha3-256"
    case sha3384 = "sha3-384"
    case sha3512 = "sha3-512"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
