import XCTest
@testable import SecurityKit

@available(iOS 15.0, macOS 10.15, *)
final class SecurityKitAuthenticationTests: XCTestCase {
    func testMFAAuthentication() {
        let expectation = self.expectation(description: "MFA Authentication should succeed")
        SecurityKitAuthentication.authenticate { success in
            XCTAssertTrue(success)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}