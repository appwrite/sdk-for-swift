
/// Project
public class Project {

    /// Project ID.
    public let id: String

    /// Project name.
    public let name: String

    /// Project description.
    public let description: String

    /// Project team ID.
    public let teamId: String

    /// Project logo file ID.
    public let logo: String

    /// Project website URL.
    public let url: String

    /// Company legal name.
    public let legalName: String

    /// Country code in [ISO 3166-1](http://en.wikipedia.org/wiki/ISO_3166-1) two-character format.
    public let legalCountry: String

    /// State name.
    public let legalState: String

    /// City name.
    public let legalCity: String

    /// Company Address.
    public let legalAddress: String

    /// Company Tax ID.
    public let legalTaxId: String

    /// Max users allowed. 0 is unlimited.
    public let usersAuthLimit: Bool

    /// List of Platforms.
    public let platforms: [Platform]

    /// List of Webhooks.
    public let webhooks: [Webhook]

    /// List of API Keys.
    public let keys: [Key]

    /// List of Domains.
    public let domains: [Domain]

    /// List of Tasks.
    public let tasks: [Task]

    /// Amazon OAuth app ID.
    public let usersOauth2AmazonAppid: String

    /// Amazon OAuth secret ID.
    public let usersOauth2AmazonSecret: String

    /// Apple OAuth app ID.
    public let usersOauth2AppleAppid: String

    /// Apple OAuth secret ID.
    public let usersOauth2AppleSecret: String

    /// BitBucket OAuth app ID.
    public let usersOauth2BitbucketAppid: String

    /// BitBucket OAuth secret ID.
    public let usersOauth2BitbucketSecret: String

    /// Bitly OAuth app ID.
    public let usersOauth2BitlyAppid: String

    /// Bitly OAuth secret ID.
    public let usersOauth2BitlySecret: String

    /// Box OAuth app ID.
    public let usersOauth2BoxAppid: String

    /// Box OAuth secret ID.
    public let usersOauth2BoxSecret: String

    /// Discord OAuth app ID.
    public let usersOauth2DiscordAppid: String

    /// Discord OAuth secret ID.
    public let usersOauth2DiscordSecret: String

    /// Dropbox OAuth app ID.
    public let usersOauth2DropboxAppid: String

    /// Dropbox OAuth secret ID.
    public let usersOauth2DropboxSecret: String

    /// Facebook OAuth app ID.
    public let usersOauth2FacebookAppid: String

    /// Facebook OAuth secret ID.
    public let usersOauth2FacebookSecret: String

    /// GitHub OAuth app ID.
    public let usersOauth2GithubAppid: String

    /// GitHub OAuth secret ID.
    public let usersOauth2GithubSecret: String

    /// GitLab OAuth app ID.
    public let usersOauth2GitlabAppid: String

    /// GitLab OAuth secret ID.
    public let usersOauth2GitlabSecret: String

    /// Google OAuth app ID.
    public let usersOauth2GoogleAppid: String

    /// Google OAuth secret ID.
    public let usersOauth2GoogleSecret: String

    /// LinkedIn OAuth app ID.
    public let usersOauth2LinkedinAppid: String

    /// LinkedIn OAuth secret ID.
    public let usersOauth2LinkedinSecret: String

    /// Microsoft OAuth app ID.
    public let usersOauth2MicrosoftAppid: String

    /// Microsoft OAuth secret ID.
    public let usersOauth2MicrosoftSecret: String

    /// PayPal OAuth app ID.
    public let usersOauth2PaypalAppid: String

    /// PayPal OAuth secret ID.
    public let usersOauth2PaypalSecret: String

    /// PayPal OAuth app ID.
    public let usersOauth2PaypalSandboxAppid: String

    /// PayPal OAuth secret ID.
    public let usersOauth2PaypalSandboxSecret: String

    /// Salesforce OAuth app ID.
    public let usersOauth2SalesforceAppid: String

    /// Salesforce OAuth secret ID.
    public let usersOauth2SalesforceSecret: String

    /// Slack OAuth app ID.
    public let usersOauth2SlackAppid: String

    /// Slack OAuth secret ID.
    public let usersOauth2SlackSecret: String

    /// Spotify OAuth app ID.
    public let usersOauth2SpotifyAppid: String

    /// Spotify OAuth secret ID.
    public let usersOauth2SpotifySecret: String

