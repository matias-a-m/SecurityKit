import XCTest
@testable import SecurityKit

@available(iOS 15.0, macOS 10.15, *)
final class SecurityKitKeychainTests: XCTestCase {
    func testKeychainSaveRetrieve() {
        let data = "Test Data".data(using: .utf8)!
        SecurityKitKeychain.saveToKeychain(data: data, forKey: "TestKey")
        let retrievedData = SecurityKitKeychain.retrieveFromKeychain(forKey: "TestKey")
        XCTAssertNotNil(retrievedData)
        XCTAssertEqual(data, retrievedData)
    }
}