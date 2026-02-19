# Change Log

## 15.1.0

* Added new query filtering helpers: Query.contains(_:, value:), Query.containsAny(_:, value: [Any]), and Query.containsAll(_:, value: [Any]) for string and array attributes.
* Extended Databases and TablesDB attribute creation APIs with an optional encrypt: Bool flag to support encrypted attributes (Longtext, Mediumtext, Text, Varchar) across multiple attribute types.
* Updated README and package manifest references to reflect versioning and compatibility: server compatibility noted as Appwrite server version 1.8.x; package dependency snippet updated from 15.1.0 to 15.0.0.
* Updated Client header x-sdk-version to 15.0.0 to align with the release.
* Removed deprecated/auxiliary CI templates and an autoclose workflow (internal maintenance).

## 13.3.0

* Add `total` parameter to list queries allowing skipping counting rows in a table for improved performance
* Add `Operator` class for atomic modification of rows via update, bulk update, upsert, and bulk upsert operations
* Add `createResendProvider` and `updateResendProvider` methods to `Messaging` service

## 13.2.2

* Fix issue: Missing AppwriteEnums dependency causing build failure

## 13.2.1

* Add transaction support for Databases and TablesDB

## 13.1.0

* Deprecate `createVerification` method in `Account` service
* Add `createEmailVerification` method in `Account` service

## 10.2.0

* Update sdk to use swift-native doc comments instead of jsdoc styled comments as per [Swift Documentation Comments](https://github.com/swiftlang/swift/blob/main/docs/DocumentationComments.md)
* Add `incrementDocumentAttribute` and `decrementDocumentAttribute` support to `Databases` service
* Add `gif` support to `ImageFormat` enum
* Add `sequence` support to `Document` model
* Add `dart38` and `flutter332` support to runtime models

## 10.1.0

* Adds `upsertDocument` method
* Adds warnings to bulk operation methods
* Adds the new `encrypt` attribute
* Adds runtimes: `flutter332` and `dart38`
* Fix `select` Queries by updating internal attributes like `id`, `createdAt`, `updatedAt` etc. to be optional in `Document` model.
* Fix `listCollection` errors by updating `attributes` typing
* Fix querying datetime values by properly encoding URLs

## 10.0.0

* Add `<REGION>` to doc examples due to the new multi region endpoints
* Add doc examples and methods for bulk api transactions: `createDocuments`, `deleteDocuments` etc.
* Add doc examples, class and methods for new `Sites` service
* Add doc examples, class and methods for new `Tokens` service
* Add enums for `BuildRuntime `, `Adapter`, `Framework`, `DeploymentDownloadType` and `VCSDeploymentType`
* Update enum for `runtimes` with Pythonml312, Dart219, Flutter327 and Flutter329
* Add `token` param to `getFilePreview` and `getFileView` for File tokens usage
* Add `queries` and `search` params to `listMemberships` method
* Remove `search` param from `listExecutions` method

## 9.0.0

* Fix requests failing by removing `Content-Type` header from `GET` and `HEAD` requests

## 8.0.0

* Remove redundant titles from method descriptions.
* Add `codable` models
* Ensure response attribute in `AppwriteException` is always string

## 7.0.0

* Fix pong response & chunked upload
