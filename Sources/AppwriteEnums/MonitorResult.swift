import Foundation

public enum MonitorResult: String, Codable, CustomStringConvertible {
    case ok = "ok"
    case dnsFailed = "dns_failed"
    case connectRefused = "connect_refused"
    case connectTimeout = "connect_timeout"
    case connectFailed = "connect_failed"
    case tlsFailed = "tls_failed"
    case tlsExpiring = "tls_expiring"
    case statusMismatch = "status_mismatch"
    case answerMismatch = "answer_mismatch"
    case smtpRejected = "smtp_rejected"
    case targetDenied = "target_denied"
    case timeout = "timeout"
    case ruleMatched = "rule_matched"

    public var description: String {
        return rawValue
    }
}