    /// Tradeshift OAuth app ID.
    public let usersOauth2TradeshiftAppid: String

    /// Tradeshift OAuth secret ID.
    public let usersOauth2TradeshiftSecret: String

    /// Tradeshift OAuth app ID.
    public let usersOauth2TradeshiftBoxAppid: String

    /// Tradeshift OAuth secret ID.
    public let usersOauth2TradeshiftBoxSecret: String

    /// Twitch OAuth app ID.
    public let usersOauth2TwitchAppid: String

    /// Twitch OAuth secret ID.
    public let usersOauth2TwitchSecret: String

    /// VK OAuth app ID.
    public let usersOauth2VkAppid: String

    /// VK OAuth secret ID.
    public let usersOauth2VkSecret: String

    /// Yahoo OAuth app ID.
    public let usersOauth2YahooAppid: String

    /// Yahoo OAuth secret ID.
    public let usersOauth2YahooSecret: String

    /// Yandex OAuth app ID.
    public let usersOauth2YandexAppid: String

    /// Yandex OAuth secret ID.
    public let usersOauth2YandexSecret: String

    /// WordPress OAuth app ID.
    public let usersOauth2WordpressAppid: String

    /// WordPress OAuth secret ID.
    public let usersOauth2WordpressSecret: String

    /// Mock OAuth app ID.
    public let usersOauth2MockAppid: String

    /// Mock OAuth secret ID.
    public let usersOauth2MockSecret: String

    /// Email/Password auth method status
    public let usersAuthEmailPassword: Bool

    /// Anonymous auth method status
    public let usersAuthAnonymous: Bool

    /// Invites auth method status
    public let usersAuthInvites: Bool

    /// JWT auth method status
    public let usersAuthJWT: Bool

    /// Phone auth method status
    public let usersAuthPhone: Bool

