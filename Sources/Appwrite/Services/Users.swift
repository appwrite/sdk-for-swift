import AsyncHTTPClient
import Foundation
import NIO
import AppwriteModels

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
    open func list(
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.UserList {
        let path: String = "/users"
        let params: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.UserList = { dict in
            return AppwriteModels.UserList.from(map: dict)
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
    ) async throws -> AppwriteModels.User {
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
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
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
    ) async throws -> AppwriteModels.User {
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
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
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
    ) async throws -> AppwriteModels.User {
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
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
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
    ) async throws -> AppwriteModels.User {
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
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
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
    ) async throws -> AppwriteModels.User {
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
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
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
    ) async throws -> AppwriteModels.User {
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
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
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
    ) async throws -> AppwriteModels.User {
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
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
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
    ) async throws -> AppwriteModels.User {
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
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
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
    ) async throws -> AppwriteModels.User {
        var path: String = "/users/{userId}"
        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId        )
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
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
        var path: String = "/users/{userId}"
        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId        )
        let params: [String: Any?] = [:]

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
    open func updateEmail(
        userId: String,
        email: String
    ) async throws -> AppwriteModels.User {
        var path: String = "/users/{userId}/email"
        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId        )
        let params: [String: Any?] = [
            "email": email
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
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
    /// Get User Logs
    ///
    /// Get the user activity logs list by its unique ID.
    ///
    /// @param String userId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    open func getLogs(
        userId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.LogList {
        var path: String = "/users/{userId}/logs"
        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId        )
        let params: [String: Any?] = [
            "queries": queries
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.LogList = { dict in
            return AppwriteModels.LogList.from(map: dict)
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
    /// Get User Memberships
    ///
    /// Get the user membership list by its unique ID.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func getMemberships(
        userId: String
    ) async throws -> AppwriteModels.MembershipList {
        var path: String = "/users/{userId}/memberships"
        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId        )
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.MembershipList = { dict in
            return AppwriteModels.MembershipList.from(map: dict)
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
    open func updateName(
        userId: String,
        name: String
    ) async throws -> AppwriteModels.User {
        var path: String = "/users/{userId}/name"
        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId        )
        let params: [String: Any?] = [
            "name": name
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
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
    ) async throws -> AppwriteModels.User {
        var path: String = "/users/{userId}/password"
        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId        )
        let params: [String: Any?] = [
            "password": password
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
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
    ) async throws -> AppwriteModels.User {
        var path: String = "/users/{userId}/phone"
        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId        )
        let params: [String: Any?] = [
            "number": number
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
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
    ) async throws -> AppwriteModels.Preferences {
        var path: String = "/users/{userId}/prefs"
        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId        )
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Preferences = { dict in
            return AppwriteModels.Preferences.from(map: dict)
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
    ) async throws -> AppwriteModels.Preferences {
        var path: String = "/users/{userId}/prefs"
        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId        )
        let params: [String: Any?] = [
            "prefs": prefs
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Preferences = { dict in
            return AppwriteModels.Preferences.from(map: dict)
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
    /// Get User Sessions
    ///
    /// Get the user sessions list by its unique ID.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func getSessions(
        userId: String
    ) async throws -> AppwriteModels.SessionList {
        var path: String = "/users/{userId}/sessions"
        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId        )
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.SessionList = { dict in
            return AppwriteModels.SessionList.from(map: dict)
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
        var path: String = "/users/{userId}/sessions"
        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId        )
        let params: [String: Any?] = [:]

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
        var path: String = "/users/{userId}/sessions/{sessionId}"
        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId        )
        path = path.replacingOccurrences(
          of: "{sessionId}",
          with: sessionId        )
        let params: [String: Any?] = [:]

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
    open func updateStatus(
        userId: String,
        status: Bool
    ) async throws -> AppwriteModels.User {
        var path: String = "/users/{userId}/status"
        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId        )
        let params: [String: Any?] = [
            "status": status
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
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
    ) async throws -> AppwriteModels.User {
        var path: String = "/users/{userId}/verification"
        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId        )
        let params: [String: Any?] = [
            "emailVerification": emailVerification
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
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
    ) async throws -> AppwriteModels.User {
        var path: String = "/users/{userId}/verification/phone"
        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId        )
        let params: [String: Any?] = [
            "phoneVerification": phoneVerification
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func list(
        queries: [String]? = nil,
        search: String? = nil,
        completion: ((Result<AppwriteModels.UserList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await list(
                    queries: queries,
                    search: search
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func create(
        userId: String,
        email: String? = nil,
        phone: String? = nil,
        password: String? = nil,
        name: String? = nil,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await create(
                    userId: userId,
                    email: email,
                    phone: phone,
                    password: password,
                    name: name
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func createArgon2User(
        userId: String,
        email: String,
        password: String,
        name: String? = nil,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createArgon2User(
                    userId: userId,
                    email: email,
                    password: password,
                    name: name
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func createBcryptUser(
        userId: String,
        email: String,
        password: String,
        name: String? = nil,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createBcryptUser(
                    userId: userId,
                    email: email,
                    password: password,
                    name: name
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func createMD5User(
        userId: String,
        email: String,
        password: String,
        name: String? = nil,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createMD5User(
                    userId: userId,
                    email: email,
                    password: password,
                    name: name
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func createPHPassUser(
        userId: String,
        email: String,
        password: String,
        name: String? = nil,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createPHPassUser(
                    userId: userId,
                    email: email,
                    password: password,
                    name: name
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func createScryptUser(
        userId: String,
        email: String,
        password: String,
        passwordSalt: String,
        passwordCpu: Int,
        passwordMemory: Int,
        passwordParallel: Int,
        passwordLength: Int,
        name: String? = nil,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createScryptUser(
                    userId: userId,
                    email: email,
                    password: password,
                    passwordSalt: passwordSalt,
                    passwordCpu: passwordCpu,
                    passwordMemory: passwordMemory,
                    passwordParallel: passwordParallel,
                    passwordLength: passwordLength,
                    name: name
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func createScryptModifiedUser(
        userId: String,
        email: String,
        password: String,
        passwordSalt: String,
        passwordSaltSeparator: String,
        passwordSignerKey: String,
        name: String? = nil,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createScryptModifiedUser(
                    userId: userId,
                    email: email,
                    password: password,
                    passwordSalt: passwordSalt,
                    passwordSaltSeparator: passwordSaltSeparator,
                    passwordSignerKey: passwordSignerKey,
                    name: name
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func createSHAUser(
        userId: String,
        email: String,
        password: String,
        passwordVersion: String? = nil,
        name: String? = nil,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createSHAUser(
                    userId: userId,
                    email: email,
                    password: password,
                    passwordVersion: passwordVersion,
                    name: name
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func get(
        userId: String,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await get(
                    userId: userId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func delete(
        userId: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await delete(
                    userId: userId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func updateEmail(
        userId: String,
        email: String,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updateEmail(
                    userId: userId,
                    email: email
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get User Logs
    ///
    /// Get the user activity logs list by its unique ID.
    ///
    /// @param String userId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getLogs(
        userId: String,
        queries: [String]? = nil,
        completion: ((Result<AppwriteModels.LogList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getLogs(
                    userId: userId,
                    queries: queries
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get User Memberships
    ///
    /// Get the user membership list by its unique ID.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getMemberships(
        userId: String,
        completion: ((Result<AppwriteModels.MembershipList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getMemberships(
                    userId: userId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func updateName(
        userId: String,
        name: String,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updateName(
                    userId: userId,
                    name: name
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func updatePassword(
        userId: String,
        password: String,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updatePassword(
                    userId: userId,
                    password: password
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func updatePhone(
        userId: String,
        number: String,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updatePhone(
                    userId: userId,
                    number: number
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func getPrefs(
        userId: String,
        completion: ((Result<AppwriteModels.Preferences, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getPrefs(
                    userId: userId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func updatePrefs(
        userId: String,
        prefs: Any,
        completion: ((Result<AppwriteModels.Preferences, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updatePrefs(
                    userId: userId,
                    prefs: prefs
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get User Sessions
    ///
    /// Get the user sessions list by its unique ID.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getSessions(
        userId: String,
        completion: ((Result<AppwriteModels.SessionList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getSessions(
                    userId: userId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func deleteSessions(
        userId: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await deleteSessions(
                    userId: userId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func deleteSession(
        userId: String,
        sessionId: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await deleteSession(
                    userId: userId,
                    sessionId: sessionId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func updateStatus(
        userId: String,
        status: Bool,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updateStatus(
                    userId: userId,
                    status: status
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func updateEmailVerification(
        userId: String,
        emailVerification: Bool,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updateEmailVerification(
                    userId: userId,
                    emailVerification: emailVerification
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func updatePhoneVerification(
        userId: String,
        phoneVerification: Bool,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updatePhoneVerification(
                    userId: userId,
                    phoneVerification: phoneVerification
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

}
