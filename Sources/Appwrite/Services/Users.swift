import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Users service allows you to manage your project users.
open class Users: Service {

    ///
    /// Get a list of all the project's users. You can use the query params to
    /// filter your results.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.UserList<T>
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

        let apiHeaders: [String: String] = [:]

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
    /// Get a list of all the project's users. You can use the query params to
    /// filter your results.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.UserList<T>
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
    /// Create a new user.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String (optional)
    ///   - phone: String (optional)
    ///   - password: String (optional)
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Create a new user.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String (optional)
    ///   - phone: String (optional)
    ///   - password: String (optional)
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Create a new user. Password provided must be hashed with the
    /// [Argon2](https://en.wikipedia.org/wiki/Argon2) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String
    ///   - password: String
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Create a new user. Password provided must be hashed with the
    /// [Argon2](https://en.wikipedia.org/wiki/Argon2) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String
    ///   - password: String
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Create a new user. Password provided must be hashed with the
    /// [Bcrypt](https://en.wikipedia.org/wiki/Bcrypt) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String
    ///   - password: String
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Create a new user. Password provided must be hashed with the
    /// [Bcrypt](https://en.wikipedia.org/wiki/Bcrypt) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String
    ///   - password: String
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Get identities for all users.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.IdentityList
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

        let apiHeaders: [String: String] = [:]

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
    /// Delete an identity by its unique ID.
    ///
    /// - Parameters:
    ///   - identityId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
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
    /// Create a new user. Password provided must be hashed with the
    /// [MD5](https://en.wikipedia.org/wiki/MD5) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String
    ///   - password: String
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Create a new user. Password provided must be hashed with the
    /// [MD5](https://en.wikipedia.org/wiki/MD5) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String
    ///   - password: String
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Create a new user. Password provided must be hashed with the
    /// [PHPass](https://www.openwall.com/phpass/) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String
    ///   - password: String
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Create a new user. Password provided must be hashed with the
    /// [PHPass](https://www.openwall.com/phpass/) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String
    ///   - password: String
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Create a new user. Password provided must be hashed with the
    /// [Scrypt](https://github.com/Tarsnap/scrypt) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String
    ///   - password: String
    ///   - passwordSalt: String
    ///   - passwordCpu: Int
    ///   - passwordMemory: Int
    ///   - passwordParallel: Int
    ///   - passwordLength: Int
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Create a new user. Password provided must be hashed with the
    /// [Scrypt](https://github.com/Tarsnap/scrypt) algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String
    ///   - password: String
    ///   - passwordSalt: String
    ///   - passwordCpu: Int
    ///   - passwordMemory: Int
    ///   - passwordParallel: Int
    ///   - passwordLength: Int
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Create a new user. Password provided must be hashed with the [Scrypt
    /// Modified](https://gist.github.com/Meldiron/eecf84a0225eccb5a378d45bb27462cc)
    /// algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String
    ///   - password: String
    ///   - passwordSalt: String
    ///   - passwordSaltSeparator: String
    ///   - passwordSignerKey: String
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Create a new user. Password provided must be hashed with the [Scrypt
    /// Modified](https://gist.github.com/Meldiron/eecf84a0225eccb5a378d45bb27462cc)
    /// algorithm. Use the [POST
    /// /users](https://appwrite.io/docs/server/users#usersCreate) endpoint to
    /// create users with a plain text password.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String
    ///   - password: String
    ///   - passwordSalt: String
    ///   - passwordSaltSeparator: String
    ///   - passwordSignerKey: String
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Create a new user. Password provided must be hashed with the
    /// [SHA](https://en.wikipedia.org/wiki/Secure_Hash_Algorithm) algorithm. Use
    /// the [POST /users](https://appwrite.io/docs/server/users#usersCreate)
    /// endpoint to create users with a plain text password.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String
    ///   - password: String
    ///   - passwordVersion: PasswordHash (optional)
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
    ///
    open func createSHAUser<T>(
        userId: String,
        email: String,
        password: String,
        passwordVersion: PasswordHash? = nil,
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
    /// Create a new user. Password provided must be hashed with the
    /// [SHA](https://en.wikipedia.org/wiki/Secure_Hash_Algorithm) algorithm. Use
    /// the [POST /users](https://appwrite.io/docs/server/users#usersCreate)
    /// endpoint to create users with a plain text password.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String
    ///   - password: String
    ///   - passwordVersion: PasswordHash (optional)
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
    ///
    open func createSHAUser(
        userId: String,
        email: String,
        password: String,
        passwordVersion: PasswordHash? = nil,
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
    /// Get a user by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
    ///
    open func get<T>(
        userId: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/{userId}"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

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
    /// Get a user by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Delete a user by its unique ID, thereby releasing it's ID. Since ID is
    /// released and can be reused, all user-related resources like documents or
    /// storage files should be deleted before user deletion. If you want to keep
    /// ID reserved, use the
    /// [updateStatus](https://appwrite.io/docs/server/users#usersUpdateStatus)
    /// endpoint instead.
    ///
    /// - Parameters:
    ///   - userId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
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
    /// Update the user email by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Update the user email by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - email: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Use this endpoint to create a JSON Web Token for user by its unique ID. You
    /// can use the resulting JWT to authenticate on behalf of the user. The JWT
    /// secret will become invalid if the session it uses gets deleted.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - sessionId: String (optional)
    ///   - duration: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Jwt
    ///
    open func createJWT(
        userId: String,
        sessionId: String? = nil,
        duration: Int? = nil
    ) async throws -> AppwriteModels.Jwt {
        let apiPath: String = "/users/{userId}/jwts"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any?] = [
            "sessionId": sessionId,
            "duration": duration
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Jwt = { response in
            return AppwriteModels.Jwt.from(map: response as! [String: Any])
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
    /// Update the user labels by its unique ID. 
    /// 
    /// Labels can be used to grant access to resources. While teams are a way for
    /// user's to share access to a resource, labels can be defined by the
    /// developer to grant access without an invitation. See the [Permissions
    /// docs](https://appwrite.io/docs/permissions) for more info.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - labels: [String]
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Update the user labels by its unique ID. 
    /// 
    /// Labels can be used to grant access to resources. While teams are a way for
    /// user's to share access to a resource, labels can be defined by the
    /// developer to grant access without an invitation. See the [Permissions
    /// docs](https://appwrite.io/docs/permissions) for more info.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - labels: [String]
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Get the user activity logs list by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.LogList
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

        let apiHeaders: [String: String] = [:]

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
    /// Get the user membership list by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MembershipList
    ///
    open func listMemberships(
        userId: String,
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.MembershipList {
        let apiPath: String = "/users/{userId}/memberships"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let apiHeaders: [String: String] = [:]

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
    /// Enable or disable MFA on a user account.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - mfa: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `Users.updateMFA` instead.")
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
    /// Enable or disable MFA on a user account.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - mfa: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `Users.updateMFA` instead.")
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
    /// Enable or disable MFA on a user account.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - mfa: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
    ///
    open func updateMFA<T>(
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
    /// Enable or disable MFA on a user account.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - mfa: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
    ///
    open func updateMFA(
        userId: String,
        mfa: Bool
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updateMFA(
            userId: userId,
            mfa: mfa,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Delete an authenticator app.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - type: AuthenticatorType
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `Users.deleteMFAAuthenticator` instead.")
    open func deleteMfaAuthenticator(
        userId: String,
        type: AuthenticatorType
    ) async throws -> Any {
        let apiPath: String = "/users/{userId}/mfa/authenticators/{type}"
            .replacingOccurrences(of: "{userId}", with: userId)
            .replacingOccurrences(of: "{type}", with: type.rawValue)

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
    /// Delete an authenticator app.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - type: AuthenticatorType
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteMFAAuthenticator(
        userId: String,
        type: AuthenticatorType
    ) async throws -> Any {
        let apiPath: String = "/users/{userId}/mfa/authenticators/{type}"
            .replacingOccurrences(of: "{userId}", with: userId)
            .replacingOccurrences(of: "{type}", with: type.rawValue)

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
    /// List the factors available on the account to be used as a MFA challange.
    ///
    /// - Parameters:
    ///   - userId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MfaFactors
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `Users.listMFAFactors` instead.")
    open func listMfaFactors(
        userId: String
    ) async throws -> AppwriteModels.MfaFactors {
        let apiPath: String = "/users/{userId}/mfa/factors"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

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
    /// List the factors available on the account to be used as a MFA challange.
    ///
    /// - Parameters:
    ///   - userId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MfaFactors
    ///
    open func listMFAFactors(
        userId: String
    ) async throws -> AppwriteModels.MfaFactors {
        let apiPath: String = "/users/{userId}/mfa/factors"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

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
    /// Get recovery codes that can be used as backup for MFA flow by User ID.
    /// Before getting codes, they must be generated using
    /// [createMfaRecoveryCodes](/docs/references/cloud/client-web/account#createMfaRecoveryCodes)
    /// method.
    ///
    /// - Parameters:
    ///   - userId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MfaRecoveryCodes
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `Users.getMFARecoveryCodes` instead.")
    open func getMfaRecoveryCodes(
        userId: String
    ) async throws -> AppwriteModels.MfaRecoveryCodes {
        let apiPath: String = "/users/{userId}/mfa/recovery-codes"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

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
    /// Get recovery codes that can be used as backup for MFA flow by User ID.
    /// Before getting codes, they must be generated using
    /// [createMfaRecoveryCodes](/docs/references/cloud/client-web/account#createMfaRecoveryCodes)
    /// method.
    ///
    /// - Parameters:
    ///   - userId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MfaRecoveryCodes
    ///
    open func getMFARecoveryCodes(
        userId: String
    ) async throws -> AppwriteModels.MfaRecoveryCodes {
        let apiPath: String = "/users/{userId}/mfa/recovery-codes"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

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
    /// Regenerate recovery codes that can be used as backup for MFA flow by User
    /// ID. Before regenerating codes, they must be first generated using
    /// [createMfaRecoveryCodes](/docs/references/cloud/client-web/account#createMfaRecoveryCodes)
    /// method.
    ///
    /// - Parameters:
    ///   - userId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MfaRecoveryCodes
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `Users.updateMFARecoveryCodes` instead.")
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
    /// Regenerate recovery codes that can be used as backup for MFA flow by User
    /// ID. Before regenerating codes, they must be first generated using
    /// [createMfaRecoveryCodes](/docs/references/cloud/client-web/account#createMfaRecoveryCodes)
    /// method.
    ///
    /// - Parameters:
    ///   - userId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MfaRecoveryCodes
    ///
    open func updateMFARecoveryCodes(
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
    /// Generate recovery codes used as backup for MFA flow for User ID. Recovery
    /// codes can be used as a MFA verification type in
    /// [createMfaChallenge](/docs/references/cloud/client-web/account#createMfaChallenge)
    /// method by client SDK.
    ///
    /// - Parameters:
    ///   - userId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MfaRecoveryCodes
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `Users.createMFARecoveryCodes` instead.")
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
    /// Generate recovery codes used as backup for MFA flow for User ID. Recovery
    /// codes can be used as a MFA verification type in
    /// [createMfaChallenge](/docs/references/cloud/client-web/account#createMfaChallenge)
    /// method by client SDK.
    ///
    /// - Parameters:
    ///   - userId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MfaRecoveryCodes
    ///
    open func createMFARecoveryCodes(
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
    /// Update the user name by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - name: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Update the user name by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - name: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Update the user password by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - password: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Update the user password by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - password: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Update the user phone by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - number: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Update the user phone by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - number: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Get the user preferences by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Preferences<T>
    ///
    open func getPrefs<T>(
        userId: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Preferences<T> {
        let apiPath: String = "/users/{userId}/prefs"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

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
    /// Get the user preferences by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Preferences<T>
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
    /// Update the user preferences by its unique ID. The object you pass is stored
    /// as is, and replaces any previous value. The maximum allowed prefs size is
    /// 64kB and throws error if exceeded.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - prefs: Any
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Preferences<T>
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
    /// Update the user preferences by its unique ID. The object you pass is stored
    /// as is, and replaces any previous value. The maximum allowed prefs size is
    /// 64kB and throws error if exceeded.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - prefs: Any
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Preferences<T>
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
    /// Get the user sessions list by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.SessionList
    ///
    open func listSessions(
        userId: String
    ) async throws -> AppwriteModels.SessionList {
        let apiPath: String = "/users/{userId}/sessions"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

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
    /// Creates a session for a user. Returns an immediately usable session object.
    /// 
    /// If you want to generate a token for a custom authentication flow, use the
    /// [POST
    /// /users/{userId}/tokens](https://appwrite.io/docs/server/users#createToken)
    /// endpoint.
    ///
    /// - Parameters:
    ///   - userId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Session
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
    /// Delete all user's sessions by using the user's unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
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
    /// Delete a user sessions by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - sessionId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
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
    /// Update the user status by its unique ID. Use this endpoint as an
    /// alternative to deleting a user if you want to keep user's ID reserved.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - status: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Update the user status by its unique ID. Use this endpoint as an
    /// alternative to deleting a user if you want to keep user's ID reserved.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - status: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// List the messaging targets that are associated with a user.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.TargetList
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

        let apiHeaders: [String: String] = [:]

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
    /// Create a messaging target.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - targetId: String
    ///   - providerType: MessagingProviderType
    ///   - identifier: String
    ///   - providerId: String (optional)
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Target
    ///
    open func createTarget(
        userId: String,
        targetId: String,
        providerType: MessagingProviderType,
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
    /// Get a user's push notification target by ID.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - targetId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Target
    ///
    open func getTarget(
        userId: String,
        targetId: String
    ) async throws -> AppwriteModels.Target {
        let apiPath: String = "/users/{userId}/targets/{targetId}"
            .replacingOccurrences(of: "{userId}", with: userId)
            .replacingOccurrences(of: "{targetId}", with: targetId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

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
    /// Update a messaging target.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - targetId: String
    ///   - identifier: String (optional)
    ///   - providerId: String (optional)
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Target
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
    /// Delete a messaging target.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - targetId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
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
    /// Returns a token with a secret key for creating a session. Use the user ID
    /// and secret and submit a request to the [PUT
    /// /account/sessions/token](https://appwrite.io/docs/references/cloud/client-web/account#createSession)
    /// endpoint to complete the login process.
    /// 
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - length: Int (optional)
    ///   - expire: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Token
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
    /// Update the user email verification status by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - emailVerification: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Update the user email verification status by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - emailVerification: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Update the user phone verification status by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - phoneVerification: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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
    /// Update the user phone verification status by its unique ID.
    ///
    /// - Parameters:
    ///   - userId: String
    ///   - phoneVerification: Bool
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.User<T>
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