    init(
        id: String,
        name: String,
        description: String,
        teamId: String,
        logo: String,
        url: String,
        legalName: String,
        legalCountry: String,
        legalState: String,
        legalCity: String,
        legalAddress: String,
        legalTaxId: String,
        usersAuthLimit: Bool,
        platforms: [Platform],
        webhooks: [Webhook],
        keys: [Key],
        domains: [Domain],
        tasks: [Task],
        usersOauth2AmazonAppid: String,
        usersOauth2AmazonSecret: String,
        usersOauth2AppleAppid: String,
        usersOauth2AppleSecret: String,
        usersOauth2BitbucketAppid: String,
        usersOauth2BitbucketSecret: String,
        usersOauth2BitlyAppid: String,
        usersOauth2BitlySecret: String,
        usersOauth2BoxAppid: String,
        usersOauth2BoxSecret: String,
        usersOauth2DiscordAppid: String,
        usersOauth2DiscordSecret: String,
        usersOauth2DropboxAppid: String,
        usersOauth2DropboxSecret: String,
        usersOauth2FacebookAppid: String,
        usersOauth2FacebookSecret: String,
        usersOauth2GithubAppid: String,
        usersOauth2GithubSecret: String,
        usersOauth2GitlabAppid: String,
        usersOauth2GitlabSecret: String,
        usersOauth2GoogleAppid: String,
        usersOauth2GoogleSecret: String,
        usersOauth2LinkedinAppid: String,
        usersOauth2LinkedinSecret: String,
        usersOauth2MicrosoftAppid: String,
        usersOauth2MicrosoftSecret: String,
        usersOauth2PaypalAppid: String,
        usersOauth2PaypalSecret: String,
        usersOauth2PaypalSandboxAppid: String,
        usersOauth2PaypalSandboxSecret: String,
        usersOauth2SalesforceAppid: String,
        usersOauth2SalesforceSecret: String,
        usersOauth2SlackAppid: String,
        usersOauth2SlackSecret: String,
        usersOauth2SpotifyAppid: String,
        usersOauth2SpotifySecret: String,
        usersOauth2TradeshiftAppid: String,
        usersOauth2TradeshiftSecret: String,
        usersOauth2TradeshiftBoxAppid: String,
        usersOauth2TradeshiftBoxSecret: String,
        usersOauth2TwitchAppid: String,
        usersOauth2TwitchSecret: String,
        usersOauth2VkAppid: String,
        usersOauth2VkSecret: String,
        usersOauth2YahooAppid: String,
        usersOauth2YahooSecret: String,
        usersOauth2YandexAppid: String,
        usersOauth2YandexSecret: String,
        usersOauth2WordpressAppid: String,
        usersOauth2WordpressSecret: String,
        usersOauth2MockAppid: String,
        usersOauth2MockSecret: String,
        usersAuthEmailPassword: Bool,
        usersAuthAnonymous: Bool,
        usersAuthInvites: Bool,
        usersAuthJWT: Bool,
        usersAuthPhone: Bool
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.teamId = teamId
        self.logo = logo
        self.url = url
        self.legalName = legalName
        self.legalCountry = legalCountry
        self.legalState = legalState
        self.legalCity = legalCity
        self.legalAddress = legalAddress
        self.legalTaxId = legalTaxId
        self.usersAuthLimit = usersAuthLimit
        self.platforms = platforms
        self.webhooks = webhooks
        self.keys = keys
        self.domains = domains
        self.tasks = tasks
        self.usersOauth2AmazonAppid = usersOauth2AmazonAppid
        self.usersOauth2AmazonSecret = usersOauth2AmazonSecret
        self.usersOauth2AppleAppid = usersOauth2AppleAppid
        self.usersOauth2AppleSecret = usersOauth2AppleSecret
        self.usersOauth2BitbucketAppid = usersOauth2BitbucketAppid
        self.usersOauth2BitbucketSecret = usersOauth2BitbucketSecret
        self.usersOauth2BitlyAppid = usersOauth2BitlyAppid
        self.usersOauth2BitlySecret = usersOauth2BitlySecret
        self.usersOauth2BoxAppid = usersOauth2BoxAppid
        self.usersOauth2BoxSecret = usersOauth2BoxSecret
        self.usersOauth2DiscordAppid = usersOauth2DiscordAppid
        self.usersOauth2DiscordSecret = usersOauth2DiscordSecret
        self.usersOauth2DropboxAppid = usersOauth2DropboxAppid
        self.usersOauth2DropboxSecret = usersOauth2DropboxSecret
        self.usersOauth2FacebookAppid = usersOauth2FacebookAppid
        self.usersOauth2FacebookSecret = usersOauth2FacebookSecret
        self.usersOauth2GithubAppid = usersOauth2GithubAppid
        self.usersOauth2GithubSecret = usersOauth2GithubSecret
        self.usersOauth2GitlabAppid = usersOauth2GitlabAppid
        self.usersOauth2GitlabSecret = usersOauth2GitlabSecret
        self.usersOauth2GoogleAppid = usersOauth2GoogleAppid
        self.usersOauth2GoogleSecret = usersOauth2GoogleSecret
        self.usersOauth2LinkedinAppid = usersOauth2LinkedinAppid
        self.usersOauth2LinkedinSecret = usersOauth2LinkedinSecret
        self.usersOauth2MicrosoftAppid = usersOauth2MicrosoftAppid
        self.usersOauth2MicrosoftSecret = usersOauth2MicrosoftSecret
        self.usersOauth2PaypalAppid = usersOauth2PaypalAppid
        self.usersOauth2PaypalSecret = usersOauth2PaypalSecret
        self.usersOauth2PaypalSandboxAppid = usersOauth2PaypalSandboxAppid
        self.usersOauth2PaypalSandboxSecret = usersOauth2PaypalSandboxSecret
        self.usersOauth2SalesforceAppid = usersOauth2SalesforceAppid
        self.usersOauth2SalesforceSecret = usersOauth2SalesforceSecret
        self.usersOauth2SlackAppid = usersOauth2SlackAppid
        self.usersOauth2SlackSecret = usersOauth2SlackSecret
        self.usersOauth2SpotifyAppid = usersOauth2SpotifyAppid
        self.usersOauth2SpotifySecret = usersOauth2SpotifySecret
        self.usersOauth2TradeshiftAppid = usersOauth2TradeshiftAppid
        self.usersOauth2TradeshiftSecret = usersOauth2TradeshiftSecret
        self.usersOauth2TradeshiftBoxAppid = usersOauth2TradeshiftBoxAppid
        self.usersOauth2TradeshiftBoxSecret = usersOauth2TradeshiftBoxSecret
        self.usersOauth2TwitchAppid = usersOauth2TwitchAppid
        self.usersOauth2TwitchSecret = usersOauth2TwitchSecret
        self.usersOauth2VkAppid = usersOauth2VkAppid
        self.usersOauth2VkSecret = usersOauth2VkSecret
        self.usersOauth2YahooAppid = usersOauth2YahooAppid
        self.usersOauth2YahooSecret = usersOauth2YahooSecret
        self.usersOauth2YandexAppid = usersOauth2YandexAppid
        self.usersOauth2YandexSecret = usersOauth2YandexSecret
        self.usersOauth2WordpressAppid = usersOauth2WordpressAppid
        self.usersOauth2WordpressSecret = usersOauth2WordpressSecret
        self.usersOauth2MockAppid = usersOauth2MockAppid
        self.usersOauth2MockSecret = usersOauth2MockSecret
        self.usersAuthEmailPassword = usersAuthEmailPassword
        self.usersAuthAnonymous = usersAuthAnonymous
        self.usersAuthInvites = usersAuthInvites
        self.usersAuthJWT = usersAuthJWT
        self.usersAuthPhone = usersAuthPhone
    }

