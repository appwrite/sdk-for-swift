import AsyncHTTPClient
import Foundation
import NIO
import AppwriteModels

/// The Users service allows you to manage your project users.
open class Users: Service {

    ///
    /// List Users
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
        let path: String = "/users"

        let params: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.UserList<T> = { response in
            return AppwriteModels.UserList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// List Users
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
            search: search
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create User
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
        let path: String = "/users"

        let params: [String: Any?] = [
            "userId": userId,
            "email": email,
            "phone": phone,
            "password": password,
            "name": name
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create User
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
            name: name
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create User with Argon2 Password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [Argon2](https://en.wikipedia.org/wiki/Argon2) algorithm. Use the [POST
    /// /users](/docs/server/users#usersCreate) endpoint to create users with a
    /// plain text password.
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
        let path: String = "/users/argon2"

        let params: [String: Any?] = [
            "userId": userId,
            "email": email,
            "password": password,
            "name": name
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create User with Argon2 Password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [Argon2](https://en.wikipedia.org/wiki/Argon2) algorithm. Use the [POST
    /// /users](/docs/server/users#usersCreate) endpoint to create users with a
    /// plain text password.
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
            name: name
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create User with Bcrypt Password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [Bcrypt](https://en.wikipedia.org/wiki/Bcrypt) algorithm. Use the [POST
    /// /users](/docs/server/users#usersCreate) endpoint to create users with a
    /// plain text password.
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
        let path: String = "/users/bcrypt"

        let params: [String: Any?] = [
            "userId": userId,
            "email": email,
            "password": password,
            "name": name
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create User with Bcrypt Password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [Bcrypt](https://en.wikipedia.org/wiki/Bcrypt) algorithm. Use the [POST
    /// /users](/docs/server/users#usersCreate) endpoint to create users with a
    /// plain text password.
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
            name: name
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create User with MD5 Password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [MD5](https://en.wikipedia.org/wiki/MD5) algorithm. Use the [POST
    /// /users](/docs/server/users#usersCreate) endpoint to create users with a
    /// plain text password.
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
        let path: String = "/users/md5"

        let params: [String: Any?] = [
            "userId": userId,
            "email": email,
            "password": password,
            "name": name
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create User with MD5 Password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [MD5](https://en.wikipedia.org/wiki/MD5) algorithm. Use the [POST
    /// /users](/docs/server/users#usersCreate) endpoint to create users with a
    /// plain text password.
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
            name: name
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create User with PHPass Password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [PHPass](https://www.openwall.com/phpass/) algorithm. Use the [POST
    /// /users](/docs/server/users#usersCreate) endpoint to create users with a
    /// plain text password.
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
        let path: String = "/users/phpass"

        let params: [String: Any?] = [
            "userId": userId,
            "email": email,
            "password": password,
            "name": name
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create User with PHPass Password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [PHPass](https://www.openwall.com/phpass/) algorithm. Use the [POST
    /// /users](/docs/server/users#usersCreate) endpoint to create users with a
    /// plain text password.
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
            name: name
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create User with Scrypt Password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [Scrypt](https://github.com/Tarsnap/scrypt) algorithm. Use the [POST
    /// /users](/docs/server/users#usersCreate) endpoint to create users with a
    /// plain text password.
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
        let path: String = "/users/scrypt"

        let params: [String: Any?] = [
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

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create User with Scrypt Password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [Scrypt](https://github.com/Tarsnap/scrypt) algorithm. Use the [POST
    /// /users](/docs/server/users#usersCreate) endpoint to create users with a
    /// plain text password.
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
            name: name
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create User with Scrypt Modified Password
    ///
    /// Create a new user. Password provided must be hashed with the [Scrypt
    /// Modified](https://gist.github.com/Meldiron/eecf84a0225eccb5a378d45bb27462cc)
    /// algorithm. Use the [POST /users](/docs/server/users#usersCreate) endpoint
    /// to create users with a plain text password.
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
        let path: String = "/users/scrypt-modified"

        let params: [String: Any?] = [
            "userId": userId,
            "email": email,
            "password": password,
            "passwordSalt": passwordSalt,
            "passwordSaltSeparator": passwordSaltSeparator,
            "passwordSignerKey": passwordSignerKey,
            "name": name
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create User with Scrypt Modified Password
    ///
    /// Create a new user. Password provided must be hashed with the [Scrypt
    /// Modified](https://gist.github.com/Meldiron/eecf84a0225eccb5a378d45bb27462cc)
    /// algorithm. Use the [POST /users](/docs/server/users#usersCreate) endpoint
    /// to create users with a plain text password.
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
            name: name
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create User with SHA Password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [SHA](https://en.wikipedia.org/wiki/Secure_Hash_Algorithm) algorithm. Use
    /// the [POST /users](/docs/server/users#usersCreate) endpoint to create users
    /// with a plain text password.
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param String passwordVersion
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createSHAUser<T>(
        userId: String,
        email: String,
        password: String,
        passwordVersion: String? = nil,
        name: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let path: String = "/users/sha"

        let params: [String: Any?] = [
            "userId": userId,
            "email": email,
            "password": password,
            "passwordVersion": passwordVersion,
            "name": name
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create User with SHA Password
    ///
    /// Create a new user. Password provided must be hashed with the
    /// [SHA](https://en.wikipedia.org/wiki/Secure_Hash_Algorithm) algorithm. Use
    /// the [POST /users](/docs/server/users#usersCreate) endpoint to create users
    /// with a plain text password.
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param String passwordVersion
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createSHAUser(
        userId: String,
        email: String,
        password: String,
        passwordVersion: String? = nil,
        name: String? = nil
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await createSHAUser(
            userId: userId,
            email: email,
            password: password,
            passwordVersion: passwordVersion,
            name: name
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Get User
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
        let path: String = "/users/{userId}"
            .replacingOccurrences(of: "{userId}", with: userId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get User
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
            userId: userId
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Delete User
    ///
    /// Delete a user by its unique ID, thereby releasing it's ID. Since ID is
    /// released and can be reused, all user-related resources like documents or
    /// storage files should be deleted before user deletion. If you want to keep
    /// ID reserved, use the [updateStatus](/docs/server/users#usersUpdateStatus)
    /// endpoint instead.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func delete(
        userId: String
    ) async throws -> Any {
        let path: String = "/users/{userId}"
            .replacingOccurrences(of: "{userId}", with: userId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: path,
            headers: headers,
            params: params        )
    }

    ///
    /// Update Email
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
        let path: String = "/users/{userId}/email"
            .replacingOccurrences(of: "{userId}", with: userId)

        let params: [String: Any?] = [
            "email": email
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Email
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
            email: email
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// List User Logs
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
        let path: String = "/users/{userId}/logs"
            .replacingOccurrences(of: "{userId}", with: userId)

        let params: [String: Any?] = [
            "queries": queries
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.LogList = { response in
            return AppwriteModels.LogList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// List User Memberships
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
        let path: String = "/users/{userId}/memberships"
            .replacingOccurrences(of: "{userId}", with: userId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.MembershipList = { response in
            return AppwriteModels.MembershipList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Name
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
        let path: String = "/users/{userId}/name"
            .replacingOccurrences(of: "{userId}", with: userId)

        let params: [String: Any?] = [
            "name": name
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Name
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
            name: name
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update Password
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
        let path: String = "/users/{userId}/password"
            .replacingOccurrences(of: "{userId}", with: userId)

        let params: [String: Any?] = [
            "password": password
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Password
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
            password: password
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update Phone
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
        let path: String = "/users/{userId}/phone"
            .replacingOccurrences(of: "{userId}", with: userId)

        let params: [String: Any?] = [
            "number": number
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Phone
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
            number: number
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Get User Preferences
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
        let path: String = "/users/{userId}/prefs"
            .replacingOccurrences(of: "{userId}", with: userId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Preferences<T> = { response in
            return AppwriteModels.Preferences.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get User Preferences
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
            userId: userId
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update User Preferences
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
        prefs: T,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Preferences<T> {
        let path: String = "/users/{userId}/prefs"
            .replacingOccurrences(of: "{userId}", with: userId)

        let params: [String: Any?] = [
            "prefs": prefs
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Preferences<T> = { response in
            return AppwriteModels.Preferences.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update User Preferences
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
            prefs: prefs
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// List User Sessions
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
        let path: String = "/users/{userId}/sessions"
            .replacingOccurrences(of: "{userId}", with: userId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.SessionList = { response in
            return AppwriteModels.SessionList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Delete User Sessions
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
        let path: String = "/users/{userId}/sessions"
            .replacingOccurrences(of: "{userId}", with: userId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: path,
            headers: headers,
            params: params        )
    }

    ///
    /// Delete User Session
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
        let path: String = "/users/{userId}/sessions/{sessionId}"
            .replacingOccurrences(of: "{userId}", with: userId)
            .replacingOccurrences(of: "{sessionId}", with: sessionId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: path,
            headers: headers,
            params: params        )
    }

    ///
    /// Update User Status
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
        let path: String = "/users/{userId}/status"
            .replacingOccurrences(of: "{userId}", with: userId)

        let params: [String: Any?] = [
            "status": status
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update User Status
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
            status: status
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update Email Verification
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
        let path: String = "/users/{userId}/verification"
            .replacingOccurrences(of: "{userId}", with: userId)

        let params: [String: Any?] = [
            "emailVerification": emailVerification
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Email Verification
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
            emailVerification: emailVerification
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update Phone Verification
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
        let path: String = "/users/{userId}/verification/phone"
            .replacingOccurrences(of: "{userId}", with: userId)

        let params: [String: Any?] = [
            "phoneVerification": phoneVerification
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Phone Verification
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
            phoneVerification: phoneVerification
            nestedType: [String: AnyCodable].self
        )
    }


}