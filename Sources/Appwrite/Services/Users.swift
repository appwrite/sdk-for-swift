import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Users service allows you to manage your project users.
open class Users: Service {

    ///
    /// List users
    ///
    /// Get a list of all the project's users. You can use the query params to
    /// filter your results.
    ///
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    open func list<T>(
        queries: [String]? = nil,
        search: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.UserList<T> {
        let apiPath: String = "/users"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.UserList<T> = { response in
            return AppwriteModels.UserList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// List users
    ///
    /// Get a list of all the project's users. You can use the query params to
    /// filter your results.
    ///
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    open func list(
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.UserList<[String: AnyCodable]> {
        return try await list(
            queries: queries,
            search: search,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create user
    ///
    /// Create a new user.
    ///
    /// @param String userId
    /// @param String email
    /// @param String phone
    /// @param String password
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func create<T>(
        userId: String,
        email: String? = nil,
        phone: String? = nil,
        password: String? = nil,
        name: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "email": email,
            "phone": phone,
            "password": password,
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create user
    ///
    /// Create a new user.
    ///
    /// @param String userId
    /// @param String email
    /// @param String phone
    /// @param String password
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func create(
        userId: String,
        email: String? = nil,
        phone: String? = nil,
        password: String? = nil,
        name: String? = nil
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await create(
            userId: userId,
            email: email,
            phone: phone,
            password: password,
            name: name,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create user with Argon2 password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [Argon2](https://en.wikipedia.org/wiki/Argon2) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createArgon2User<T>(
        userId: String,
        email: String,
        password: String,
        name: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/argon2"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "email": email,
            "password": password,
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create user with Argon2 password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [Argon2](https://en.wikipedia.org/wiki/Argon2) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createArgon2User(
        userId: String,
        email: String,
        password: String,
        name: String? = nil
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await createArgon2User(
            userId: userId,
            email: email,
            password: password,
            name: name,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create user with bcrypt password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [Bcrypt](https://en.wikipedia.org/wiki/Bcrypt) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createBcryptUser<T>(
        userId: String,
        email: String,
        password: String,
        name: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/bcrypt"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "email": email,
            "password": password,
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create user with bcrypt password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [Bcrypt](https://en.wikipedia.org/wiki/Bcrypt) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createBcryptUser(
        userId: String,
        email: String,
        password: String,
        name: String? = nil
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await createBcryptUser(
            userId: userId,
            email: email,
            password: password,
            name: name,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// List Identities
    ///
    /// Get identities for all users.
    ///
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    open func listIdentities(
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.IdentityList {
        let apiPath: String = "/users/identities"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.IdentityList = { response in
            return AppwriteModels.IdentityList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Delete identity
    ///
    /// Delete an identity by its unique ID.
    ///
    /// @param String identityId
    /// @throws Exception
    /// @return array
    ///
    open func deleteIdentity(
        identityId: String
    ) async throws -> Any {
        let apiPath: String = "/users/identities/{identityId}"
            .replacingOccurrences(of: "{identityId}", with: identityId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Create user with MD5 password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [MD5](https://en.wikipedia.org/wiki/MD5) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createMD5User<T>(
        userId: String,
        email: String,
        password: String,
        name: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/md5"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "email": email,
            "password": password,
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create user with MD5 password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [MD5](https://en.wikipedia.org/wiki/MD5) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createMD5User(
        userId: String,
        email: String,
        password: String,
        name: String? = nil
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await createMD5User(
            userId: userId,
            email: email,
            password: password,
            name: name,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create user with PHPass password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [PHPass](https://www.openwall.com/phpass/) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createPHPassUser<T>(
        userId: String,
        email: String,
        password: String,
        name: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/phpass"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "email": email,
            "password": password,
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create user with PHPass password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [PHPass](https://www.openwall.com/phpass/) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createPHPassUser(
        userId: String,
        email: String,
        password: String,
        name: String? = nil
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await createPHPassUser(
            userId: userId,
            email: email,
            password: password,
            name: name,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create user with Scrypt password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [Scrypt](https://github.com/Tarsnap/scrypt) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param String passwordSalt
    /// @param Int passwordCpu
    /// @param Int passwordMemory
    /// @param Int passwordParallel
    /// @param Int passwordLength
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createScryptUser<T>(
        userId: String,
        email: String,
        password: String,
        passwordSalt: String,
        passwordCpu: Int,
        passwordMemory: Int,
        passwordParallel: Int,
        passwordLength: Int,
        name: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/scrypt"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "email": email,
            "password": password,
            "passwordSalt": passwordSalt,
            "passwordCpu": passwordCpu,
            "passwordMemory": passwordMemory,
            "passwordParallel": passwordParallel,
            "passwordLength": passwordLength,
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create user with Scrypt password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [Scrypt](https://github.com/Tarsnap/scrypt) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param String passwordSalt
    /// @param Int passwordCpu
    /// @param Int passwordMemory
    /// @param Int passwordParallel
    /// @param Int passwordLength
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createScryptUser(
        userId: String,
        email: String,
        password: String,
        passwordSalt: String,
        passwordCpu: Int,
        passwordMemory: Int,
        passwordParallel: Int,
        passwordLength: Int,
        name: String? = nil
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await createScryptUser(
            userId: userId,
            email: email,
            password: password,
            passwordSalt: passwordSalt,
            passwordCpu: passwordCpu,
            passwordMemory: passwordMemory,
            passwordParallel: passwordParallel,
            passwordLength: passwordLength,
            name: name,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create user with Scrypt modified password
    ///
    /// Create a new user. Password provided must be hashed with the [Scrypt
    /// Modified](https://gist.github.com/Meldiron/eecf84a0225eccb5a378d45bb27462cc)
    /// algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param String passwordSalt
    /// @param String passwordSaltSeparator
    /// @param String passwordSignerKey
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createScryptModifiedUser<T>(
        userId: String,
        email: String,
        password: String,
        passwordSalt: String,
        passwordSaltSeparator: String,
        passwordSignerKey: String,
        name: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/scrypt-modified"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "email": email,
            "password": password,
            "passwordSalt": passwordSalt,
            "passwordSaltSeparator": passwordSaltSeparator,
            "passwordSignerKey": passwordSignerKey,
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create user with Scrypt modified password
    ///
    /// Create a new user. Password provided must be hashed with the [Scrypt
    /// Modified](https://gist.github.com/Meldiron/eecf84a0225eccb5a378d45bb27462cc)
    /// algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param String passwordSalt
    /// @param String passwordSaltSeparator
    /// @param String passwordSignerKey
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createScryptModifiedUser(
        userId: String,
        email: String,
        password: String,
        passwordSalt: String,
        passwordSaltSeparator: String,
        passwordSignerKey: String,
        name: String? = nil
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await createScryptModifiedUser(
            userId: userId,
            email: email,
            password: password,
            passwordSalt: passwordSalt,
            passwordSaltSeparator: passwordSaltSeparator,
            passwordSignerKey: passwordSignerKey,
            name: name,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create user with SHA password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [SHA](https://en.wikipedia.org/wiki/Secure_Hash_Algorithm) algorithm. Use
    /// the [POST /users](https://appwrite.io/docs/server/users#usersCreate)
    /// endpoint to create users with a plain text password.
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param AppwriteEnums.PasswordHash passwordVersion
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createSHAUser<T>(
        userId: String,
        email: String,
        password: String,
        passwordVersion: AppwriteEnums.PasswordHash? = nil,
        name: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/sha"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "email": email,
            "password": password,
            "passwordVersion": passwordVersion,
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create user with SHA password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [SHA](https://en.wikipedia.org/wiki/Secure_Hash_Algorithm) algorithm. Use
    /// the [POST /users](https://appwrite.io/docs/server/users#usersCreate)
    /// endpoint to create users with a plain text password.
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param AppwriteEnums.PasswordHash passwordVersion
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createSHAUser(
        userId: String,
        email: String,
        password: String,
        passwordVersion: AppwriteEnums.PasswordHash? = nil,
        name: String? = nil
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await createSHAUser(
            userId: userId,
            email: email,
            password: password,
            passwordVersion: passwordVersion,
            name: name,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Get user
    ///
    /// Get a user by its unique ID.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func get<T>(
        userId: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/{userId}"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Get user
    ///
    /// Get a user by its unique ID.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func get(
        userId: String
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await get(
            userId: userId,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Delete user
    ///
    /// Delete a user by its unique ID, thereby releasing it's ID. Since ID is
    /// released and can be reused, all user-related resources like documents or
    /// storage files should be deleted before user deletion. If you want to keep
    /// ID reserved, use the
    /// [updateStatus](https://appwrite.io/docs/server/users#usersUpdateStatus)
    /// endpoint instead.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func delete(
        userId: String
    ) async throws -> Any {
        let apiPath: String = "/users/{userId}"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Update email
    ///
    /// Update the user email by its unique ID.
    ///
    /// @param String userId
    /// @param String email
    /// @throws Exception
    /// @return array
    ///
    open func updateEmail<T>(
        userId: String,
        email: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/{userId}/email"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any?] = [
            "email": email
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update email
    ///
    /// Update the user email by its unique ID.
    ///
    /// @param String userId
    /// @param String email
    /// @throws Exception
    /// @return array
    ///
    open func updateEmail(
        userId: String,
        email: String
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updateEmail(
            userId: userId,
            email: email,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update user labels
    ///
    /// Update the user labels by its unique ID. 
    /// 
    /// Labels can be used to grant access to resources. While teams are a way for
    /// user's to share access to a resource, labels can be defined by the
    /// developer to grant access without an invitation. See the [Permissions
    /// docs](https://appwrite.io/docs/permissions) for more info.
    ///
    /// @param String userId
    /// @param [String] labels
    /// @throws Exception
    /// @return array
    ///
    open func updateLabels<T>(
        userId: String,
        labels: [String],
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/{userId}/labels"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any?] = [
            "labels": labels
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update user labels
    ///
    /// Update the user labels by its unique ID. 
    /// 
    /// Labels can be used to grant access to resources. While teams are a way for
    /// user's to share access to a resource, labels can be defined by the
    /// developer to grant access without an invitation. See the [Permissions
    /// docs](https://appwrite.io/docs/permissions) for more info.
    ///
    /// @param String userId
    /// @param [String] labels
    /// @throws Exception
    /// @return array
    ///
    open func updateLabels(
        userId: String,
        labels: [String]
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updateLabels(
            userId: userId,
            labels: labels,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// List user logs
    ///
    /// Get the user activity logs list by its unique ID.
    ///
    /// @param String userId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    open func listLogs(
        userId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.LogList {
        let apiPath: String = "/users/{userId}/logs"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.LogList = { response in
            return AppwriteModels.LogList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// List user memberships
    ///
    /// Get the user membership list by its unique ID.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func listMemberships(
        userId: String
    ) async throws -> AppwriteModels.MembershipList {
        let apiPath: String = "/users/{userId}/memberships"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.MembershipList = { response in
            return AppwriteModels.MembershipList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update MFA
    ///
    /// Enable or disable MFA on a user account.
    ///
    /// @param String userId
    /// @param Bool mfa
    /// @throws Exception
    /// @return array
    ///
    open func updateMfa<T>(
        userId: String,
        mfa: Bool,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/{userId}/mfa"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any?] = [
            "mfa": mfa
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update MFA
    ///
    /// Enable or disable MFA on a user account.
    ///
    /// @param String userId
    /// @param Bool mfa
    /// @throws Exception
    /// @return array
    ///
    open func updateMfa(
        userId: String,
        mfa: Bool
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updateMfa(
            userId: userId,
            mfa: mfa,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Delete Authenticator
    ///
    /// Delete an authenticator app.
    ///
    /// @param String userId
    /// @param AppwriteEnums.AuthenticatorType type
    /// @throws Exception
    /// @return array
    ///
    open func deleteMfaAuthenticator<T>(
        userId: String,
        type: AppwriteEnums.AuthenticatorType,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/{userId}/mfa/authenticators/{type}"
            .replacingOccurrences(of: "{userId}", with: userId)
            .replacingOccurrences(of: "{type}", with: type.rawValue)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Delete Authenticator
    ///
    /// Delete an authenticator app.
    ///
    /// @param String userId
    /// @param AppwriteEnums.AuthenticatorType type
    /// @throws Exception
    /// @return array
    ///
    open func deleteMfaAuthenticator(
        userId: String,
        type: AppwriteEnums.AuthenticatorType
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await deleteMfaAuthenticator(
            userId: userId,
            type: type,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// List Factors
    ///
    /// List the factors available on the account to be used as a MFA challange.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func listMfaFactors(
        userId: String
    ) async throws -> AppwriteModels.MfaFactors {
        let apiPath: String = "/users/{userId}/mfa/factors"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.MfaFactors = { response in
            return AppwriteModels.MfaFactors.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Get MFA Recovery Codes
    ///
    /// Get recovery codes that can be used as backup for MFA flow by User ID.
    /// Before getting codes, they must be generated using
    /// [createMfaRecoveryCodes](/docs/references/cloud/client-web/account#createMfaRecoveryCodes)
    /// method.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func getMfaRecoveryCodes(
        userId: String
    ) async throws -> AppwriteModels.MfaRecoveryCodes {
        let apiPath: String = "/users/{userId}/mfa/recovery-codes"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.MfaRecoveryCodes = { response in
            return AppwriteModels.MfaRecoveryCodes.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Regenerate MFA Recovery Codes
    ///
    /// Regenerate recovery codes that can be used as backup for MFA flow by User
    /// ID. Before regenerating codes, they must be first generated using
    /// [createMfaRecoveryCodes](/docs/references/cloud/client-web/account#createMfaRecoveryCodes)
    /// method.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func updateMfaRecoveryCodes(
        userId: String
    ) async throws -> AppwriteModels.MfaRecoveryCodes {
        let apiPath: String = "/users/{userId}/mfa/recovery-codes"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.MfaRecoveryCodes = { response in
            return AppwriteModels.MfaRecoveryCodes.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create MFA Recovery Codes
    ///
    /// Generate recovery codes used as backup for MFA flow for User ID. Recovery
    /// codes can be used as a MFA verification type in
    /// [createMfaChallenge](/docs/references/cloud/client-web/account#createMfaChallenge)
    /// method by client SDK.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func createMfaRecoveryCodes(
        userId: String
    ) async throws -> AppwriteModels.MfaRecoveryCodes {
        let apiPath: String = "/users/{userId}/mfa/recovery-codes"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.MfaRecoveryCodes = { response in
            return AppwriteModels.MfaRecoveryCodes.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update name
    ///
    /// Update the user name by its unique ID.
    ///
    /// @param String userId
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func updateName<T>(
        userId: String,
        name: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/{userId}/name"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any?] = [
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update name
    ///
    /// Update the user name by its unique ID.
    ///
    /// @param String userId
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func updateName(
        userId: String,
        name: String
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updateName(
            userId: userId,
            name: name,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update password
    ///
    /// Update the user password by its unique ID.
    ///
    /// @param String userId
    /// @param String password
    /// @throws Exception
    /// @return array
    ///
    open func updatePassword<T>(
        userId: String,
        password: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/{userId}/password"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any?] = [
            "password": password
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update password
    ///
    /// Update the user password by its unique ID.
    ///
    /// @param String userId
    /// @param String password
    /// @throws Exception
    /// @return array
    ///
    open func updatePassword(
        userId: String,
        password: String
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updatePassword(
            userId: userId,
            password: password,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update phone
    ///
    /// Update the user phone by its unique ID.
    ///
    /// @param String userId
    /// @param String number
    /// @throws Exception
    /// @return array
    ///
    open func updatePhone<T>(
        userId: String,
        number: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/{userId}/phone"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any?] = [
            "number": number
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update phone
    ///
    /// Update the user phone by its unique ID.
    ///
    /// @param String userId
    /// @param String number
    /// @throws Exception
    /// @return array
    ///
    open func updatePhone(
        userId: String,
        number: String
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updatePhone(
            userId: userId,
            number: number,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Get user preferences
    ///
    /// Get the user preferences by its unique ID.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func getPrefs<T>(
        userId: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Preferences<T> {
        let apiPath: String = "/users/{userId}/prefs"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Preferences<T> = { response in
            return AppwriteModels.Preferences.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Get user preferences
    ///
    /// Get the user preferences by its unique ID.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func getPrefs(
        userId: String
    ) async throws -> AppwriteModels.Preferences<[String: AnyCodable]> {
        return try await getPrefs(
            userId: userId,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update user preferences
    ///
    /// Update the user preferences by its unique ID. The object you pass is stored
    /// as is, and replaces any previous value. The maximum allowed prefs size is
    /// 64kB and throws error if exceeded.
    ///
    /// @param String userId
    /// @param Any prefs
    /// @throws Exception
    /// @return array
    ///
    open func updatePrefs<T>(
        userId: String,
        prefs: Any,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Preferences<T> {
        let apiPath: String = "/users/{userId}/prefs"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any?] = [
            "prefs": prefs
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Preferences<T> = { response in
            return AppwriteModels.Preferences.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update user preferences
    ///
    /// Update the user preferences by its unique ID. The object you pass is stored
    /// as is, and replaces any previous value. The maximum allowed prefs size is
    /// 64kB and throws error if exceeded.
    ///
    /// @param String userId
    /// @param Any prefs
    /// @throws Exception
    /// @return array
    ///
    open func updatePrefs(
        userId: String,
        prefs: Any
    ) async throws -> AppwriteModels.Preferences<[String: AnyCodable]> {
        return try await updatePrefs(
            userId: userId,
            prefs: prefs,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// List user sessions
    ///
    /// Get the user sessions list by its unique ID.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func listSessions(
        userId: String
    ) async throws -> AppwriteModels.SessionList {
        let apiPath: String = "/users/{userId}/sessions"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.SessionList = { response in
            return AppwriteModels.SessionList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create session
    ///
    /// Creates a session for a user. Returns an immediately usable session object.
    /// 
    /// If you want to generate a token for a custom authentication flow, use the
    /// [POST
    /// /users/{userId}/tokens](https://appwrite.io/docs/server/users#createToken)
    /// endpoint.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func createSession(
        userId: String
    ) async throws -> AppwriteModels.Session {
        let apiPath: String = "/users/{userId}/sessions"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Session = { response in
            return AppwriteModels.Session.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Delete user sessions
    ///
    /// Delete all user's sessions by using the user's unique ID.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func deleteSessions(
        userId: String
    ) async throws -> Any {
        let apiPath: String = "/users/{userId}/sessions"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Delete user session
    ///
    /// Delete a user sessions by its unique ID.
    ///
    /// @param String userId
    /// @param String sessionId
    /// @throws Exception
    /// @return array
    ///
    open func deleteSession(
        userId: String,
        sessionId: String
    ) async throws -> Any {
        let apiPath: String = "/users/{userId}/sessions/{sessionId}"
            .replacingOccurrences(of: "{userId}", with: userId)
            .replacingOccurrences(of: "{sessionId}", with: sessionId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Update user status
    ///
    /// Update the user status by its unique ID. Use this endpoint as an
    /// alternative to deleting a user if you want to keep user's ID reserved.
    ///
    /// @param String userId
    /// @param Bool status
    /// @throws Exception
    /// @return array
    ///
    open func updateStatus<T>(
        userId: String,
        status: Bool,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/{userId}/status"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any?] = [
            "status": status
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update user status
    ///
    /// Update the user status by its unique ID. Use this endpoint as an
    /// alternative to deleting a user if you want to keep user's ID reserved.
    ///
    /// @param String userId
    /// @param Bool status
    /// @throws Exception
    /// @return array
    ///
    open func updateStatus(
        userId: String,
        status: Bool
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updateStatus(
            userId: userId,
            status: status,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// List User Targets
    ///
    /// List the messaging targets that are associated with a user.
    ///
    /// @param String userId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    open func listTargets(
        userId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.TargetList {
        let apiPath: String = "/users/{userId}/targets"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.TargetList = { response in
            return AppwriteModels.TargetList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create User Target
    ///
    /// Create a messaging target.
    ///
    /// @param String userId
    /// @param String targetId
    /// @param AppwriteEnums.MessagingProviderType providerType
    /// @param String identifier
    /// @param String providerId
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createTarget(
        userId: String,
        targetId: String,
        providerType: AppwriteEnums.MessagingProviderType,
        identifier: String,
        providerId: String? = nil,
        name: String? = nil
    ) async throws -> AppwriteModels.Target {
        let apiPath: String = "/users/{userId}/targets"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any?] = [
            "targetId": targetId,
            "providerType": providerType,
            "identifier": identifier,
            "providerId": providerId,
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Target = { response in
            return AppwriteModels.Target.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Get User Target
    ///
    /// Get a user's push notification target by ID.
    ///
    /// @param String userId
    /// @param String targetId
    /// @throws Exception
    /// @return array
    ///
    open func getTarget(
        userId: String,
        targetId: String
    ) async throws -> AppwriteModels.Target {
        let apiPath: String = "/users/{userId}/targets/{targetId}"
            .replacingOccurrences(of: "{userId}", with: userId)
            .replacingOccurrences(of: "{targetId}", with: targetId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Target = { response in
            return AppwriteModels.Target.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update User target
    ///
    /// Update a messaging target.
    ///
    /// @param String userId
    /// @param String targetId
    /// @param String identifier
    /// @param String providerId
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func updateTarget(
        userId: String,
        targetId: String,
        identifier: String? = nil,
        providerId: String? = nil,
        name: String? = nil
    ) async throws -> AppwriteModels.Target {
        let apiPath: String = "/users/{userId}/targets/{targetId}"
            .replacingOccurrences(of: "{userId}", with: userId)
            .replacingOccurrences(of: "{targetId}", with: targetId)

        let apiParams: [String: Any?] = [
            "identifier": identifier,
            "providerId": providerId,
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Target = { response in
            return AppwriteModels.Target.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Delete user target
    ///
    /// Delete a messaging target.
    ///
    /// @param String userId
    /// @param String targetId
    /// @throws Exception
    /// @return array
    ///
    open func deleteTarget(
        userId: String,
        targetId: String
    ) async throws -> Any {
        let apiPath: String = "/users/{userId}/targets/{targetId}"
            .replacingOccurrences(of: "{userId}", with: userId)
            .replacingOccurrences(of: "{targetId}", with: targetId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Create token
    ///
    /// Returns a token with a secret key for creating a session. Use the user ID
    /// and secret and submit a request to the [PUT
    /// /account/sessions/token](https://appwrite.io/docs/references/cloud/client-web/account#createSession)
    /// endpoint to complete the login process.
    /// 
    ///
    /// @param String userId
    /// @param Int length
    /// @param Int expire
    /// @throws Exception
    /// @return array
    ///
    open func createToken(
        userId: String,
        length: Int? = nil,
        expire: Int? = nil
    ) async throws -> AppwriteModels.Token {
        let apiPath: String = "/users/{userId}/tokens"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any?] = [
            "length": length,
            "expire": expire
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Token = { response in
            return AppwriteModels.Token.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update email verification
    ///
    /// Update the user email verification status by its unique ID.
    ///
    /// @param String userId
    /// @param Bool emailVerification
    /// @throws Exception
    /// @return array
    ///
    open func updateEmailVerification<T>(
        userId: String,
        emailVerification: Bool,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/{userId}/verification"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any?] = [
            "emailVerification": emailVerification
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update email verification
    ///
    /// Update the user email verification status by its unique ID.
    ///
    /// @param String userId
    /// @param Bool emailVerification
    /// @throws Exception
    /// @return array
    ///
    open func updateEmailVerification(
        userId: String,
        emailVerification: Bool
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updateEmailVerification(
            userId: userId,
            emailVerification: emailVerification,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update phone verification
    ///
    /// Update the user phone verification status by its unique ID.
    ///
    /// @param String userId
    /// @param Bool phoneVerification
    /// @throws Exception
    /// @return array
    ///
    open func updatePhoneVerification<T>(
        userId: String,
        phoneVerification: Bool,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/{userId}/verification/phone"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any?] = [
            "phoneVerification": phoneVerification
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update phone verification
    ///
    /// Update the user phone verification status by its unique ID.
    ///
    /// @param String userId
    /// @param Bool phoneVerification
    /// @throws Exception
    /// @return array
    ///
    open func updatePhoneVerification(
        userId: String,
        phoneVerification: Bool
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updatePhoneVerification(
            userId: userId,
            phoneVerification: phoneVerification,
            nestedType: [String: AnyCodable].self
        )
    }


}