    public static func from(map: [String: Any]) -> Project {
        return Project(
            id: map["$id"] as! String,
            name: map["name"] as! String,
            description: map["description"] as! String,
            teamId: map["teamId"] as! String,
            logo: map["logo"] as! String,
            url: map["url"] as! String,
            legalName: map["legalName"] as! String,
            legalCountry: map["legalCountry"] as! String,
            legalState: map["legalState"] as! String,
            legalCity: map["legalCity"] as! String,
            legalAddress: map["legalAddress"] as! String,
            legalTaxId: map["legalTaxId"] as! String,
            usersAuthLimit: map["usersAuthLimit"] as! Bool,
            platforms: (map["platforms"] as! [[String: Any]]).map { Platform.from(map: $0) },
            webhooks: (map["webhooks"] as! [[String: Any]]).map { Webhook.from(map: $0) },
            keys: (map["keys"] as! [[String: Any]]).map { Key.from(map: $0) },
            domains: (map["domains"] as! [[String: Any]]).map { Domain.from(map: $0) },
            tasks: (map["tasks"] as! [[String: Any]]).map { Task.from(map: $0) },
            usersOauth2AmazonAppid: map["usersOauth2AmazonAppid"] as! String,
            usersOauth2AmazonSecret: map["usersOauth2AmazonSecret"] as! String,
            usersOauth2AppleAppid: map["usersOauth2AppleAppid"] as! String,
            usersOauth2AppleSecret: map["usersOauth2AppleSecret"] as! String,
            usersOauth2BitbucketAppid: map["usersOauth2BitbucketAppid"] as! String,
            usersOauth2BitbucketSecret: map["usersOauth2BitbucketSecret"] as! String,
            usersOauth2BitlyAppid: map["usersOauth2BitlyAppid"] as! String,
            usersOauth2BitlySecret: map["usersOauth2BitlySecret"] as! String,
            usersOauth2BoxAppid: map["usersOauth2BoxAppid"] as! String,
            usersOauth2BoxSecret: map["usersOauth2BoxSecret"] as! String,
            usersOauth2DiscordAppid: map["usersOauth2DiscordAppid"] as! String,
            usersOauth2DiscordSecret: map["usersOauth2DiscordSecret"] as! String,
            usersOauth2DropboxAppid: map["usersOauth2DropboxAppid"] as! String,
            usersOauth2DropboxSecret: map["usersOauth2DropboxSecret"] as! String,
            usersOauth2FacebookAppid: map["usersOauth2FacebookAppid"] as! String,
            usersOauth2FacebookSecret: map["usersOauth2FacebookSecret"] as! String,
            usersOauth2GithubAppid: map["usersOauth2GithubAppid"] as! String,
            usersOauth2GithubSecret: map["usersOauth2GithubSecret"] as! String,
            usersOauth2GitlabAppid: map["usersOauth2GitlabAppid"] as! String,
            usersOauth2GitlabSecret: map["usersOauth2GitlabSecret"] as! String,
            usersOauth2GoogleAppid: map["usersOauth2GoogleAppid"] as! String,
            usersOauth2GoogleSecret: map["usersOauth2GoogleSecret"] as! String,
            usersOauth2LinkedinAppid: map["usersOauth2LinkedinAppid"] as! String,
            usersOauth2LinkedinSecret: map["usersOauth2LinkedinSecret"] as! String,
            usersOauth2MicrosoftAppid: map["usersOauth2MicrosoftAppid"] as! String,
            usersOauth2MicrosoftSecret: map["usersOauth2MicrosoftSecret"] as! String,
            usersOauth2PaypalAppid: map["usersOauth2PaypalAppid"] as! String,
            usersOauth2PaypalSecret: map["usersOauth2PaypalSecret"] as! String,
            usersOauth2PaypalSandboxAppid: map["usersOauth2PaypalSandboxAppid"] as! String,
            usersOauth2PaypalSandboxSecret: map["usersOauth2PaypalSandboxSecret"] as! String,
            usersOauth2SalesforceAppid: map["usersOauth2SalesforceAppid"] as! String,
            usersOauth2SalesforceSecret: map["usersOauth2SalesforceSecret"] as! String,
            usersOauth2SlackAppid: map["usersOauth2SlackAppid"] as! String,
            usersOauth2SlackSecret: map["usersOauth2SlackSecret"] as! String,
            usersOauth2SpotifyAppid: map["usersOauth2SpotifyAppid"] as! String,
            usersOauth2SpotifySecret: map["usersOauth2SpotifySecret"] as! String,
            usersOauth2TradeshiftAppid: map["usersOauth2TradeshiftAppid"] as! String,
            usersOauth2TradeshiftSecret: map["usersOauth2TradeshiftSecret"] as! String,
            usersOauth2TradeshiftBoxAppid: map["usersOauth2TradeshiftBoxAppid"] as! String,
            usersOauth2TradeshiftBoxSecret: map["usersOauth2TradeshiftBoxSecret"] as! String,
            usersOauth2TwitchAppid: map["usersOauth2TwitchAppid"] as! String,
            usersOauth2TwitchSecret: map["usersOauth2TwitchSecret"] as! String,
            usersOauth2VkAppid: map["usersOauth2VkAppid"] as! String,
            usersOauth2VkSecret: map["usersOauth2VkSecret"] as! String,
            usersOauth2YahooAppid: map["usersOauth2YahooAppid"] as! String,
            usersOauth2YahooSecret: map["usersOauth2YahooSecret"] as! String,
            usersOauth2YandexAppid: map["usersOauth2YandexAppid"] as! String,
            usersOauth2YandexSecret: map["usersOauth2YandexSecret"] as! String,
            usersOauth2WordpressAppid: map["usersOauth2WordpressAppid"] as! String,
            usersOauth2WordpressSecret: map["usersOauth2WordpressSecret"] as! String,
            usersOauth2MockAppid: map["usersOauth2MockAppid"] as! String,
            usersOauth2MockSecret: map["usersOauth2MockSecret"] as! String,
            usersAuthEmailPassword: map["usersAuthEmailPassword"] as! Bool,
            usersAuthAnonymous: map["usersAuthAnonymous"] as! Bool,
            usersAuthInvites: map["usersAuthInvites"] as! Bool,
            usersAuthJWT: map["usersAuthJWT"] as! Bool,
            usersAuthPhone: map["usersAuthPhone"] as! Bool
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "name": name as Any,
            "description": description as Any,
            "teamId": teamId as Any,
            "logo": logo as Any,
            "url": url as Any,
            "legalName": legalName as Any,
            "legalCountry": legalCountry as Any,
            "legalState": legalState as Any,
            "legalCity": legalCity as Any,
            "legalAddress": legalAddress as Any,
            "legalTaxId": legalTaxId as Any,
            "usersAuthLimit": usersAuthLimit as Any,
            "platforms": platforms.map { $0.toMap() } as Any,
            "webhooks": webhooks.map { $0.toMap() } as Any,
            "keys": keys.map { $0.toMap() } as Any,
            "domains": domains.map { $0.toMap() } as Any,
            "tasks": tasks.map { $0.toMap() } as Any,
            "usersOauth2AmazonAppid": usersOauth2AmazonAppid as Any,
            "usersOauth2AmazonSecret": usersOauth2AmazonSecret as Any,
            "usersOauth2AppleAppid": usersOauth2AppleAppid as Any,
            "usersOauth2AppleSecret": usersOauth2AppleSecret as Any,
            "usersOauth2BitbucketAppid": usersOauth2BitbucketAppid as Any,
            "usersOauth2BitbucketSecret": usersOauth2BitbucketSecret as Any,
            "usersOauth2BitlyAppid": usersOauth2BitlyAppid as Any,
            "usersOauth2BitlySecret": usersOauth2BitlySecret as Any,
            "usersOauth2BoxAppid": usersOauth2BoxAppid as Any,
            "usersOauth2BoxSecret": usersOauth2BoxSecret as Any,
            "usersOauth2DiscordAppid": usersOauth2DiscordAppid as Any,
            "usersOauth2DiscordSecret": usersOauth2DiscordSecret as Any,
            "usersOauth2DropboxAppid": usersOauth2DropboxAppid as Any,
            "usersOauth2DropboxSecret": usersOauth2DropboxSecret as Any,
            "usersOauth2FacebookAppid": usersOauth2FacebookAppid as Any,
            "usersOauth2FacebookSecret": usersOauth2FacebookSecret as Any,
            "usersOauth2GithubAppid": usersOauth2GithubAppid as Any,
            "usersOauth2GithubSecret": usersOauth2GithubSecret as Any,
            "usersOauth2GitlabAppid": usersOauth2GitlabAppid as Any,
            "usersOauth2GitlabSecret": usersOauth2GitlabSecret as Any,
            "usersOauth2GoogleAppid": usersOauth2GoogleAppid as Any,
            "usersOauth2GoogleSecret": usersOauth2GoogleSecret as Any,
            "usersOauth2LinkedinAppid": usersOauth2LinkedinAppid as Any,
            "usersOauth2LinkedinSecret": usersOauth2LinkedinSecret as Any,
            "usersOauth2MicrosoftAppid": usersOauth2MicrosoftAppid as Any,
            "usersOauth2MicrosoftSecret": usersOauth2MicrosoftSecret as Any,
            "usersOauth2PaypalAppid": usersOauth2PaypalAppid as Any,
            "usersOauth2PaypalSecret": usersOauth2PaypalSecret as Any,
            "usersOauth2PaypalSandboxAppid": usersOauth2PaypalSandboxAppid as Any,
            "usersOauth2PaypalSandboxSecret": usersOauth2PaypalSandboxSecret as Any,
            "usersOauth2SalesforceAppid": usersOauth2SalesforceAppid as Any,
            "usersOauth2SalesforceSecret": usersOauth2SalesforceSecret as Any,
            "usersOauth2SlackAppid": usersOauth2SlackAppid as Any,
            "usersOauth2SlackSecret": usersOauth2SlackSecret as Any,
            "usersOauth2SpotifyAppid": usersOauth2SpotifyAppid as Any,
            "usersOauth2SpotifySecret": usersOauth2SpotifySecret as Any,
            "usersOauth2TradeshiftAppid": usersOauth2TradeshiftAppid as Any,
            "usersOauth2TradeshiftSecret": usersOauth2TradeshiftSecret as Any,
            "usersOauth2TradeshiftBoxAppid": usersOauth2TradeshiftBoxAppid as Any,
            "usersOauth2TradeshiftBoxSecret": usersOauth2TradeshiftBoxSecret as Any,
            "usersOauth2TwitchAppid": usersOauth2TwitchAppid as Any,
            "usersOauth2TwitchSecret": usersOauth2TwitchSecret as Any,
            "usersOauth2VkAppid": usersOauth2VkAppid as Any,
            "usersOauth2VkSecret": usersOauth2VkSecret as Any,
            "usersOauth2YahooAppid": usersOauth2YahooAppid as Any,
            "usersOauth2YahooSecret": usersOauth2YahooSecret as Any,
            "usersOauth2YandexAppid": usersOauth2YandexAppid as Any,
            "usersOauth2YandexSecret": usersOauth2YandexSecret as Any,
            "usersOauth2WordpressAppid": usersOauth2WordpressAppid as Any,
            "usersOauth2WordpressSecret": usersOauth2WordpressSecret as Any,
            "usersOauth2MockAppid": usersOauth2MockAppid as Any,
            "usersOauth2MockSecret": usersOauth2MockSecret as Any,
            "usersAuthEmailPassword": usersAuthEmailPassword as Any,
            "usersAuthAnonymous": usersAuthAnonymous as Any,
            "usersAuthInvites": usersAuthInvites as Any,
            "usersAuthJWT": usersAuthJWT as Any,
            "usersAuthPhone": usersAuthPhone as Any
        ]
    }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
}